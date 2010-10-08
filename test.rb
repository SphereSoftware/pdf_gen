#!/usr/bin/env ruby
$: << File.dirname(__FILE__)
require "rubygems"
require "pdf/writer"
require "lib/document"
require "lib/fixnum"
require "lib/float"
#require 'ruby-debug'



result = PDFRegion::document PDF::Writer.new, 2.cm do
  #debugger
  image_data = open(File.expand_path('../test_image.jpg'), "rb") { |file| file.read }
  
  image image_data, :width => 250, :height => 250, :border => 2.cm
  caption 'test text'*50, :width=>150, :pad_left=>0.5.cm, :text_color=>Color::RGB::Blue, :border => 1.cm


end

File.open("#{File.dirname(__FILE__)}/../doc_test.pdf", 'wb') {|f| f.write result}