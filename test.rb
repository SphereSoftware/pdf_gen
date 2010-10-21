#!/usr/bin/ruby ruby
$: << File.dirname(__FILE__)
require "rubygems"
require "pdf/writer"
require "document"
require "lib/fixnum"
require "lib/float"
require 'ruby-debug'
require "pdf/simpletable"

result = PDFRegion::document PDF::Writer.new, 2.cm do
	debugger
  div :width => 20.cm, :border => true do
    div :width => 16.cm, :height => 30.cm do
      caption "test text" * 50, :width => 5.cm
      caption "test text" * 50, :width => 5.cm
      caption "test text" * 50, :width => 5.cm
      caption "test text" * 50, :width => 5.cm
      caption "test text" * 50, :width => 5.cm
    end
 end
  
      
end


File.open("#{File.dirname(__FILE__)}/../doc_test.pdf", 'wb') {|f| f.write result}

