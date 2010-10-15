require "lib/base_region"
require "lib/modules/container"
require "lib/caption"
require "lib/span"
require "lib/containers/div_container"
require "lib/containers/span_container"
require "lib/containers/caption_container"
require "lib/containers/image_container"


module PDFRegion

  class Div < BaseRegion

    include Container, CaptionContainer, SpanContainer, DivContainer, ImageContainer

    def initialize parent
      super

      @gorizontal_interval = 0
      @gorizontal_align = false
      @optional_border = false
    end

    attr_accessor :gorizontal_interval, :gorizontal_align, :optional_border

    #renders inner regions
    def render_regions(x, y, test = true)
      content_height = 0

      last = regions.last()
      first = regions.first()

      document.pdf.y = y

      regions.each do |region|

        unless test
          if (region.height >= (document.pdf.y - pad_bottom))
            add_optional_border(x, document.pdf.y) if optional_border
            document.break_page
          end

          if (region.width > (width - pad_left - pad_right)) or gorizontal_align
            region.width = width - pad_left - pad_right
          end

          add_border_top(x, document.pdf.y) if region == first

          document.pdf.y -= pad_top if region == first
          region.render(x + pad_left, document.pdf.y)

          y = region == first ? document.pdf.y + pad_top : document.pdf.y
          y_new = region == last ? document.pdf.y - region.height - pad_bottom : document.pdf.y - region.height

#          p "%s|%s" % [y,y_new]
          add_border_sides(x, y, y_new)

          document.pdf.y -= region.height
          document.pdf.y -= gorizontal_interval unless region == last
          document.pdf.y -= pad_bottom if region == last

          add_border_bottom(x, document.pdf.y) if region == last
        end

        content_height += region.height
        content_height += gorizontal_interval unless region == last
      end

      content_height
    end

    private :render_regions

    def add_border_top(x, y)
      add_border(x, y, x + width, y) if border_top
    end

    def add_border_bottom(x, y)
      add_border(x, y, x + width, y) if border_bottom
    end
      
    #border left and right
    def add_border_sides(x, y, y_new)
      add_border(x, y, x, y_new) if border_left
#      p "%s|%s||||%s|%s" % [x + width, y, x + width, y_new] if border_right
      add_border(x + width, y, x + width, y_new) if border_right
    end

    def add_border(x, y, x1, y1)
      document.pdf.save_state
      document.pdf.stroke_style! border_params()
      document.pdf.line(x, y, x1, y1).stroke
      document.pdf.restore_state
    end

    def add_optional_border(x, y)
      add_border(x, y, x + width, y)
    end

    def calculate_minimal_height
      0
    end

    def render(x, y, test=false)
      render_regions(x, y, test)
      [x, y]
    end

  end

end
