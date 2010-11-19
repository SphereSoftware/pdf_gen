$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"


image_data = open(File.expand_path('ruby_logo.jpg'), "rb") { |file| file.read }

PDFGen::document PDF::Writer.new, 2.cm do
  div :width => 12.cm do
    span :paddings => 0.5.cm, :border => true do
      image image_data, :width => 5.cm
      caption ' first '*50, :width => 3.cm
      caption ' second '*50, :width => 3.cm
    end
    span :paddings => 0.5.cm, :border => true do
      image image_data, :width => 5.cm
      caption ' first '*50, :width => 3.cm
      caption ' second '*50, :width => 3.cm
    end    
    span :paddings => 0.5.cm, :border => true do
      image image_data, :width => 5.cm
      caption ' first '*50, :width => 3.cm
      caption ' second '*50, :width => 3.cm
    end
    span :paddings => 0.5.cm, :border => true do
      image image_data, :width => 5.cm
      caption ' first '*50, :width => 3.cm
      caption ' second '*50, :width => 3.cm
    end
    

  end
end.save("#{File.basename(__FILE__, ".rb")}.pdf")

