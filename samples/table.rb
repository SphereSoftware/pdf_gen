$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"

image_data = open(File.expand_path('ruby_logo.jpg'), "rb") { |file| file.read }

PDFGen::document PDF::Writer.new, 2.cm do
  div :paddings => 15 do
    table do
      title do
        caption "<i>Table 1.1.</i> <b>Users</b>", :pad_bottom => 1
      end
      header do
        span do
          caption "name", :width => av_width/3
          caption "Last name", :width => av_width/3
          caption "Email", :width => av_width/3
          elements :border => true, :paddings => 1, :justification => :center
        end
      end
      body do
        span do
          caption "Valeriy", :width => av_width/3
          caption "Sizov", :width => av_width/3
          caption "example@gmail.com", :width => av_width/3
          elements :border => true, :paddings => 1
        end
        span do
          caption "Dmitriy", :width => av_width/3
          caption "Landberg", :width => av_width/3
          caption "example1@gmail.com", :width => av_width/3
          elements :border => true, :paddings => 1
        end
      end
    end
  end
end.save("#{File.basename(__FILE__, ".rb")}.pdf")

