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

class PDF::Writer::Graphics::ImageInfo
  def initialize(data)
    @width = data[0]
    @height = data[1]
  end

  attr_accessor :height
  attr_accessor :width
end


describe "A new image" do
  context "when we set only width" do
    it "should right calculate height" do
      image = Image.new(Document.new(Writer.new, 0.cm), [250, 400])
      image.set_properties :width => 100
      height = 100 * 400 / 250.to_f
      image.width.should == 100 and
              image.height.should == height
    end
  end
  context "when we set only height" do
    it "should right calculate width" do
      image = Image.new(Document.new(Writer.new, 0.cm), [250, 400])
      image.set_properties :height => 100
      width = 100 * 250 / 400.to_f
      image.height.should == 100 and
              image.width.should == width
    end
  end
  context "when we set height and width" do
    it "params should remain the same" do
      image = Image.new(Document.new(Writer.new, 0.cm), [250, 400])
      image.set_properties :height => 100, :width => 200
      image.height.should == 100 and
      image.width.should == 200
    end
  end  
end

