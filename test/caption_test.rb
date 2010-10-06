$: << File.expand_path("../")
require 'rubygems'
require 'lib/caption.rb'
require 'lib/base_concrete_region.rb'
require 'lib/writer.rb'
require 'pdf/writer'
require "lib/fixnum"
require 'lib/document.rb'
include PDFRegion
include PDF
def create_caption
	doc = Document.new Writer.new,0.cm
	Caption.new doc	
end
describe "A new caption" do
	before(:all) do
		@caption = create_caption
	end
	it "should not have text" do
		@caption.text.should == ""
	end
	it "should have left justification" do
		@caption.justification.should == :left
	end
	it "should have false bold" do
		@caption.bold.should == false
	end
	it "should have font_size as pdf font size" do
		doc = Document.new Writer.new,0.cm
		@caption.font_size.should == doc.pdf.font_size
	end
end
describe "Setter for the text" do
	it "should set text to the value" do
		caption = create_caption
		caption.text="some text"
		caption.text.should == "some text"
	end
end
describe "Setter for the text color" do
	it "should set text color to the value" do
		caption = create_caption
		caption.text_color = Color::RGB::Blue
		caption.text_color.should == Color::RGB::Blue 
	end
end
describe "Setter for the justification" do
	it "should set justification to the value" do
		caption = create_caption
		caption.justification = :left
		caption.justification.should == :left
	end 
end
describe "Setter for the bold" do
	it "should set bold to the value" do
		caption = create_caption
		caption.bold = true
		caption.bold.should == true
	end
end
describe "Setter for the font size" do
	it "should set font size to the value" do
		caption = create_caption
		caption.font_size = 12
		caption.font_size.should == 12
	end
end
