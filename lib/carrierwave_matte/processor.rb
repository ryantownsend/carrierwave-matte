require "carrierwave"

module CarrierwaveMatte
	module Processor
		def self.included(base)
			base.extend(ClassMethods)
			base.send(:include, InstanceMethods)
		end
	
		module ClassMethods
			def matte(color)
				process matte: color
			end
		end
	
		module InstanceMethods
			def matte(color)
				manipulate! do |img|
					img.background color, "-flatten", "+matte"
					img = yield(img) if block_given?
					img
				end
			end
		end
	end
end

CarrierWave::Uploader::Base.send(:include, CarrierwaveMatte::Processor)