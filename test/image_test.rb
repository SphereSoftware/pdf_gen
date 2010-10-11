$: << File.expand_path("../")
require 'rubygems'
require 'lib/caption.rb'
require 'lib/writer.rb'
require 'pdf/writer'
require "lib/fixnum"
require 'lib/document.rb'
require 'test/shared_examples.rb'
require "test/helpers_for_testing"
include PDFRegion
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
  it "should right resize image" do
    image = Image.new(Document.new(Writer.new, 0.cm), [250, 400])
    image.set_properties :width => 100
#    height = 100 * 400 / 250.to_f
    image.width.should == 100 #and
#            image.height.should == height
  end
end
