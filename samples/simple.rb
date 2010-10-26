require "../document"


result = PDFRegion::document PDF::Writer.new, 2.cm do
end

File.open("#{File.basename(__FILE__, ".rb")}.pdf", 'wb') {|f| f.write result}

