$: << File.expand_path("../")
require "rubygems"
require "pdf/writer"
require "document"
require "lib/fixnum"
require "lib/float"


result = PDFRegion::document PDF::Writer.new, 2.cm do
  span :width => 10.cm, :pad_left => 2.cm do
    caption ' first '*50, :width => 5.cm
    caption ' second '*50, :width => 4.cm
    elements :border => true    #group set params
  end
end


File.open("#{File.basename(__FILE__, ".rb")}.pdf", 'wb') {|f| f.write result}

