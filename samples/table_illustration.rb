$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"


PDFGen::document PDF::Writer.new, 1.cm do
  div :paddings => 5 do
    table do
      title  do
        caption "Financial Report", :text_color => Color::RGB::Green,
          :border => true, :font_size => 16, :justification => :center
      end

      header do
        span do
          caption "Characteristic",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9

          caption "2005",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9

          caption "2006",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9
      
          caption "2007",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9

          caption "2008",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9

          caption "2009",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9

          caption "2010",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9

          caption "2011",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9
        end
      end

      body do
        span do
          caption "Profit",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12

          caption "1000",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1000",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1000",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1000",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1000",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1000",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1000",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
        end

        span do

          caption "Income",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12

          caption "2000",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "2001",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "2002",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "2003",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "2004",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "2005",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "2006",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
        end
  
        span do

          caption "Costs",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12

          caption "1000",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1001",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1002",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1003",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1004",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1005",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
          caption "1006",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 12
        end
  
      end

      footer do

        span do

          caption "1",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9

          caption "2",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9

          caption "3",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9
      
          caption "4",
            :width => av_width/ 8, :justification => :center,
            :border => true, :font_size => 9

          caption "5",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9

          caption "6",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9

          caption "7",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9

          caption "8",
            :width => av_width / 8, :justification => :center,
            :border => true, :font_size => 9
        end
      end
    end
  end
end.save("#{File.basename(__FILE__, ".rb")}.pdf")