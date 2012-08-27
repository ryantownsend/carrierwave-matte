require "spec_helper"
require_relative "../lib/carrierwave_matte/processor"

class TestUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick
	
	process matte: "#ffffff"
end

describe CarrierwaveMatte::Processor do
	describe "processing images" do
		subject do
			TestUploader.new(model, :remote_file)
		end
	
		let(:model) { mock("model") }
		let(:image_file) { nil }
		
		before(:each) do
			TestUploader.enable_processing = true
			subject.store!(File.open(image_file))
		end
		
		after(:each) do
			subject.remove!
			TestUploader.enable_processing = false
		end
		
		context "given a semi-transparent image" do
			let(:image_file) do
				File.new(File.join(File.dirname(__FILE__), "data/transparent.png"))
			end
	
			it "should append a white background" do
				subject.recreate_versions!
				expect(subject).to have_pixel(1, 1, "#ffffff")
			end
		end
		
		context "given an opaque image" do
			let(:image_file) do
				File.new(File.join(File.dirname(__FILE__), "data/opaque.png"))
			end
			
			before(:each) do
				subject.recreate_versions!
			end
		
			it "should not append a white background" do
				expect(subject).not_to have_pixel(1, 1, "#ffffff")
			end
			
			it "should maintain the black background" do
				expect(subject).to have_pixel(1, 1, "#000000")
			end
		end
	end
end