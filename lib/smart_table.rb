require "lib/data/ds_hash"
require "lib/table"
require "lib/div"


module PDFGen

  class SmartTable < Table

    attr_accessor :header_region, :body_regions, :columns

    class RowsContainer < Div

      def initialize(parent)
        super
        @cells = []
      end

      def ds
        parent.data_source
      end

      def cell(region=nil)
        if region.is_a?(String) or region.nil?
          caption = Caption.new(parent)
          caption.text = region if region.is_a?(String)
          caption.border_left = true
          region = caption
          @cells << region
        else
          @cells << region.last #todo
          region.delete(region.last)
        end
      end


      def row
        span = Span.new(self.document)
        span.width = self.width
        span.border = true
        yield if block_given?
        if  @cells.size > ds.columns.size
          raise "count of columns less then cells"
        else
          i = ds.columns.size - @cells.size
          i.times { cell }
        end

        @cells.each_with_index do |cell, index|
          cell.width = parent.columns.nil? ? parent.width/@cells.size :
            parent.width/parent.count_columns * parent.columns[index] #todo
          span.add_region(cell)
        end

        @cells.clear
        self.add_region(span)
      end

    end

    def initialize(parent)
      super(parent)

      rows_container = RowsContainer.new(self)
      rows_container.width = self.width

      @title = rows_container.clone
      @header = rows_container.clone
      @body = rows_container.clone
      @footer = rows_container.clone

      @data_source = nil
      @header_data = nil
      @body_data = nil

      @is_header_rendered = false
      @is_body_rendered = false
      @columns = nil

      @header_region = nil
      @body_regions = []
    end

    def data_source=(data)
      @data_source = DsHash.new(data)
      @header_data = @data_source.columns
      @body_data = @data_source.body
    end

    attr_reader :data_source

    def render(pos, av_height, test=false)
      @header_region = nil if @is_header_rendered
      @body_regions.clear if @is_body_rendered
      
      build_header unless @is_header_rendered
      build_body unless @is_body_rendered
      
      @header.add_region(@header_region) 
      @body_regions.each { |region| @body.add_region(region) }
      
      super
    end

    def build_header()
      span = Span.new(self.document)
      span.border = true
      @header_data.each do |cap|
        caption = Caption.new(self.document)
        caption.text = cap
        caption.width = self.width / @header_data.size
        caption.border_left = true
        yield(span, caption) if block_given?
        span.add_region(caption)
      end
      @is_header_rendered = true
      @header_region = span
    end

    def build_body()
      @body_data.each do |row|
        span = Span.new(self.document)
        span.width = self.width
        span.border = true
        row.each do |cap|
          caption = Caption.new(self.document)
          caption.text = cap
          caption.width = self.width / row.size
          caption.border_left = true
          yield(span, caption) if block_given?
          span.add_region(caption)
        end
        @body_regions << span
      end
      @is_body_rendered = true
    end


    def build_default_table
      build_header
      build_body
    end

    def header(style = nil, &initialization_block)
      super
      @is_header_rendered = true
    end

    def body(style = nil, &initialization_block)
      super
      @is_body_rendered = true
    end

    def count_columns
      @columns.inject(0) do |sum,item|
        raise "Column's value can't be less then 1" if item <= 0
        sum + item
      end
    end
    
  end

end