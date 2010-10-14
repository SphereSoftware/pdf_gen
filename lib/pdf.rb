require "ruport"


#Ruport's PDF formatter extension
module Ruport
  
  class Formatter
    
    class PDF
     
      alias old_add_text add_text
      alias old_draw_table draw_table

      proxy_to_pdf_writer

      def all_pages
        page_number = 0
        ypos = cursor
        pdf_writer.open_object do |o|
          pdf_writer.save_state
          yield page_number += 1
          pdf_writer.restore_state
          pdf_writer.close_object
          pdf_writer.add_object(o, :all_pages)
        end
        move_cursor_to ypos

        @page_number ||= page_number + 1
      end

      def page_number
        @page_number ||= 1
      end

      #gets if the "bold mode" turned on"
      def bold?
        @bold ||= false
      end

      #paintes the border around the text
      def border_text(start_y, format_ops = {})
        if border_ops = format_ops[:border]
          pad_left = border_ops[:left] || 0
          pad_top = border_ops[:top] || 0
          pad_bottom = border_ops[:bottom] || 0
          pad_right = border_ops[:right] || 0

          color = border_ops[:color] || self.stroke_color?
          style = border_ops[:style] || self.stroke_style?

          self.save_state

          self.stroke_color! color
          self.stroke_style! style

          #left border
          line(pad_left, start_y + pad_top, pad_left, self.y - pad_bottom).stroke if border_ops[:left]

          #top border
          line(pad_left, start_y + pad_top, self.page_width - pad_right, start_y + pad_top).stroke if border_ops[:top]

          #bottom border
          line(pad_left, self.y - pad_bottom, self.page_width - pad_right, self.y - pad_bottom).stroke if border_ops[:bottom]

          #right border
          line(self.page_width - pad_right, start_y + pad_top, self.page_width - pad_right, self.y - pad_bottom).stroke if border_ops[:right]

          self.restore_state

        end

      end

      private :border_text

      #add test override.
      #bold tracking added
      def add_text(text, format_opts ={})
        modified_text = bold? ? "<b>#{text}</b>" : text
        start_y = self.y
        old_add_text(modified_text, format_opts)
        border_text(start_y, format_opts) if format_opts[:border]
      end

      #wraps specified text to the specified region
      def wrap_text(text, x = 0, y = self.y, width = self.page_width, format_opts = {})
        start_y = y
        y -= self.font_height
        while !(text = add_text_wrap(x, y, width, text)).empty?
          y -= self.font_height
        end
        self.y = y
        border_text(start_y, format_opts) if format_opts[:border]
      end

      #draw table ovwrride
      def draw_table(table_data, format_ops = {})
        unless ((column_format = format_ops[:column_format]).nil?)
          columns = {}
          column_order = []

          column_format.sort{|a, b| (a[1][:order] || 1) <=> (b[1][:order] || 1)}.each do |pair|
            column_order << pair[0]
            columns[pair[0]] = ::PDF::SimpleTable::Column.new(pair[0]) {|c| c.format=pair[1]}
          end

          format_ops[:columns] = columns
          format_ops[:column_order] = column_order
          format_ops.delete(:column_format)
        end

        old_draw_table table_data, format_ops
      end

      #turns formatter to the bold mode
      def bold
        @bold = true
        yield
        @bold = false
      end

      #turns on columns mode
      def columns(size = 2, gutter = 10)
        start_columns size, gutter
        yield
        stop_columns
      end

      #selects next column
      def column
        yield
        start_new_page if pdf_writer.columns? && pdf_writer.column_number < pdf_writer.column_count
      end
      
    end 
  end
  
end