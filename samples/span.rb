$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"


PDFRegion::document PDF::Writer.new, 2.cm do
  span :width => 10.cm, :pad_left => 2.cm do
    caption ' first '*50, :width => 4.cm
    caption ' second '*50, :width => 4.cm
    elements :border => true    #group set params
  end
end.save("#{File.basename(__FILE__, ".rb")}.pdf")

