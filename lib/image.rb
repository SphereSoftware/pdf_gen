require "pdf/writer"
require 'lib/base_region'


module PDFRegion

  class Image < BaseRegion

    def initialize(parent, image_res)
      super(parent)

      @image = image_res
      @info = PDF::Writer::Graphics::ImageInfo.new(@image)
    end

    attr_accessor :image

    def set_properties(props = {})
      super

      if width == 0 && height == 0
          self.width = @info.width
          self.height = @info.height
      end
      if width == 0
          self.width = height / @info.height.to_f * @info.width
      end
      if height == 0
          self.height = width * @info.height / @info.width.to_f
      end
      self.height = self.height - pad_top - pad_bottom
    end

    def render(pos, av_height, test=false)
      self.check_fit_in_height
      if av_height >= self.height
        document.pdf.add_image(@image, pos[0]+pad_left, pos[1]-height+pad_bottom, \
 width-pad_left-pad_right, height-pad_top-pad_bottom)
        super
        [self.height, true]
      else
         [0, false]
      end
    end

  end

end