$: << File.expand_path("../")
require 'rubygems'
require 'lib/caption.rb'
require 'lib/writer.rb'
require 'pdf/writer'
require "lib/fixnum"
require 'lib/document.rb'
include PDFRegion
include PDF
include SpanContainer
def create_span
	doc = Document.new Writer.new,0.cm
	Span.new doc	
end


