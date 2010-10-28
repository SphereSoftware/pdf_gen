require "lib/base_region"
require "lib/div"
require "lib/containers/table_container"


module PDFRegion

  class Table < BaseRegion

    def initialize(parent)
      super(parent)

      @title = Div.new(parent)
      @header = Div.new(parent)
      @data = Div.new(parent)
      @footer = Div.new(parent)
      @repeat_header_on_each_page = false
      @repeat_footer_on_each_page = false
    end

    attr_accessor :repeat_header_on_each_page, :repeat_footer_on_each_page

    def render_region(pos, region, test = false)
      region.width = width
      region.render(pos, document.pdf.y, test)
    end

    def render(pos, av_height,test=false)
      pos_x,pos_y = pos
      title_height = render_region([pos_x,pos_y], @title, true)
      header_height = render_region([pos_x,pos_y], @header, true)
      
      if (title_height[0] + header_height[0]) > document.pdf.y
        p "first"
        document.break_page
        pos_y = document.pdf.y
      end
      #pos_y = document.pdf.y
      #document.add_header_region @header if @repeat_header_on_each_page && document.header.size < 1
      title_status = render_region([pos_x,pos_y], @title)
      pos_y -= title_status[0]
      
      @header.count_rendered_region = 0 if @repeat_header_on_each_page
      header_status = render_region([pos_x,pos_y], @header)
      pos_y -= header_status[0]
      
      status = render_region([pos_x,pos_y], @data)
      pos_y -= status[0]
      
      footer_height = render_region([pos_x,pos_y],@footer,true)
      if (footer_height[0] > document.pdf.y)
        p footer_height[0]
        p document.pdf.y
        p "second"
        document.break_page
        pos_y = document.pdf.y
      end

      if status[1]
        status = render_region([pos_x,pos_y],@footer)
        
      else if @repeat_footer_on_each_page
          footer_status = render_region([pos_x,pos_y],@footer)
          status[0] = footer_status[0]
          @footer.count_rendered_region = 0
        end
      end
      pos_y -= status[0]
      status
    end

  end

  def title(style = nil, &initialization_block)
    access_region(@title, style, &initialization_block)
  end

  def header(style = nil, &initialization_block)
    access_region(@header, style, &initialization_block)
  end

  def data(style = nil, &initialization_block)
    access_region(@data, style, &initialization_block)
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