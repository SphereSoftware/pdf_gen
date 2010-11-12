$: << File.expand_path("../")
require 'rubygems'
require 'lib/caption.rb'
require 'lib/writer.rb'
require 'pdf/writer'
require "lib/fixnum"
require 'lib/pdf_gen'
require 'test/shared_examples'
require "test/helpers_for_testing"
include PDFGen
include PDF
include HelpersForTesting


describe "A new caption" do
  let(:base_region){create_caption}
  it_should_behave_like "base region"

  before(:all) do
    @caption = create_caption
  end
  it "should not have text " do
    @caption.text.should == ""
  end
  it "should have left justification" do
    @caption.justification.should == :left
  end
  it "should have false bold" do
    @caption.bold.should == false
  end
  it "should have font_size as pdf font size" do
    doc = Document.new Writer.new, 0.cm
    @caption.font_size.should == doc.pdf.font_size
  end
end
describe "Caption's setters" do
  before(:each) do
    @caption = create_caption
  end
  it "for text" do

    @caption.text="some text"
    @caption.text.should == "some text"
  end


  it "for text color" do
    @caption.text_color = Color::RGB::Blue
    @caption.text_color.should == Color::RGB::Blue
  end


  it "for justification" do
    @caption.justification = :left
    @caption.justification.should == :left
  end


  it "for bold" do
    @caption.bold = true
    @caption.bold.should == true
  end


  it "for font size" do
    @caption.font_size = 12
    @caption.font_size.should == 12
  end
end

describe "caption minimal height" do
  before(:each) do
    @caption = create_caption
    @doc = Document.new Writer.new, 0.cm
  end
  context "when padding is zero" do
    it "should be equal to the font height" do
      @caption.calculate_minimal_height.should == @doc.pdf.font_height
    end
  end
  context "when padding top is not zero" do
    it "should be equal to the font height plus top padding" do
      @caption.pad_top = 10
      @caption.calculate_minimal_height.should == @doc.pdf.font_height + @caption.pad_top
    end
  end
  context "when padding top and padding bottom is not zero" do
    it "should be equal to the font height plus top padding plus bottom margin" do
      @caption.pad_top = 10
      @caption.pad_bottom = 10
      @caption.calculate_minimal_height.should == @doc.pdf.font_height + @caption.pad_top + @caption.pad_bottom
    end
  end
end

