#!/usr/bin/ruby ruby
$: << File.dirname(__FILE__)
require "rubygems"
require "pdf/writer"
require "lib/document"
require "lib/fixnum"
require "lib/float"
#require 'ruby-debug'

result = PDFRegion::document PDF::Writer.new, 2.cm do
     
#  debugger
  div :width => 20.cm, :pad_left => 2.cm do
    div :pad_left=>2.cm, :pad_top => 2.cm, :pad_bottom=> 2.cm, :pad_right=>2.cm,  :width=> 10.cm, :border=> true, :optional_border => true do
      image_data = open(File.expand_path('../test_image.jpg'), "rb") { |file| file.read }
			
			image image_data, :width => 250, :border => true, :pad_top => 2.cm, :pad_left => 2.cm, :pad_right => 1.cm, :pad_bottom => 1.cm
      caption 'test text'*50, :width=>5.cm
      caption 'test text'*50, :width=>5.cm
      caption 'test text'*50, :width=>5.cm
      caption 'test text'*50, :width=>5.cm
    end
  
  end
  
end


File.open("#{File.dirname(__FILE__)}/../doc_test.pdf", 'wb') {|f| f.write result}

