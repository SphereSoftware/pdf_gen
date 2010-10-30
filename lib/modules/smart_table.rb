require "lib/data/ds_hash"


module PDFRegion

  module SmartTable

    attr_accessor :header_region, :body_regions
    
    def initialize(parent)
      super(parent)
      
      @ds = nil
      @header_data = nil
      @body_data = nil
      
      @header_region = nil
      @body_regions = []
      
      @is_rendered = false

    end

    def init_data_source(data)
      @ds = DsHash.new(data)
      @header_data = @ds.columns
      @body_data = @ds.body
    end

    def render(pos, av_height, test=false)
      unless @is_rendered
        if @ds
          build_header() unless @header_region
          build_body() unless @body_regions.any?
          
          @header.add_region(@header_region)
          @body_regions.each do |region|
            @body.add_region(region)
          end
        end
      end
      @is_rendered = true
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
        yield(span,caption) if block_given?
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
          yield(span,caption) if block_given?
          span.add_region(caption)
        end
        @body_regions << span
      end
    end

    def build_default_table
      build_header()
      build_body()
    end

  end

end