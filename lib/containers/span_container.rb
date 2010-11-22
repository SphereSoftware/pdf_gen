module PDFGen

  module SpanContainer

    def span(style = nil, &initialization_block)
      span = Span.new self
      span.width = self.av_width
      span.set_properties style unless style.nil?
      span.instance_eval(&initialization_block) if initialization_block
      self.add_region(span)
    end

  end
end