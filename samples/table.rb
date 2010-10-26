#! /usr/bin/ruby
require "document"
require "ruby-debug"

result = PDFRegion::document PDF::Writer.new, 0.cm do
#  debugger
  table do
    self.width = 20.cm
    title :horizontal_align => true do
      caption "Transactions for Account Number",
              :pad_top => 0.1.cm, :pad_bottom => 0.2.cm, :pad_left => 5,
              :font_size => 11, :border => true
    end

    header :horizontal_align => true do

      span :height => 20, :width=>document.pdf.page_width, :vertical_align=>true do


        caption "Reference Number",
                :width => 3.cm,
                :border_right => true, :border_left => true

        caption "Tran Date",
                :width => 2.cm,
                :border_right => true, :border_left => true

        caption "Post Date", :width => 2.cm,
                :border_right => true, :border_left => true

        caption "Transaction Description", :width => 2.cm,
                :pad_left => 5,
                :border_right => true, :border_left => true

        caption "Amount", :width => 2.cm,
                :border_right => true, :border_left => true

        caption "Payment Due Date*", :width => 2.cm,
                :border_right => true, :border_left => true

      end
    end

    data :horizontal_align => true do

      span :height => 0 do

        caption "Some Value",
                :width => (document.pdf.page_width - document.pdf.left_margin - document.pdf.right_margin) / 6 - 17,
                :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2

        caption "Some Value",
                :width => (document.pdf.page_width - document.pdf.left_margin - document.pdf.right_margin) / 6 - 50,
                :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2

        caption "Some Value",
                :width => (document.pdf.page_width - document.pdf.left_margin - document.pdf.right_margin) / 6 - 50,
                :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2

        caption "Some Value",
                :width => (document.pdf.page_width - document.pdf.left_margin - document.pdf.right_margin) / 6 + 175,
                :justification => :left, :pad_left => 5,
                :border_right => true, :border_left => true, :pad_bottom => 2

        caption "Some Value",
                :width => (document.pdf.page_width - document.pdf.left_margin - document.pdf.right_margin) / 6 - 45,
                :justification => :right, :pad_right => 5,
                :border_right => true, :border_left => true, :pad_bottom => 2

        caption "Some Value",
                :width => (document.pdf.page_width - document.pdf.left_margin - document.pdf.right_margin) / 6 - 13,
                :justification => :center,
                :border_right => true, :border_left => true, :pad_bottom => 2

      end #span
    end #data


  end
end

File.open("#{File.dirname(__FILE__)}/../doc_test.pdf", 'wb') {|f| f.write result}