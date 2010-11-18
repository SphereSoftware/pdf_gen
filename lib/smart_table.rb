require "lib/data/ds_hash"
require 'lib/data/ds_ar'
require "lib/table"
require "lib/div"


module PDFGen

  class SmartTable < Table

    attr_accessor :header_region, :body_regions

    class RowsContainer < Div

      def initialize(parent)
        super
        @cells = []
      end

      def ds
        parent.data_source
      end

      def cell(region=nil,style=nil)
        if region.is_a?(String) or region.nil?
          caption = Caption.new(parent)
          caption.text = region if region.is_a?(String)
          caption.border_left = true
          caption.set_properties style unless style.nil?
          @cells << caption
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
        @cells.each do |cell|
          cell.width = (cell.width.zero? || cell.width == self.width) ? span.width / @cells.size : cell.width
          span.add_region(cell)
        end

        @cells.clear
        self.add_region(span)
      end

    end

    def initialize(parent)
      super(parent)
      @title = RowsContainer.new(self)
      @header = RowsContainer.new(self)
      @body = RowsContainer.new(self)
      @footer = RowsContainer.new(self)

      init_width(parent)
      
      @data_source = nil
      @header_data = nil
      @body_data = nil

      @is_header_rendered = false
      @is_body_rendered = false
      @columns = nil

      @body_regions = []
      
    end

    def data_source=(data)
      if data.is_a?(Array)
        @data_source = DsActiveRecord.new(data)
      else
        @data_source = DsHash.new(data)
      end
      @header_data = @data_source.columns
      @body_data = @data_source.body
    end

    attr_reader :data_source

    def calculate_minimal_height
      regions_formation
      super
    end

    def regions_formation
      @header.add_region(build_header) unless @is_header_rendered
      build_body unless @is_body_rendered

      @body_regions.each { |region| @body.add_region(region) }
    end

    def render(pos, av_height, test=false)
      @header_region = nil if @is_header_rendered
      @body_regions.clear if @is_body_rendered

      regions_formation
      
      super
    end

    def build_header()
      span = Span.new(self.document)
      span.width = self.width
      span.border = true
      @header_data.each do |cap|
        caption = Caption.new(self.document)
        cap = cap.to_s unless cap.is_a?(String)
        caption.text = cap
        caption.width = self.width / @header_data.size
        caption.border_left = true
        yield(span, caption) if block_given?
        span.add_region(caption)
      end
      @is_header_rendered = true
      span
    end

    def build_body()
      @body_data.each do |row|
        span = Span.new(self.document)
        span.width = self.width
        span.border = true
        row.each do |cap|
          caption = Caption.new(self.document)
          cap = cap.to_s unless cap.is_a?(String)
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