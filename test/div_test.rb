require 'rubygems'
require 'lib/writer.rb'
require 'pdf/writer'
require "lib/fixnum"
require 'document.rb'
require 'lib/containers/div_container'
require "test/helpers_for_testing"
include HelpersForTesting
include PDFRegion
include Container

describe "Div" do
  it "it should right calculate pages count" do
    div = create_div
    document = Document.new(Writer.new, 0.cm)
    
    caption = create_caption
    caption.height = 500    
    caption1 = create_caption
    caption1.height = 500
    
    div.add_region(caption)
    div.add_region(caption1)
    document.add_region(div)
    
    document.render
    document.pdf.pageset.size.should == 2
  end
end