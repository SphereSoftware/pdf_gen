require "lib/base_region"
require "lib/div"
require "lib/containers/table_container"


module PDFGen

  class Table < BaseRegion

    def initialize(parent)
      super(parent)
      @is_breakable = true
      @title = Div.new(self)
      @header = Div.new(self)
      @body = Div.new(self)
      @footer = Div.new(self)

      self.width = parent.av_width
      
      @repeat_header_on_each_page = false
      @repeat_footer_on_each_page = false
    end
    
    
    def width=(value)
      [@title,@header,@body,@footer].each do |region|
        region.width = value
      end

      super
    end

    attr_accessor :repeat_header_on_each_page, :repeat_footer_on_each_page

    def align_cell_in_row
      [@header,@body,@footer].each do |container|
        container.regions.each do |row|
          row.vertical_align = true if row.respond_to?(:vertical_align)
        end
      end
    end
    
    def calculate_minimal_height
      [@title,@header,@body,@footer].inject(0){ |height, region| height + region.height }
    end

    def render(pos, av_height, test=false)
      align_cell_in_row
      super
      
      pos_x, pos_y = pos
      title_height = @title.render([pos_x, pos_y], pos_y, true)
      header_height = @header.render([pos_x, pos_y], pos_y, true)

      if (title_height[0] + header_height[0]) > av_height
        return [0, false]
      end

      title_status = @title.render([pos_x, pos_y], pos_y)
      pos_y -= title_status[0]
      @header.reset_count_rendered_regions if @repeat_header_on_each_page
      header_status = @header.render([pos_x, pos_y], pos_y)
      pos_y -= header_status[0]

      status = @body.render([pos_x, pos_y], pos_y)
      pos_y -= status[0]

      footer_height = @footer.render([pos_x, pos_y], pos_y, true)
      if footer_height[0] > pos[1]
        return [av_height - pos_y, false]
      end

      if status[1]
        footer_status = @footer.render([pos_x, pos_y], pos_y)
      else
        if @repeat_footer_on_each_page
          footer_status = @footer.render([pos_x, pos_y], pos_y)

          @footer.reset_count_rendered_regions
        end
      end
      pos_y -= footer_status[0] if footer_status

      [av_height - pos_y, status[1] && footer_status[1]]
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