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

  div do
      caption 'test text'*60, :width=>150, :pad_left=>0.5.cm, :text_color=>Color::RGB::Red, :justification => :right
      caption 'test text'*50, :width=>150, :pad_left=>0.5.cm, :text_color=>Color::RGB::Blue, :justification => :right
      caption 'test text'*60, :width=>150, :pad_left=>0.5.cm, :text_color=>Color::RGB::Red, :justification => :right
      caption 'test text'*60, :width=>150, :pad_left=>0.5.cm, :text_color=>Color::RGB::Red, :justification => :right
  end
end


File.open("#{File.dirname(__FILE__)}/../doc_test.pdf", 'wb') {|f| f.write result}