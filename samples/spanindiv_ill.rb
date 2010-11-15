$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"


PDFGen::document PDF::Writer.new, 2.cm do
  div :width => 21.55.cm, :horizontal_interval => 1.0.cm,
      :pad_left => 1.cm, :pad_right => 1.cm,
      :border => true, :border_style => :dotted, :border_width => 0.05.cm do

            caption 'Introduction: Models, Model Building and Mathematical Optimization', :width => 20.cm,
                    :pad_left => 0.2.cm, :pad_right => 0.2.cm, :pad_top => 1.cm, :pad_bottom => 1.cm,
                    :border => true, :border_style => :solid, :border_width => 0.02.cm, :background_color => Color::RGB::Grey,
                    :text_color => Color:: RGB::White, :font_size => 18, :bold => true, :justification => :center

            caption 'The Importance of Modeling Langauges for Solving Real World Problems', :width => 20.cm,
                    :pad_left => 0.2.cm, :pad_right => 0.2.cm, :pad_top => 1.cm, :pad_bottom => 1.cm,
                    :border => true, :border_style => :solid, :border_width => 0.02.cm,
                    :background_color => Color::RGB::LightGrey, :text_color => Color::RGB::White, :font_size => 16,
                    :bold => true, :justification => :center
            elements :border_color => Color::RGB::Grey

            caption 'Josef Kallrath', :width => 20.cm,
                    :pad_left => 1.cm, :pad_right => 1.cm, :pad_top => 0.cm, :pad_bottom => 0.cm,
                    :text_color => Color::RGB::LightBlue, :font_size => 22, :justification => :center

            caption 'Structure of the Lecture: ', :width => 20.cm,
                    :text_color => Color::RGB::Red,  :justification => :center, :font_size => 20

            span :width => 20.cm, :pad_left => 0.05.cm, :border => true, :border_width => 0.05.cm, :border_color => Color::RGB::Red,
                 :background_color => Color::RGB::LightPink do

                   image_data = open(File.expand_path('sampl1_1.png'), "rb") { |file| file.read }
                   image image_data,  :pad_left => 0.2.cm, :pad_right => 0.2.cm, :pad_top => 0.2.cm,
                         :pad_bottom => 0.2.cm, :width => 7.5.cm

                   div :width => 11.5.cm, :horizontal_interval => 0.1.cm do
                     caption ' * the Modeling Process, ', :width => 10.5.cm, :justification => :left,
                             :border => false, :border_style => :solid, :border_width => 0.2.cm,
                             :border_color => Color::RGB::Grey, :pad_left => 0.5.cm, :pad_right => 0.3.cm,
                             :pad_top => 0.9.cm, :text_color => Color::RGB::Grey, :font_size => 12
                     caption ' * survey of Real World Problems, ', :width => 10.5.cm, :justification => :left,
                             :border => false, :border_style => :solid, :border_width => 0.2.cm,
                             :border_color => Color::RGB::Grey, :pad_left => 0.5.cm, :pad_right => 0.3.cm, :pad_top => 0.7.cm,
                             :text_color => Color::RGB::Grey, :font_size => 12
                     caption ' * mathematical background (solution algorithms), ', :width => 10.5.cm, :justification => :left,
                             :border => false, :border_style => :solid, :border_width => 0.2.cm, :border_color => Color::RGB::Grey,
                             :pad_left => 0.5.cm, :pad_right => 0.3.cm, :pad_top => 0.7.cm,
                             :text_color => Color::RGB::Grey, :font_size => 12
                     caption ' * efficient problem solving & good modeling practice, ', :width => 11.0.cm, :justification => :left,
                             :border => false, :border_style => :solid, :border_width => 0.2.cm, :border_color => Color::RGB::Grey,
                             :pad_left => 0.5.cm, :pad_right => 0.3.cm, :pad_top => 0.7.cm,
                             :text_color => Color::RGB::Grey, :font_size => 12
                     caption ' * mathematical modeling & optimization in practice, ', :width => 10.5.cm,
                             :justification => :left, :border => false, :border_style => :solid, :border_width => 0.2.cm,
                             :border_color => Color::RGB::Grey, :pad_left => 0.5.cm,
                             :pad_right => 0.3.cm, :pad_top => 0.7.cm, :text_color => Color::RGB::Grey, :font_size => 12
                     caption ' * practioners\'s requirements towards modeling languages ', :width => 10.5.cm, :justification => :left, 
                             :border => false, :border_style => :solid, :border_width => 0.2.cm, :border_color => Color::RGB::Grey,
                             :pad_left => 0.5.cm, :pad_right => 0.3.cm, :pad_top => 0.7.cm,
                             :text_color => Color::RGB::Grey, :font_size => 12

                   end
                 end

          end
end.save("#{File.basename(__FILE__, ".rb")}.pdf")