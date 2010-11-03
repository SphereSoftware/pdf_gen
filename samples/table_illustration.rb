#! /usr/bin/ruby
require "../document"


result = PDFRegion::document PDF::Writer.new, 1.cm do

  table do
    self.width = document.pdf.page_width 
    self.repeat_header_on_each_page = true
    self.repeat_footer_on_each_page = true
     title :horizontal_align => true do
      caption "Financial Report",
              :pad_top => 0.5.cm, :pad_bottom => 0.5.cm, :pad_left => 5, :pad_right => 5,
              :text_color => Color::RGB::Green,:border => true, :font_size => 16, :justification => :center
  end

  header :horizontal_align => true do

    span do

      caption "Characteristic",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_bottom => 0.5.cm,
              :font_size => 9

      caption "2005",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_bottom => 0.5.cm,
              :font_size => 9

      caption "2006",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_bottom => 0.5.cm,
              :font_size => 9
      
      caption "2007",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_bottom => 0.5.cm,
              :font_size => 9

      caption "2008",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_bottom => 0.5.cm,
              :font_size => 9

      caption "2009",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_bottom => 0.5.cm,
              :font_size => 9

      caption "2010",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_bottom => 0.5.cm,
              :font_size => 9

      caption "2011",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_bottom => 0.5.cm,
              :font_size => 9
    end
  end

data :horizontal_align => false do

 
  span do

    caption "Profit"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12

    caption "1000"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1000"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1000"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1000"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1000"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1000"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1000"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
  end

  span do

    caption "Income"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12

    caption "2000"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "2001"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "2002"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "2003"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "2004"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "2005"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "2006"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
  end
  
  span do

    caption "Costs"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12

    caption "1000"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1001"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1002"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1003"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1004"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1005"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
    caption "1006"*1,
            :width => document.pdf.page_width / 8, :justification => :center,
            :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
  end
  
end

footer :horizontal_align => true do

  span do

      caption "1",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
              :pad_bottom => 0.2.cm, :font_size => 9

      caption "2",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
              :pad_bottom => 0.2.cm, :font_size => 9

      caption "3",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
              :pad_bottom => 0.2.cm, :font_size => 9
      
      caption "4",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
              :pad_bottom => 0.2.cm, :font_size => 9

      caption "5",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
              :pad_bottom => 0.2.cm, :font_size => 9

      caption "6",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
              :pad_bottom => 0.2.cm, :font_size => 9

      caption "7",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
              :pad_bottom => 0.2.cm, :font_size => 9

      caption "8",
              :width => document.pdf.page_width / 8, :justification => :center,
              :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
              :pad_bottom => 0.2.cm, :font_size => 9
  end
end
end
end

File.open("#{File.basename(__FILE__, ".rb")}.pdf", 'wb') {|f| f.write result}
