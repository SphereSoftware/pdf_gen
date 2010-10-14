require 'rubygems'
require 'lib/writer.rb'
require 'pdf/writer'
require "lib/fixnum"
require 'lib/document.rb'
require 'lib/containers/div_container'
require "test/helpers_for_testing"
include HelpersForTesting
include PDFRegion
include Container

describe "Div" do
  it "it should right calculate pages count" do
    div = create_div
    
    caption = create_caption
    caption.height = 500
    caption1 = create_caption
    caption1.height = 500
    
    div.add_region(caption)
    div.add_region(caption1)
    
    div.send(:render_regions, 0, div.parent.pdf.y,false)
    
    div.parent.pdf.pageset.size.should == 2
  end
end

