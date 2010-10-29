$: << File.expand_path("../")
require 'rubygems'
require 'lib/writer.rb'
require 'pdf/writer'
require "lib/fixnum"
require 'document.rb'
require 'lib/containers/div_container'
require "helpers_for_testing"
include HelpersForTesting
include PDFRegion
include Container

describe "Div" do
  before(:each) do
    @div = create_div
    @document = Document.new(Writer.new, 0.cm)

    caption = create_caption
    caption.height = 500
    caption1 = create_caption
    caption1.height = 500

    @div.add_region(caption)
    @div.add_region(caption1)
  end
  it "should right calculate pages count" do
    @document.add_region(@div)
    @document.render
    @document.pdf.pageset.size.should == 2
  end
  it "should right calculate height with test step" do 
    @div.render([0,@document.pdf.y],@document.pdf.y,true).should == [500,false]
  end
  it "should right calculate height with horizontal_interval" do
    @div.horizontal_interval = 20
    @div.render([0,@document.pdf.y],@document.pdf.y,true).should == [520,false]
  end

end