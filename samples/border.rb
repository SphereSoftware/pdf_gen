$: << File.expand_path("../")
require "rubygems"
require "pdf/writer"
require "lib/document"
require "lib/fixnum"
require "lib/float"


result = PDFRegion::document PDF::Writer.new, 2.cm do
  span :pad_left => 2.cm, :width => 10.cm do
    caption 'test text'*50, :width=>5.cm, \
          :border => true, :border_style => :solid, :border_width => 2

    caption 'test text'*50, :width=>5.cm, \
          :border => true, :border_style => :dotted, :border_width => 3
  end
end


File.open("doc_test.pdf", 'wb') {|f| f.write result}

