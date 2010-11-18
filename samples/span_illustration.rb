$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"

image_data = open(File.expand_path('sampl1_2.png'), "rb") { |file| file.read }
image_data1 = open(File.expand_path('sampl1_3.png'), "rb") { |file| file.read }

PDFGen::document PDF::Writer.new, 1.cm do
  caption ' Mixed Integer Linear Programming:  ',
          :paddings => 1.5.cm, :text_color => Color::RGB::Grey,  :justification => :center, :font_size => 20

  caption ' Branch and Bound:  ', :paddings => 1.5.cm,
          :text_color => Color::RGB::Red,  :justification => :center, :font_size => 20

  div :pad_left => 0.5.cm, :pad_right => 0.5.cm do

    span :border => true, :border_color => Color::RGB::Red, :paddings => 1 do
           image image_data, :width => 10.cm, :border_right => true, :border_color => Color::RGB::Grey

           caption ' Branch and Bound - implicit enumeration solve relaxed LP problem with additional 
bounds for integer variables ', :width => 10.cm, :font_size => 12, :justification => :center
         end

    caption ' Branch and Cut:  ', :paddings => 1.cm, :text_color => Color::RGB::Red,  :justification => :center,
            :font_size => 20

    span :border => true,
         :border_style => :dotted, :border_width => 0.05.cm, :border_color => Color::RGB::Red do

              caption ' Branch and Cut solve relaxed LP problem with additional valid constraints B&B 
is a proof techniques', :width => 10.cm, :paddings => 1.cm, :border_width => 0.2.cm,
                      :border_color => Color::RGB::Grey,
                      :font_size => 12, :justification => :center

              
              image image_data1, :width => 10.cm, :pad_left => 0.7.cm, :pad_right => 0.7.cm,
                    :pad_top => 0.3.cm, :pad_bottom => 0.3.cm, :border_left => true, 
                    :border_color => Color::RGB::Grey
            end
  end

end.save("#{File.basename(__FILE__, ".rb")}.pdf")