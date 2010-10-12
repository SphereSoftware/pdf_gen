require "lib/base_region"
require "lib/container"
require "lib/caption"
require "lib/span"
require "lib/containers/div_container"
require "lib/containers/span_container"
require "lib/containers/caption_container"
require "lib/containers/image_container"

module PDFRegion
  class Div < BaseConcreteRegion
    include Container, CaptionContainer, SpanContainer, DivContainer, ImageContainer

    #initialization

    def initialize parent
      super parent

      @gorizontal_interval = 0
      @gorizontal_align = false
    end

    #gorizontal interval
    attr_accessor :gorizontal_interval

    #gorizontal alignment
    attr_accessor :gorizontal_align


    #renders inner regions
    def render_regions(x, y, test = true)

      content_height = 0
      last = regions.last
      first = regions.first

      document.pdf.y = y

      regions.each do |region|

        unless test
          if (region.height >= (document.pdf.y - document.pdf.bottom_margin))
            document.break_page
          end
          
#          region.width = width if gorizontal_align
          if (region.width > (width - pad_left - pad_right)) or gorizontal_align
            region.width = width - pad_left - pad_right
          end
          p  region.width
          document.pdf.y -= pad_top if region == first
          region.render(x + pad_left, document.pdf.y)

          document.pdf.y -= region.height
          document.pdf.y -= gorizontal_interval unless region == last
          document.pdf.y += pad_bottom if region == last
        end

        content_height += region.height
        content_height += gorizontal_interval unless region == last
      end

      content_height
    end

    private :render_regions

    #gets minimal region height

    def calculate_minimal_height
      0
    end
    
    def render(x, y, test=false)
      super x, y, test
      [x, y]
    end
  end
end
