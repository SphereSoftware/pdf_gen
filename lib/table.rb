require "lib/base_region"
require "lib/div"

module PDFRegion

  #Table region
  class Table < BaseRegion

    def initialize(parent, table)
      super parent

      @table = table
      @title = Div.new(parent)
      @header = Div.new(parent)
      @data = Div.new(parent)

      @repeat_header_on_each_page = false
    end

    attr_accessor :repeat_header_on_each_page

    def page_pad_top=(value)
      @title.page_pad_top = value
      @header.page_pad_top = value
      @data.page_pad_top = value
    end

    def render_region x, region, test = false
      region.width = width
      region.render [x, document.pdf.y], test
    end

    def render(pos)

      #title, header and first row of table should not split
      title_height = render_region pos[0], @title, true
      header_height = render_region pos[0], @header, true
      first_row_height = 0
      
      unless @table.data.nil? && @table.data.empty
        first_row_data = @table.data[0]
        unless first_row_data.nil?
          @data.apply_values(get_data_dictionary(first_row_data))
          first_row_height = render_region pos[0], @data, true
        end
      end
      
      if (title_height + header_height + first_row_height) > (document.pdf.y - document.pdf.bottom_margin)
        document.break_page
      end 

      document.add_header_region @header if repeat_header_on_each_page

      render_region pos[0], @title
      render_region pos[0], @header

      @table.data.each do |data|
        @data.apply_values(get_data_dictionary(data))
        render_region pos[0], @data
      end

      document.remove_header_region @header if repeat_header_on_each_page

    end

    #gets dictionary for the specified data

    def get_data_dictionary data
      @data_dictionary ||= {}
      @column_names ||= @table.column_names

      @column_names.each_index do|index|
        @data_dictionary[@column_names[index]] = data[index]
      end

      @data_dictionary
    end

    #title initializer
    def title(style = nil, &initialization_block)
      access_region(@title, style, &initialization_block)
    end

    #header initializer
    def header(style = nil, &initialization_block)
      access_region(@header, style, &initialization_block)
    end

    #data initializer

    def data(style = nil, &initialization_block)
      access_region(@data, style, &initialization_block)
    end

    def access_region(region, style=nil, &initialization_block)
      region.set_properties style unless style.nil?
      region.instance_eval(&initialization_block) if initialization_block
    end
    private :access_region
  end

  module TableContainer
    def table(data_table, &initialization_block)
      table = Table.new(self, data_table)
      table.instance_eval(&initialization_block)
      table.render([table.document.pdf.left_margin, table.document.pdf.y])
    end
  end 
end
