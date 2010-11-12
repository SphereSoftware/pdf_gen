$: << File.expand_path("../")
require 'rubygems'
require 'lib/caption'
require 'lib/writer'
require 'pdf/writer'
require "lib/fixnum"
require 'pdf_gen'
require 'lib/base_region'

shared_examples_for "base region" do
  it "should have width equal to zero" do
    base_region.width.should == 0
  end
  it "should have setter for the page top padding" do
    base_region.page_pad_top = 5
    base_region.page_pad_top.should == 5
  end
  it "should return write height" do
    base_region.height = 12
    base_region.height.should == 12
  end
  it "should have false borders " do
    base_region.border_left.should == false and
            base_region.border_right.should == false and
            base_region.border_top.should == false and
            base_region.border_bottom.should == false
  end
  it "should have solid black border style" do
    base_region.border_style.should == :solid and
            base_region.border_color.should == Color::RGB::Black
  end
  it "should have all paddings equal to zero" do
    base_region.pad_top.should == 0 and
            base_region.pad_left.should == 0 and
            base_region.pad_right.should == 0 and
            base_region.pad_bottom.should == 0
  end
  it "should have background color equal to nil" do
    base_region.background_color.should == nil
  end
  it "should have setter for the width" do
    base_region.width = 10
    base_region.width.should == 10
  end
  it "should have setter for the all borders" do
    base_region.border = 5
    base_region.border_left.should == 5 and
            base_region.border_right.should == 5 and
            base_region.border_top.should == 5 and
            base_region.border_bottom.should == 5
  end
  it "should have setter for the top padding" do
    base_region.pad_top = 5
    base_region.pad_top == 5
  end
  it "should have setter for the left padding" do
    base_region.pad_left = 5
    base_region.pad_left == 5
  end
  it "should have setter for the right padding" do
    base_region.pad_right = 5
    base_region.pad_right == 5
  end
  it "should have setter for the top padding" do
    base_region.pad_right = 5
    base_region.pad_right == 5
  end
end