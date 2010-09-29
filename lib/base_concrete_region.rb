require "lib/base_region"

module PDFRegion

  #base region class
  class BaseConcreteRegion < BaseRegion

    #initialization
    def initialize(pdf)
      super pdf

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

    def width=(value)
        clear_minimal_height if super value
    end

    #top border
    attr_accessor :border_top

    #bottom border
    attr_accessor :border_bottom

    #left border
    attr_accessor :border_left

    #right border
    attr_accessor :border_right

    #border_style
    attr_accessor :border_style

    #border_color
    attr_accessor :border_color

    #border set helper
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

    #renders region
    #returns real coordinates that region was generated at

    def render(pos)

      new_pos = super pos

      unless new_pos.nil?
        fill(new_pos[0], new_pos[1])
        add_border(new_pos[0], new_pos[1])
      end

      new_pos
    end

  end

end