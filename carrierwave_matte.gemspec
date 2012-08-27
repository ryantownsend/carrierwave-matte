# -*- encoding: utf-8 -*-
require File.expand_path("../lib/carrierwave_matte/version", __FILE__)

Gem::Specification.new do |s|
  s.authors       = ["Ryan Townsend"]
  s.email         = ["ryan@ryantownsend.co.uk"]
  s.description   = "Adds a 'matte' processor to Carrierwave, allowing you to specify a background colour for an image."
  s.summary       = s.description
  s.homepage      = "https://github.com/ryantownsend/carrierwave-matte"

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(spec|features)/})
  s.name          = "carrierwave-matte"
  s.require_paths = ["lib"]
  s.version       = CarrierwaveMatte::VERSION
  
  s.add_dependency "carrierwave"
  s.add_development_dependency "rspec"
  s.add_development_dependency "mini_magick"
end
