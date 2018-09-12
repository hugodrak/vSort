DataMapper.setup(:default, 'sqlite:database/database.sqlite')

# Main database setup
class Brands
	include DataMapper::Resource
	property :id, Serial, :key => true
	property :img, String
	property :name, String
	property :country, String
	property :hq, String
	property :owner, String
	property :clicks, Integer, :default => 0

end

class Series
	include DataMapper::Resource
	property :id, Serial, :key => true
	property :brand_id, Integer
	property :img, String
	property :name, String
	property :begining, Integer
	property :end, Integer

end

class Generations
	include DataMapper::Resource
	property :id, Serial, :key => true
	property :series_id, Integer
	property :img, String
	property :name, String
	property :begining, Integer
	property :end, Integer
	property :abs, Boolean
	property :tcs, Boolean
	property :brake_assist, Boolean
end

class Models
	include DataMapper::Resource
	property :id, Serial, :key => true
	property :generation_id, Integer
	property :img, String
	property :length, Integer
	property :width, Integer
	property :height, Integer
	property :track_front, Integer
	property :track_rear, Integer
	property :wheelbase, Integer
	property :overhang_front, Integer
	property :overhang_rear, Integer
	property :turning_radius, Float
	property :wading_depth, Integer
	property :seats, Integer
	property :coupe, String
	property :drag, Float
	property :volume_min, Integer
	property :volume_max, Integer
	property :suspension_front, String
	property :suspension_rear, String
	property :power_steering, String
end

class Powertrains
	include DataMapper::Resource
	property :id, Serial, :key => true
	property :model_id, Integer
	property :img, String
	property :name, String
	property :alias, String
	property :brakes_front, String
	property :brakes_rear, String
	property :engine_type, String
	property :ps, Integer
	property :ps_rpm, String
	property :nm, Integer
	property :nm_rpm, String
	property :placement, String
	property :synchronisation, String
	property :displacement, Float
	property :valves, Integer
	property :bore, Float
	property :stroke, Float
	property :compression, Float
	property :compressor, Boolean
	property :turbo, Boolean
	property :boost, Float
	property :fuel, String
	property :tank, Float
	property :tank_cng, Float
	property :tank_adblue, Float
	property :drive, String
	property :transmission, String
	property :tiptronic, Boolean
	property :gears, Integer
	property :consumption_city, Float
	property :consumption_highway, Float
	property :consumption_combined, Float
	property :co2, Float
	property :emisson_standard, String
	property :speed, Integer
	property :accel_100, Float
	property :accel_200, Float
	property :accel_300, Float
	property :brake_100, Float
	property :brake_200, Float
	property :weight_curb, Integer
	property :weight_gross, Integer
	property :weight_trailer, Integer
	property :weight_roof, Integer
	property :battery_type, String
	property :battery_capacity, Float
	property :range, Integer
	property :range_e, Integer
	property :ps_e, Integer
	property :ps_rpm_e, String
	property :nm_e, Integer
	property :rpm_max, Integer
	property :fuel_system, String
	property :consumption_e, Float
end


DataMapper.finalize
DataMapper.auto_upgrade!
