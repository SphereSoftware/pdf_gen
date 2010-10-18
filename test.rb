#!/usr/bin/ruby ruby
$: << File.dirname(__FILE__)
require "rubygems"
require "pdf/writer"
require "document"
require "lib/fixnum"
require "lib/float"
#require 'ruby-debug'
require "pdf/simpletable"

result = PDFRegion::document PDF::Writer.new, 2.cm do

  table span do
    header do
      caption "test"
      caption "test1"
    end
    data do
      caption "test" * 100
      caption "test1" * 100
    end
    title do
      caption "testssssss"
    end
  end

end


File.open("#{File.dirname(__FILE__)}/../doc_test.pdf", 'wb') {|f| f.write result}

