require "lib/writer"
require "lib/modules/base_attributes"

module PDFRegion

  class BaseRegion

    include BaseAttributes
    
    def initialize(parent)
      self.var_init
      @parent = parent
    end

    attr_reader :parent

    #gets region's document
    def document
      parent ? parent.document : self
    end

    #gets minimal height that current caption can be written to
    def minimal_height
      @minimal_height ||= calculate_minimal_height
    end

    def clear_minimal_height
      @minimal_height = nil
    end

    protected :clear_minimal_height

    #gets minimal region height
    def calculate_minimal_height
      0
    end

    protected :calculate_minimal_height

    def add_border(x, y)
      if border_top || border_bottom || border_left || border_right

        document.pdf.save_state

        document.pdf.stroke_color! border_color
        document.pdf.stroke_style! border_style

        document.pdf.line(x, y, x, y - height).stroke if border_left
        document.pdf.line(x + width, y, x + width, y - height).stroke if border_right
        document.pdf.line(x, y, x + width, y).stroke if border_top
        document.pdf.line(x, y - height, x + width, y - height).stroke if border_bottom

        document.pdf.restore_state
      end
    end

    private :add_border

    #fills caption area with background color
    def fill(x, y)
      unless background_color.nil?
        document.pdf.save_state

        document.pdf.stroke_color! background_color
        document.pdf.stroke_style! PDF::Writer::StrokeStyle::SOLID
        document.pdf.fill_color! background_color
        document.pdf.rectangle(x, y - height, width, height).fill.stroke

        document.pdf.restore_state
      end
    end

    private :fill

    def render(x, y, test=false)
      fill(x, y)
      add_border(x, y)
      [x, y]
    end

    def apply_values(values = {})

    end

    def value val
      "<!#{val.to_s}!>"
    end

    #sets region properties specified as array
    def set_properties(props = {})
      props.each_pair {|name, value| self.send("#{name}=", value)}
    end
    
  end
  
end