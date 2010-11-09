require "lib/base_region"
require "lib/div"
require "lib/containers/table_container"


module PDFRegion

  class Table < BaseRegion

    def initialize(parent)
      super(parent)

      set_width(parent)
      
      rows_container = Div.new(self)
      rows_container.width = self.width
      

      @title = rows_container.clone
      @header = rows_container.clone
      @body = rows_container.clone
      @footer = rows_container.clone
      @repeat_header_on_each_page = false
      @repeat_footer_on_each_page = false
    end
    
    def set_width(parent)
      self.width = parent.width - parent.pad_left - parent.pad_right
    end

    attr_accessor :repeat_header_on_each_page, :repeat_footer_on_each_page

    def render_region(pos, region, test = false)
      region.width = width
      region.render(pos, pos[1], test)
    end

    def render(pos, av_height, test=false)
      super
      pos_x, pos_y = pos
      title_height = render_region([pos_x, pos_y], @title, true)
      header_height = render_region([pos_x, pos_y], @header, true)

      if (title_height[0] + header_height[0]) > av_height
        return [0, false]
      end

      title_status = render_region([pos_x, pos_y], @title)
      pos_y -= title_status[0]

      @header.reset_count_rendered_regions if @repeat_header_on_each_page
      header_status = render_region([pos_x, pos_y], @header)
      pos_y -= header_status[0]

      status = render_region([pos_x, pos_y], @body)
      pos_y -= status[0]

      footer_height = render_region([pos_x, pos_y], @footer, true)
      if (footer_height[0] > pos[1])
        return [av_height-pos_y, false]
      end

      if status[1]
        footer_status = render_region([pos_x, pos_y], @footer)
      else
        if @repeat_footer_on_each_page
          footer_status = render_region([pos_x, pos_y], @footer)

          status[0] = footer_status[0]
          @footer.reset_count_rendered_regions
        end
      end
      pos_y -= footer_status[0] if footer_status

      [av_height-pos_y, status[1] && footer_status[1]]
    end


    def title(style = nil, &initialization_block)
      access_region(@title, style, &initialization_block)
    end

    def header(style = nil, &initialization_block)
      access_region(@header, style, &initialization_block)
    end

    def body(style = nil, &initialization_block)
      access_region(@body, style, &initialization_block)
    end

    def footer(style = nil, &initialization_block)
      access_region(@footer, style, &initialization_block)
    end

    def access_region(region, style=nil, &initialization_block)
      region.set_properties style unless style.nil?
      region.instance_eval(&initialization_block) if initialization_block
    end

    private :access_region

  end
  
end