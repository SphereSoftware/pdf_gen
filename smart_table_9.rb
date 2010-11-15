$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))
require "lib/pdf_gen"

result = PDFGen::document PDF::Writer.new, 0.5.cm do
  
div :width => 21.cm, :horizontal_interval => 1.cm, 
    :pad_left => 1.25.cm, :pad_right => 1.25.cm do

table_data = {:columns => ['Software requirements', 'Software design', 'Software contractions', 'Software Testing', 'Software maintenance'],

  :body => [["Requirements fundamentals", "Design fundamentals", 
"Software contractions fundamentals", "Software testing fundamentals", "Software maintenance fundamentals"],
    ["Requirements process", "Key issues in software design", 
"Managing constructions", "Test levels", "Key issues in software maintenance"],
    ["Requirements ellocation", "Software structure and architecture", "Practical considerations", "Test techniques", "Maintenance process"],
    ["Requirements analyses", "Design quality analyses and evaluation", "  ", "Test related messures", "Techniques for maintenance"],
    ["Requirements specification", "Design notations", "  ", "Test processes", "  "],
    ["Requirements validation", "Design strategy and methods", "  ", "  ", "  "]] }

table :data_source => table_data, :columns => [1.5,1,1.5,1,1.5], :repeat_footer_on_each_page => true do

    title do
    span :pad_top => 1.5.cm do  
    caption "SWEBOK STRUCTURE, main processes", :width => self.width/1.7,
    :justification => :center, :pad_left => 0.1.cm, :pad_right => 0.1.cm, 
    :pad_top => 1.5.cm, :pad_bottom => 1.cm, :font_size => 22, 
    :text_color => Color::RGB::Green
    div :width => self.width/3, :pad_left => 1.5.cm, :pad_right => 1.cm, 
    :pad_top => 1.5.cm, :pad_bottom => 1.cm, :border => true, :border_style => :dotted, :border_width => 5, :border_color =>  Color::RGB::Red  do
     caption "IEEE", 
    :justification => :center, :pad_left => 0.1.cm, :pad_right => 0.1.cm, 
    :pad_top => 3.cm, :pad_bottom => 1.cm, :font_size => 24, 
    :text_color => Color::RGB::Brown
     caption "Computer Society", 
    :justification => :center, :pad_left => 0.1.cm, :pad_right => 0.1.cm, 
    :pad_top => 0.5.cm, :pad_bottom => 1.cm, :font_size => 20, 
    :text_color => Color::RGB::Grey
    end
    end
    end

    header do
      row do
        cell caption(ds.columns[0], :justification => :center,
	:pad_left => 0.1.cm, :pad_right => 0.1.cm, :pad_top => 0.1.cm, 
	:pad_bottom => 0.1.cm, :font_size => 14, :text_color => Color::RGB::Grey)
        cell caption(ds.columns[1], :justification => :center, 
       :pad_left => 0.1.cm, :pad_right => 0.1.cm, :pad_top => 0.1.cm, 
       :pad_bottom => 0.1.cm, :font_size => 14, :text_color => Color::RGB::Grey)
         cell caption(ds.columns[2], :justification => :center, 
       :pad_left => 0.1.cm, :pad_right => 0.1.cm, :pad_top => 0.1.cm, 
       :pad_bottom => 0.1.cm, :font_size => 14, :text_color => Color::RGB::Grey)
         cell caption(ds.columns[3], :justification => :center, 
       :pad_left => 0.1.cm, :pad_right => 0.1.cm, :pad_top => 0.1.cm, 
       :pad_bottom => 0.1.cm, :font_size => 14, :text_color => Color::RGB::Grey)
         cell caption(ds.columns[4], :justification => :center, 
       :pad_left => 0.1.cm, :pad_right => 0.1.cm, :pad_top => 0.1.cm, 
       :pad_bottom => 0.1.cm, :font_size => 14, :text_color => Color::RGB::Grey)
      end
    end

    body do

      ds.each do |datarow|
      row do        
          cell caption("#{datarow[0]}", :justification => :center, 
         :pad_left => 0.1.cm, :pad_bottom => 0.1.cm, :border_right => true)
          cell caption("#{datarow[1]}", :justification => :center, 
         :pad_left => 0.1.cm, :pad_bottom => 0.1.cm, :border_right => true)
          cell caption("#{datarow[2]}", :justification => :center, 
         :pad_left => 0.1.cm, :pad_bottom => 0.1.cm, :border_right => true)
          cell caption("#{datarow[3]}", :justification => :center, 
         :pad_left => 0.1.cm, :pad_bottom => 0.1.cm, :border_right => true)
          cell caption("#{datarow[4]}", :justification => :center, 
         :pad_left => 0.1.cm, :pad_bottom => 0.1.cm)

        end
      end
    end

    footer do
      span do
        caption "1", :width => parent.width/4,  :justification => :center, :font_size => 7, :text_color => Color::RGB::Grey
        caption "2", :width => parent.width/8,  :justification => :center, :font_size => 7, :text_color => Color::RGB::Grey
        caption "3", :width => parent.width/4,  :justification => :center, :font_size => 7, :text_color => Color::RGB::Grey
        caption "4", :width => parent.width/8,  :justification => :center, :font_size => 7, :text_color => Color::RGB::Grey
        caption "5", :width => parent.width/4,  :justification => :center, :font_size => 7, :text_color => Color::RGB::Grey
      end
    end

  end
end
end

File.open("#{File.basename(__FILE__, ".rb")}.pdf", 'wb') {|f| f.write result}

