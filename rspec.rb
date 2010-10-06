#!/usr/bin/env ruby
$: << File.dirname(__FILE__)
require "rubygems"
require "pdf/writer"
require "lib/document"
require "lib/fixnum"
require "lib/caption"
require "ruby-debug"



caption = PDFRegion::Caption.new(PDFRegion::Document.new(PDF::Writer.new, 0.cm)) 
#debugger
caption.text = "text"
p caption.minimal_height