$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"


PDFGen::document PDF::Writer.new, 1.cm do


  table_data = {:columns => ['id', 'name', 'email', 'image'],
                :body => [["1", "Test1_name", "lalala@mail.ru", "sampl1_1.png"],
                          ["2", "Test2_name", "lalala@gmail.com", "sampl1_1.png"],
                          ["3", "Test2_name", "lalala@gmail.com", "sampl1_1.png"],
                          ["4", "Test2_name", "lalala@gmail.com", "sampl1_1.png"],
                          ["5", "Test2_name", "lalala@gmail.com", "sampl1_1.png"],
                          ["6", "Test2_name", "lalala@gmail.com", "sampl1_1.png"],
                          ["7", "Test2_name", "lalala@gmail.com", "sampl1_1.png"],
                          ["8", "Test2_name", "lalala@gmail.com", "sampl1_1.png"],
                          ["9", "Test2_name", "lalala@gmail.com", "sampl1_1.png"],
                          ["10", "Test3_name", "lll@mail.ru", "sampl1_1.png"]] }

  div :pad_left => 2.cm, :pad_right => 1.5.cm do
    table :data_source => table_data,  :repeat_header_on_each_page => true,
          :repeat_footer_on_each_page => true do


      title do
        caption " TABLE 1 ", :justification => :center
      end

      header do
        row do
          cell ds.columns[0]
          cell ds.columns[1]
          cell ds.columns[2]
          cell ds.columns[3]

        end
      end

      body do
        ds.each do |datarow|
          row do
            cell datarow[0], :width => av_width / 4
            cell datarow[1], :width => av_width / 4
            cell datarow[2], :width => av_width / 4
            cell( div :width => av_width / 4, :paddings => 0.2.cm, :border_left => true do
              image(open(File.expand_path("#{datarow[3]}"), "rb") { |file| file.read },
                    :width => av_width*0.5)
            end)
          end
        end
      end

      footer do
        span do
          caption "footer", :width => av_width, :justification => :center
        end
      end

    end
  end


end.save("#{File.basename(__FILE__, ".rb")}.pdf")

