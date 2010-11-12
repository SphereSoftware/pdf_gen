$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"


result = PDFGen::document PDF::Writer.new, 1.cm do

caption ' Mixed Integer Linear Programming:  '*1, :width => 20.cm, 
         :pad_left => 1.5.cm, :pad_right => 1.cm, :pad_top => 1.cm, :pad_bottom => 1.cm,   
         :text_color => Color::RGB::Grey,  :justification => :center, :font_size => 20 

caption ' Branch and Bound:  '*1, :width => 20.cm, 
         :pad_left => 1.5.cm, :pad_right => 1.cm, :pad_top => 1.cm, :pad_bottom => 1.cm,   
         :text_color => Color::RGB::Red,  :justification => :center, :font_size => 20 #, :bold => true

span :width => 21.55.cm, :pad_left => 0.05.cm, :pad_right => 0.05.cm, 
         :border => true, :border_style => :dotted, :border_width => 0.05.cm, :border_color => Color::RGB::Red  do
      
     image_data = open(File.expand_path('sampl1_2.png'), "rb") { |file| file.read }
       image image_data, :width => 10.5.cm,\
       :pad_left => 0.2.cm, :pad_right => 0.2.cm, 
       :border => true, :border_style => :solid, :border_width => 0.02.cm, :border_color => Color::RGB::Grey 
       #:justification => :center

     caption ' Branch and Bound - implicit enumeration solve relaxed LP problem with additional bounds for integer variables ', :width => 10.cm, 
       :pad_left => 1.cm, :pad_right => 1.cm, :pad_top => 1.cm, :pad_bottom => 1.cm, 
       :border => false, :border_style => :solid, :border_width => 0.02.cm, #:background_color => Color::RGB::Grey,
       :border_color => Color::RGB::Grey, :text_color => Color::RGB::Black, :font_size => 12,
       :justification => :center

end

caption ' Branch and Cut:  '*1, :width => 20.cm, 
         :pad_left => 1.5.cm, :pad_right => 1.cm, :pad_top => 1.cm, :pad_bottom => 1.cm,   
         :text_color => Color::RGB::Red,  :justification => :center, :font_size => 20 #, :bold => true
  
span :width => 21.55.cm, :pad_left => 0.05.cm, 
     :border => true, :border_style => :dotted, :border_width => 0.05.cm, :border_color => Color::RGB::Red do
      
     caption ' Branch and Cut solve relaxed LP problem with additional valid constraints B&B is a proof techniques', :width => 11.0.cm, 
       :pad_left => 1.cm, :pad_right => 1.cm, :pad_top => 1.cm, :pad_bottom => 1.cm,
       :border => false, :border_style => :solid, :border_width => 0.2.cm, :border_color => Color::RGB::Grey,
       :font_size => 12, :justification => :center     
      
     image_data = open(File.expand_path('sampl1_3.png'), "rb") { |file| file.read }
       image image_data, :width => 10.5.cm,\
      :pad_left => 0.9.cm, :pad_right => 0.9.cm, :pad_top => 0.3.cm, :pad_bottom => 0.3.cm, 
      :border => true, :border_style => :solid, :border_width => 0.02.cm, :border_color => Color::RGB::Grey 
               
    end
   
  
end

File.open("#{File.basename(__FILE__, ".rb")}.pdf", 'wb') {|f| f.write result}

