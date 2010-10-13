require 'rubygems'
require 'lib/writer.rb'
require 'pdf/writer'
require "lib/fixnum"
require 'lib/document.rb'
require 'lib/containers/div_container'
require "test/helpers_for_testing"
<<<<<<< HEAD
require "lib/modules/container"
=======
>>>>>>> --
include HelpersForTesting
include PDFRegion
include Container

<<<<<<< HEAD
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

=======
describe "calculating div height" do
  context "when there is only caption in the div" do
    it "should calculate div height as caption height" do
      div = create_div
      caption = create_caption
      caption.height = 100

      add_region div
      regions[0].add_region caption

      div.send(:render_regions, 0, 0).should == 100
    end
  end
  context "when there is div with two captions in the main div" do
    it "should calculate height as summary of the captions height" do
      div = create_div
      div1 = create_div

      caption = create_caption
      caption.height = 100
      caption1 = create_caption
      caption1.height = 100

      add_region div
      regions[0].add_region div1
      regions[0].add_region caption
      regions[0].add_region caption1

      div.send(:render_regions, 0, 0).should == 200
    end
  end
end
>>>>>>> --
