require "../document"


result = PDFRegion::document PDF::Writer.new, 2.cm do
  span :pad_left => 2.cm, :width => 10.cm do
    caption 'test text'*50, :width=>5.cm, \
          :border => true, :border_style => :solid, :border_width => 2

    caption 'test text'*50, :width=>5.cm, \
          :border => true, :border_style => :dotted, :border_width => 3
  end
end


File.open("#{File.basename(__FILE__, ".rb")}.pdf", 'wb') {|f| f.write result}

