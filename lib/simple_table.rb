require "pdf/simpletable"


module PDF
  
  class SimpleTable
    
    #extension of the class SimpleTable::Column of the PDF Writer module
    #adds possibility to initialize Colum format by hash
    class Column

      #allows to initialize current column by hash
      def format=(format_ops)
        self.width = format_ops[:width]
        self.link_name = format_ops[:link_name]
        self.justification = format_ops[:justification]
        self.heading = Heading.new(format_ops[:heading_title]) do |h|
          h.bold = format_ops[:heading_bold]
          h.justification = format_ops[:heading_justification]
        end
      end
      
    end
    
  end
  
end