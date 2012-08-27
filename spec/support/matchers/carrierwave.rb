module CarrierWave
  module Test
    module Matchers
      class HavePixel
        def initialize(x, y, color)
          @x, @y, @color = x, y, color
        end
      
        def matches?(actual)
          @actual = actual
          # Satisfy expectation here. Return false or raise an error if it's not met.
          image = ImageLoader.load_image(@actual.current_path).image
          @actual_color = case image.run_command("convert", "#{@actual.current_path}[1x1+#{@x}+#{@y}]", "-depth 8", "txt:").split("\n")[1]
          when /^0,0:.*(#[\da-fA-F]{6}).*$/ then $1
          else nil
          end
          @color.downcase == @actual_color.downcase
        end
      
        def failure_message
          "expected #{@actual.current_path.inspect} to have a #{@color} colored pixel at #{@x}, #{@y}, not #{@actual_color}."
        end
      
        def negative_failure_message
          "expected #{@actual.current_path.inspect} not to have a #{@color} colored pixel at #{@x}, #{@y}."
        end
      
        def description
          "have an #{@color} colored pixel at #{@x}, #{@y}."
        end
      end
      
      def have_pixel(x, y, color)
        HavePixel.new(x, y, color)
      end
    end
  end
end