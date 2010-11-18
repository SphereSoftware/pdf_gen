$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"

PDFGen::document PDF::Writer.new, :page_pad_top => 2.cm do
  caption "text "*20, :width => 5.cm
end.save("#{File.basename(__FILE__, ".rb")}.pdf")

