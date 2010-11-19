$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"

PDFGen::document PDF::Writer.new, 2.cm do
  span do
    caption "text "*20, :width => 5.cm, :pad_bottom => 2.cm, :border => true
  end
end.save("#{File.basename(__FILE__, ".rb")}.pdf")

