$: << File.expand_path("../")
require 'rubygems'
require 'lib/caption.rb'
require 'lib/writer.rb'
require 'pdf/writer'
require "lib/fixnum"
require 'pdf_gen'
require 'test/shared_examples.rb'
require "test/helpers_for_testing"
include PDFRegion
include PDF
include SpanContainer
include HelpersForTesting


describe "common styles for container" do
  it "set common style for all regions" do
    container = create_span
    region1 = create_caption
    region2 = create_caption
    
    container.add_region(region1)
    container.add_region(region2)

    container.elements  :width => 100
    region1.width.should == 100 and
      region2.width.should == 100
  end
end