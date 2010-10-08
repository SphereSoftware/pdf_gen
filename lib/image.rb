require "pdf/writer"
require 'lib/base_concrete_region'

module PDFRegion
  class Image < BaseConcreteRegion
    def initialize(parent, image_res)
      super parent

      @image = image_res
      @info = PDF::Writer::Graphics::ImageInfo.new(@image)
    end

    attr_accessor :image

    def set_properties props = {}

      super props

      case true
        when (width == 0 and height == 0)
          self.width = @info.width
          self.height = @info.height
        when width == 0
          self.width = height / @info.height.to_f * @info.width
        when height == 0
          self.height = width * @info.height / @info.width.to_f
      end
    end

    #TODO: need to refactoring
    def render(x, y, test=false)
      document.pdf.add_image(@image, x, y - height, width, height)
      add_border x, y
    end
  end

  module ImageContainer
    def image(image_res, style=nil, &initialization_block)
      image = Image.new self, image_res
      image.set_properties style unless style.nil?
      image.instance_eval(&initialization_block) if initialization_block

      self.add_region(image)
    end
  end
end