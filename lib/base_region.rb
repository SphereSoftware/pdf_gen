require "lib/writer"

module PDFRegion

  class BaseRegion

    def initialize(parent)
      @parent = parent

      @width = 0 #document.pdf.page_width - document.pdf.left_margin - document.pdf.right_margin
      @height = 0

      @border_top = false
      @border_left = false
      @border_right = false
      @border_bottom = false
      @border_style = PDF::Writer::StrokeStyle::SOLID
      @border_color = Color::RGB::Black

      @pad_top = 0
      @pad_bottom = 0
      @pad_left = 0
      @pad_right = 0

      @background_color = nil
    end

    attr_reader :parent

    #gets region's document
    def document
      parent ? parent.document : self
    end

    attr_reader :width

    #padding from the page top after page break
    attr_reader :page_pad_top

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

    attr_writer :height

    def height
      [minimal_height, @height].max
    end

    def page_pad_top=(value)
      @page_pad_top = value
    end
    
    def common_setter(var_name,value)
      if value && var_name != value
        self.instance_variable_set(var_name, value)
        clear_minimal_height
      end
    end
    
    def width=(value)
      common_setter(:@width,value)
    end

    attr_accessor :border_top, :border_bottom, :border_left, :border_right, :border_style, :border_color 

    def border= value
      self.border_top = value
      self.border_bottom = value
      self.border_left = value
      self.border_right = value
    end

    attr_reader :pad_top, :pad_bottom, :pad_left, :pad_right

    def pad_top=(value)
      common_setter(:@pad_top,value)
    end

    def pad_bottom=(value)
      common_setter(:@pad_bottom,value)
    end

    def pad_left=(value)
      common_setter(:@pad_left,value)
    end

    def pad_right=(value)
      common_setter(:@pad_right,value)
    end

    attr_accessor :background_color

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