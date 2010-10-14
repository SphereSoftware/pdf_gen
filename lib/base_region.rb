require "lib/writer"

module PDFRegion

  #base region. can be generated to the several pages
  class BaseRegion

    def initialize parent
      @parent = parent

      @width = 0#document.pdf.page_width - document.pdf.left_margin - document.pdf.right_margin

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

    #pdf
    attr_reader :parent

    #gets region's document
    def document
      parent ? parent.document : self
    end

    #width
    attr_reader :width

    #padding from the page top after page break
    attr_reader :page_pad_top

    #gets minimal height that current caption can be written to
    def minimal_height
      @minimal_height ||= calculate_minimal_height
    end

    #clears cached minimal height
    def clear_minimal_height
      @minimal_height = nil
    end

    protected :clear_minimal_height

    #gets minimal region height
    def calculate_minimal_height
      0
    end

    protected :calculate_minimal_height

    #height
    attr_writer :height

    def height
      [minimal_height, @height].max
    end

    #sets page pad top
    def page_pad_top=(value)
      @page_pad_top = value
    end


    def width=(value)
      if value && @width != value
        @width = value
        clear_minimal_height
      end
    end

    attr_accessor :border_top

    attr_accessor :border_bottom

    attr_accessor :border_left

    attr_accessor :border_right

    attr_accessor :border_style

    attr_accessor :border_color

    def border= value
      self.border_top = value
      self.border_bottom = value
      self.border_left = value
      self.border_right = value
    end

    #top padding
    attr_reader :pad_top

    def pad_top=(value)
      if value && @pad_top != value
        @pad_top = value
        clear_minimal_height
      end
    end

    #bottom padding
    attr_reader :pad_bottom

    def pad_bottom=(value)
      if value && @pad_bottom != value
        @pad_bottom = value
        clear_minimal_height
      end
    end

    #left padding
    attr_reader :pad_left

    def pad_left=(value)
      if value && @pad_left != value
        @pad_left = value
        clear_minimal_height
      end
    end

    #right padding
    attr_reader :pad_right

    def pad_right=(value)
      if value && @pad_right != value
        @pad_right = value
        clear_minimal_height
      end
    end

    #background color
    attr_accessor :background_color

    #adds caption border

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

    #breaks pdf page
    #def page_break
    #  pdf.page_break page_pad_top
    #end
    #protected :page_break

    #renders region
    def render(x, y, test=false)
      fill(x, y)
      add_border(x, y)
      [x, y]
    end

    #appliaes specified values
    def apply_values(values = {})

    end

    def value val
      "<!#{val.to_s}!>"
    end

    #sets region properties specified as array
    def set_properties props = {}

      props.each_pair {|name, value| self.send("#{name}=", value)}

    end

  end

end