$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"


PDFGen::document PDF::Writer.new, 1.cm do


  table_data = {:columns => ['id', 'Book', 'Author', 'Fragment'],
                :body => [["9843712", "Amphibia man", "Belyaev", "Nymph.jpg"],
                          ["2124613", "not khown", "not known", "notknown.png"],     
                          ["4134534", "Captain Grants children", "Jul Wern", "Ship.png"]] }

  div :pad_left => 2.cm, :pad_right => 1.5.cm do
    table :data_source => table_data,  :repeat_header_on_each_page => true,
          :repeat_footer_on_each_page => true do


      title do
        caption "<b>List of available books<b>", :justification => :center, 
                :text_color => Color::RGB::LightBlue, :font_size => 12
      end

      header do
        row do
          cell ds.columns[0], :text_color => Color::RGB::Blue, :font_size => 10, :width => av_width / 8 
          cell ds.columns[1], :text_color => Color::RGB::Blue, :font_size => 10, :width => av_width / 4
          cell ds.columns[2], :text_color => Color::RGB::Blue, :font_size => 10, :width => av_width / 4
          cell ds.columns[3], :text_color => Color::RGB::Blue, :font_size => 10, :width => av_width / 8 * 3
      end
      end

      body do
        ds.each do |datarow|
          row do
            cell datarow[0], :width => av_width / 8 
            cell datarow[1], :width => av_width / 4 
            cell datarow[2], :width => av_width / 4
            cell :span, :width => av_width / 8 * 3, :paddings => 0.1.cm do
                  image(open(File.expand_path("#{datarow[3]}"), "rb") { |file| file.read }, :width => av_width / 2)
                  div :width => av_width / 2 do
                  caption "Cameraman", :text_color => Color::RGB::Grey, :width => av_width 
                  caption "Pal Wind", :width => av_width 
                  end
                  end
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

