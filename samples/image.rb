require "../document"


result = PDFRegion::document PDF::Writer.new, 2.cm do
  image_data = open(File.expand_path('ruby_logo.jpg'), "rb") { |file| file.read }
  image image_data, :width => 250
end

File.open("#{File.basename(__FILE__, ".rb")}.pdf", 'wb') {|f| f.write result}

