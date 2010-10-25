$: << File.expand_path("../")
require "rubygems"
require "pdf/writer"
require "document"
require "lib/fixnum"
require "lib/float"
require "ruby-debug"

image_data = open(File.expand_path('ruby_logo.jpg'), "rb") { |file| file.read }

result = PDFRegion::document PDF::Writer.new, 2.cm do
div :width => 12.cm, :gorizontal_interval => 2.cm do
    span :width => 10.cm, :pad_left => 2.cm do
      image image_data, :width => 250
      caption ' first '*50, :width => 5.cm
      caption ' second '*50, :width => 4.cm
      elements :border => true #group set params
    end

    span :width => 10.cm, :pad_left => 2.cm do
      image image_data, :width=>250
      caption ' first '*50, :width => 5.cm
      caption ' second '*50, :width => 4.cm
      elements :border => true #group set params
    end

    span :width => 10.cm, :pad_left => 2.cm do
      image image_data, :width=>250
      caption ' first '*50, :width => 5.cm
      caption ' second '*50, :width => 4.cm
      elements :border => true #group set params
    end
    
    span :width => 10.cm, :pad_left => 2.cm do
      image image_data, :width=>250
      caption ' first '*50, :width => 5.cm
      caption ' second '*50, :width => 4.cm
      elements :border => true #group set params
    end

  end
end

File.open("#{File.basename(__FILE__, ".rb")}.pdf", 'wb') {|f| f.write result}

