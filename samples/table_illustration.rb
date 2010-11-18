$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"


PDFGen::document PDF::Writer.new, :page_pad_top => 1.cm do

  table do
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
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, :border_bottom => true,
          :pad_bottom => 0.5.cm, :font_size => 9

        caption "2005",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, 
          :pad_bottom => 0.5.cm, :font_size => 9

        caption "2006",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, 
          :pad_bottom => 0.5.cm, :font_size => 9
      
        caption "2007",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, 
          :border_bottom => true, :pad_bottom => 0.5.cm, :font_size => 9

        caption "2008",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, 
          :border_bottom => true, :pad_bottom => 0.5.cm, :font_size => 9

        caption "2009",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, 
          :border_bottom => true, :pad_bottom => 0.5.cm, :font_size => 9

        caption "2010",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, 
          :border_bottom => true, :pad_bottom => 0.5.cm,
          :font_size => 9

        caption "2011",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, 
          :border_bottom => true, :pad_bottom => 0.5.cm, :font_size => 9
      end
    end

    body do
      span do
        caption "Profit",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12

        caption "1000",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1000",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1000",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1000",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1000",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1000",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1000",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
      end

      span do

        caption "Income",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12

        caption "2000",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "2001",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "2002",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "2003",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "2004",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "2005",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "2006",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
      end
  
      span do

        caption "Costs",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12

        caption "1000",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1001",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1002",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1003",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1004",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1005",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
        caption "1006",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :pad_bottom => 2, :font_size => 12
      end
  
    end

    footer do

      span do

        caption "1",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
          :pad_bottom => 0.2.cm, :font_size => 9

        caption "2",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
          :pad_bottom => 0.2.cm, :font_size => 9

        caption "3",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
          :pad_bottom => 0.2.cm, :font_size => 9
      
        caption "4",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
          :pad_bottom => 0.2.cm, :font_size => 9

        caption "5",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
          :pad_bottom => 0.2.cm, :font_size => 9

        caption "6",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
          :pad_bottom => 0.2.cm, :font_size => 9

        caption "7",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
          :pad_bottom => 0.2.cm, :font_size => 9

        caption "8",
          :width => self.width / 8, :justification => :center,
          :border_right => true, :border_left => true, :border_top => true, :border_bottom => true, :pad_top => 0.2.cm,
          :pad_bottom => 0.2.cm, :font_size => 9
      end
    end
  end
end.save("#{File.basename(__FILE__, ".rb")}.pdf")
