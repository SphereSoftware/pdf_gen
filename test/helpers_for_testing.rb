include PDF
module HelpersForTesting
  def create_span
    doc = Document.new Writer.new, 0.cm
    Span.new doc
  end

  def create_caption
    Caption.new(Document.new Writer.new, 0.cm)
  end

  def create_div
    Div.new(Document.new Writer.new, 0)
  end
end