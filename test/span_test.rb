$: << File.expand_path("../")
require 'rubygems'
require 'lib/caption.rb'
require 'lib/writer.rb'
require 'pdf/writer'
require "lib/fixnum"
require 'lib/document.rb'
include PDFRegion
include PDF
include SpanContainer

def create_span
  doc = Document.new Writer.new, 0.cm
  Span.new doc
end

def create_caption
  Caption.new(Document.new Writer.new, 0.cm)
end

describe "New span" do
  it "right calculation min height,if height bigger than font_height" do
    span_el = create_span
    span_el.set_properties(:pad_top => 3, :pad_bottom => 4)

    caption1 = create_caption
    caption1.set_properties(:height => 12)

    caption2 = create_caption
    caption2.set_properties(:height => 15)

    span_el.add_region(caption1)
    span_el.add_region(caption2)

    span_el.calculate_minimal_height.should == 22
  end
  it "right calculation min height,if height less than font_height" do
    span_el = create_span
    span_el.set_properties(:pad_top => 3, :pad_bottom => 4)

    caption1 = create_caption
    caption1.set_properties(:height => 2)

    caption2 = create_caption
    caption2.set_properties(:height => 3)

    span_el.add_region(caption1)
    span_el.add_region(caption2)

    Integer(span_el.calculate_minimal_height).should == 18
  end
end


