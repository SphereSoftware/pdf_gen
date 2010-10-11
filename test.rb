#!/usr/bin/ruby ruby
$: << File.dirname(__FILE__)
require "rubygems"
require "pdf/writer"
require "lib/document"
require "lib/fixnum"
require "lib/float"
#require 'ruby-debug'



result = PDFRegion::document PDF::Writer.new, 2.cm do
  #debugger
  span :pad_left => 2.cm do
    image_data = open(File.expand_path('../test_image.jpg'), "rb") { |file| file.read }
    
    image image_data, :width => 250, :border => 2
    caption 'test text'*50, :width=>150, :pad_left=>0.5.cm, :text_color=>Color::RGB::Blue,:justification => :right
  end

end

File.open("#{File.dirname(__FILE__)}/../doc_test.pdf", 'wb') {|f| f.write result}