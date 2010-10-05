#!/usr/bin/env ruby
$: << File.dirname(__FILE__)
require "rubygems"
require "pdf/writer"
require "lib/document"
require "lib/fixnum"
require 'ruby-debug'


result = PDFRegion::document PDF::Writer.new, 0.cm do
#  debugger
  caption 'test text'*100, :width=>500,:pad_left=>2.cm, :text_color=>Color::RGB::Blue
end

File.open("#{File.dirname(__FILE__)}/../doc_test.pdf",'wb') {|f| f.write result}