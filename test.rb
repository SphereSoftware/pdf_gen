#!/usr/bin/ruby ruby
$: << File.dirname(__FILE__)
require "rubygems"
require "pdf/writer"
require "lib/document"
require "lib/fixnum"
require "lib/float"
require 'ruby-debug'

result = PDFRegion::document PDF::Writer.new, 1.cm do

#  debugger

  div :width=> 35.cm, :pad_left=>2.cm, :pad_right=> 30.cm do
      caption 'test text'*60, :width=>15.cm
      caption 'test text'*60, :width=>15.cm
      caption 'test text'*60, :width=>15.cm
      caption 'test text'*60, :width=>15.cm
  end
#  debugger
end


File.open("#{File.dirname(__FILE__)}/../doc_test.pdf", 'wb') {|f| f.write result}