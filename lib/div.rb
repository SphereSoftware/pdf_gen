require "lib/base_region"
require "lib/modules/container"
require "lib/containers/div_container"
require "lib/containers/span_container"
require "lib/containers/caption_container"
require "lib/containers/image_container"
require "lib/containers/table_container"


module PDFRegion

  class Div < BaseRegion

    include Container, CaptionContainer, SpanContainer, DivContainer,
            ImageContainer, TableContainer

    def initialize parent
      super

      @horizontal_interval = 0
      @horizontal_align = false
      @optional_border = false
      @is_breakable = true
      @count_rendered_region = 0
      @rendered_height = 0
    end

    attr_accessor :horizontal_interval, :horizontal_align, :optional_border
    attr_accessor :count_rendered_region

    def add_border_top(x, y)
      add_border(x, y, x + width, y) if border_top
    end

    def add_border_bottom(x, y)
      add_border(x, y, x + width, y) if border_bottom
    end

    #border left and right
    def add_border_sides(x, y, y_new)
      add_border(x, y, x, y_new) if border_left
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
      height = 0
      regions.each do |region|
        height += region.height
      end
      height + pad_top + pad_bottom
    end

    def render_regions(pos, av_height, test=false)
      pos_x, pos_y = pos
      remain_regions = regions.slice(@count_rendered_region..regions.size)
      if @count_rendered_region.zero? && @rendered_height.zero?
        @rendered_height += pad_top
        pos_y -= pad_top
      end
      pos_x += pad_left
      
      remain_regions.each do |region|
        if pos_y >= region.height
          @count_rendered_region += 1 unless test
          self.fit_width(region)
          region_height = region.render([pos_x, pos_y], pos_y, test)[0]

          @rendered_height += region_height
          pos_y -= region_height

          @rendered_height += horizontal_interval unless region == regions.last
          pos_y -= horizontal_interval unless region == regions.last

          if region == regions.last
            pos_y -= pad_bottom
            @rendered_height += pad_bottom
          end
        else
          if region.breakable?
            self.fit_width(region)
            status = region.render([pos_x, pos_y], pos_y, test)

            @rendered_height += status[0]
            pos_y -= status[0]

            @rendered_height += horizontal_interval unless region == regions.last
            pos_y -= horizontal_interval unless region == regions.last

            if region == regions.last and status[1]
              pos_y -= pad_bottom
              @rendered_height += pad_bottom
            end

            return [av_height - pos_y, status[1]]
          else
            return [av_height - pos_y, false]
          end
        end
      end

      [av_height - pos_y, true]
    end

    def render(pos, av_height, test=false)
      pos_x, pos_y = pos
      add_border_top(pos_x, pos_y) if @rendered_height.zero?
      fill(pos)
      status = render_regions([pos_x, pos_y], av_height, test)
      pos_y -= status[0]

      if (status[1])
        add_border_bottom(pos_x, pos_y)
        add_border_sides(pos_x, av_height, pos_y)
      else
        add_border_sides(pos_x, av_height, 0)
      end

      status
    end

    def fit_width(region)
      if (region.width > (width - pad_left - pad_right)) or horizontal_align
        region.width = width - pad_left - pad_right
      end
    end

    protected :fit_width

    def reset_count_rendered_regions
      @count_rendered_region = 0
    end
  end

end
