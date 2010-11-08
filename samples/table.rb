$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "document"


result = PDFRegion::document PDF::Writer.new, 0.cm do

  table do
    self.width = document.pdf.page_width
    self.repeat_header_on_each_page = true
    self.repeat_footer_on_each_page = false
    title :horizontal_align => true do
      caption "Transactions for Account Number",
              :pad_top => 0.1.cm, :pad_bottom => 0.1.cm, :pad_left => 5,
              :text_color => Color::RGB::Red, :border => true, :justification => :center
    end

    header :horizontal_align => true do

      span do

        caption "Reference Number",
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true

        caption "Tran Date",
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true
      end
    end

    body :horizontal_align => true do

      span do

        caption "Some Value"*100,
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2

        caption "Some Value"*150,
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2
      end
      span do

        caption "Some Value"*200,
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2

        caption "Some Value"*250,
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2
      end
      span do

        caption "Some Value"*190,
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2

        caption "Some Value"*190,
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2
      end
      span do

        caption "Some Value"*100,
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2

        caption "Some Value"*110,
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2
      end
    end
    footer :horizontal_align => true do

      span do

        caption "Footer1",
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2

        caption "Footer2",
                :width => document.pdf.page_width / 2, :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2
      end
    end
  end
end

File.open("#{File.dirname(__FILE__)}/../doc_test.pdf", 'wb') {|f| f.write result}