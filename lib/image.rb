require "pdf/writer"
require 'lib/base_concrete_region'

module PDFRegion
  class Image < BaseConcreteRegion
    def initialize(parent)
      super parent

      @image = nil
      @resize = nil
      @border = nil
      @link = nil      
    end

    attr_accessor :image
    attr_accessor :resize
    attr_accessor :border     
    
    def render(x, y, test=false)
      info = PDF::Writer::Graphics::ImageInfo.new(@image)
      p width
      p height
      
      width  ||= height / info.height.to_f * info.width
      height ||= width * info.height / info.width.to_f
      
      p width
      p height
      document.pdf.add_image(@image, x, y - width, width,height)
    end
  end

  module ImageContainer
    def image(image_res, style=nil, &initialization_block)
      image = Image.new self
      image.image = image_res
      image.set_properties style unless style.nil?
      image.instance_eval(&initialization_block) if initialization_block

      self.add_region(image)
    end
  end
end