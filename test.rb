#!/usr/bin/ruby ruby
$: << File.dirname(__FILE__)
require "rubygems"
require "pdf/writer"
require "lib/document"
require "lib/fixnum"
require "lib/float"
#~ require 'ruby-debug'

result = PDFRegion::document PDF::Writer.new, 2.cm do
     
#  debugger
  div :width => 10.cm, :pad_left => 2.cm do
    div :pad_left=>2.cm, :pad_top => 2.cm, :pad_bottom=> 2.cm, :pad_right=>2.cm,  :width=> 8.cm, :border=> true, :optional_border => true do
      caption 'test text'*50, :width=>5.cm
      caption 'test text'*50, :width=>5.cm
      caption 'test text'*160, :width=>5.cm
      caption 'test text'*80, :width=>5.cm
    end
#  debugger
  end
  
  
end


File.open("#{File.dirname(__FILE__)}/../doc_test.pdf", 'wb') {|f| f.write result}

