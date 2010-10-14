require "lib/span"
include PDFRegion


module SpanContainer

  def span(style = nil, &initialization_block)
    span = Span.new self
    span.set_properties style unless style.nil?
    span.instance_eval(&initialization_block) if initialization_block
    self.add_region(span)
  end

end