$: << File.expand_path("../")
require "rubygems"
require "pdf/writer"
require "document"
require "lib/fixnum"
require "lib/float"


result = PDFRegion::document PDF::Writer.new, 2.cm do
     
  span :width => 10.cm, :pad_left => 5.cm, :border => true do

    caption ' <b> NEXT LINE <td> </table> a href="http://ru.wikipedia.org/wiki/%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5_%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB%D1%8B" <b> '*5, :width => 5.cm, :pad_left => 0, :pad_right => 0.cm, :pad_bottom => 10.cm, \

    :border => true, :border_style => :solid, :border_width => 5
  
    caption ' cadabraabra cadabraabra '*9, :width => 5.cm, :pad_left => 0.cm, :pad_right => 0.cm, \
    :border => true, :border_style => :solid, :border_width => 5
   
    image_data = open(File.expand_path('ruby_logo.jpg'), "rb") { |file| file.read }
    image image_data, :width => 20,\
    :border => true, :border_style => :dotted, :border_width => 5    
   
       
  end
end


File.open("#{File.basename(__FILE__, ".rb")}.pdf", 'wb') {|f| f.write result}

