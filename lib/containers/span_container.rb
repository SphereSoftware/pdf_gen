require "lib/span"
include PDFRegion

module SpanContainer

  #adds new caption with initialization block
  def span(style = nil, &initialization_block)
    span = Span.new self
    span.set_properties style unless style.nil?
    span.instance_eval(&initialization_block) if initialization_block
    add_region(span)
  end

end