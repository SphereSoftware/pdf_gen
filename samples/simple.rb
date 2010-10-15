$: << File.expand_path("../")
require "rubygems"
require "pdf/writer"
require "lib/document"
require "lib/fixnum"
require "lib/float"


result = PDFRegion::document PDF::Writer.new, 2.cm do
      caption 'test text'*50, :width=>5.cm, :pad_left => 1.cm #block with text
end


File.open("doc_test.pdf", 'wb') {|f| f.write result}

