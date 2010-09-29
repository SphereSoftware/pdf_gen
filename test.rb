#!/usr/bin/env ruby
$: << File.dirname(__FILE__)
require "rubygems"
require "pdf/writer"
require "lib/document"
require "lib/fixnum"



PDFRegion::document PDF::Writer.new 2.cm do |pdf|
  pdf.text "Test text" * 20
  File.open("/tmp/doc.pdf", "wb") { |f| f.write pdf.render }
end  