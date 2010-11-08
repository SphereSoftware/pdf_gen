$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "document"


result = PDFRegion::document PDF::Writer.new, 2.cm do
  caption "text "*20, :width => 5.cm
end

File.open("#{File.basename(__FILE__, ".rb")}.pdf", 'wb') {|f| f.write result}

