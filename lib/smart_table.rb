require "lib/data/ds_hash"
require "table"
require "div"


module PDFRegion

  class SmartTable < Table

    attr_accessor :header_region, :body_regions, :columns

    class RowsContainer < Div
      
      def initialize(parent)
        super
        @cells = []
      end

      def cell(region=nil)
        if region == nil
          caption = Caption.new(parent)
          caption.border_left = true
          region = caption
          @cells << region
        else
          if region.kind_of?(String)
            caption = Caption.new(parent)
            caption.text = region
            caption.border_left = true
            region = caption
            @cells << region
          else
            @cells << region[0] #todo
            region.clear
          end
        end
      end

      def row
        span = Span.new(self.document())
        span.width = self.width
        span.border = true
        yield if block_given?

        while @cells.size != parent.columns.size
          cell
        end
        @cells.each_with_index do |cell,index|
          parent.columns.nil? ? cell.width = parent.width/@cells.size : \
                    cell.width = parent.width/10 * parent.columns[index] #todo
          span.add_region(cell)
        end
        
        @cells = []
        self.add_region(span)
      end
      
    end

    def initialize(parent)
      super(parent)

      @title = RowsContainer.new(self)
      @header = RowsContainer.new(self)
      @body = RowsContainer.new(self)
      @footer = RowsContainer.new(self)

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
      build_header() unless @is_header_rendered
      build_body() unless @is_body_rendered
      @header.add_region(@header_region)
      @body_regions.each do |region|
        @body.add_region(region)
      end
      
      super
    end

    def build_header()
      span = Span.new(self.document())
      span.border = true
      @header_data.each do |cap|
        caption = Caption.new(self.document())
        caption.text = cap
        caption.width = self.width / @header_data.size
        caption.border_left = true
        yield(span, caption) if block_given?
        span.add_region(caption)
      end

      @header_region = span
    end

    def build_body()
      @body_data.each do |row|
        span = Span.new(self.document())
        span.width = self.width
        span.border = true
        row.each do |cap|
          caption = Caption.new(self.document())
          caption.text = cap
          caption.width = self.width / row.size
          caption.border_left = true
          yield(span, caption) if block_given?
          span.add_region(caption)
        end
        @body_regions << span
      end
    end


    def build_default_table
      build_header()
      build_body()
    end

    def header(style = nil, &initialization_block)
      super
      @is_header_rendered = true
    end
    
    def body(style = nil, &initialization_block)
      super
      @is_body_rendered = true
    end
    
  end

end