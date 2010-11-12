$: << File.expand_path("../")
require 'rubygems'
require 'lib/caption'
require 'lib/writer'
require 'pdf/writer'
require "lib/fixnum"
require 'pdf_gen'
require 'test/shared_examples'
require "test/helpers_for_testing"
include PDFGen
include PDF
include SpanContainer
include HelpersForTesting


describe "New span" do
  let(:base_region){create_span}
  it_should_behave_like "base region"

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
  it "right calculate content height with vertical interval" do
    span_el = create_span
    span_el.width = 150
    caption1 = create_caption
    caption1.set_properties(:width => 50)

    caption2 = create_caption
    caption2.set_properties(:width => 50)

    span_el.add_region(caption1)
    span_el.add_region(caption2)

    span_el.vertical_interval = 5
    span_el.render_regions.should == 105
  end
  it "right calculate content height with vertical align" do
    span_el = create_span
    span_el.set_properties(:height => 100, :width=>100)
    span_el.vertical_align = true

    caption1 = create_caption
    caption1.set_properties(:width => 50)

    span_el.add_region(caption1)
    span_el.render_regions
    caption1.height.should == 100
  end
end


