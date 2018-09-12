class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :show_exceptions, :after_handler

  get '/' do
    slim :index
  end

  post '/series' do
    h = params.to_hash

    Series.create(h.tap { |hs| hs.delete(:id) })

		redirect "/#{params[:brand_id]}"
  end

  get '/failure' do
    @fail_msg = flash[:fail]
    slim :failure
  end


  error Errno::ENOENT do
    'So what happened was...' + env['sinatra.error'].message
  end

  get '/brand/:brand' do

    brand = Brands.first(:name => params[:brand])

    if brand != nil
      c = brand.clicks
      brand.update(:clicks => (c += 1))
      @id = brand.id
      slim :series
    else
      flash[:fail] = 'Brand dont exist'
      redirect '/failure'

    end

  end

  get '/brand/:brand/serie/:serie' do
    slim :generations
  end

  get '/brand/:brand/serie/:serie/generation/:generation' do
    slim :model
  end

  get '/brand/:brand/serie/:serie/generation/:generation/model/:model' do
    slim :powertrain
  end

	get '/brand/:brand/serie/:serie/generation/:generation/model/:model/powertrain/:powertrain' do
		if session[:vehicles] != nil
			session[:vehicles].push Hash[*request.path_info.split('/').drop(1).flatten]
		else
			session[:vehicles] = []
			session[:vehicles].push Hash[*request.path_info.split('/').drop(1).flatten]
		end
		redirect '/compare'
	end

	get '/compare' do
		if session[:vehicles] == nil
			redirect '/'
		else
			slim :displayVehicles
		end

	end

 end
