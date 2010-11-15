require "lib/base_region"


module PDFGen
  
  class Caption < BaseRegion
   
    def initialize(parent)
      super

      @text = ""
      @template = @text
      @justification = :left
      @bold = false
      @font_size = document.pdf.font_size
      self.paddings = 0.2.cm
      end
    
    attr_reader :text

    def text=(value)
      if value && @text != value
        @text = value
        @template = value
        clear_minimal_height
      end
    end

    attr_reader :text_color, :justification, :bold, :font_size

    common_setter :text_color, :justification, :bold, :font_size

    def calculate_minimal_height
      add_text_wrap
    end

    #writes text. return actual text height
    def add_text_wrap(pos=[], test = true)
      x = pos[0] || 0
      y = pos[1] || document.pdf.y
      
      res = document.pdf.font_height + pad_top
      txt = bold ? "<b>#{text}</b>" : text
      
      document.pdf.save_state
      document.pdf.fill_color text_color if text_color
      document.pdf.stroke_color! text_color if text_color
      until (txt = document.pdf.add_text_wrap(x + pad_left, y - res, width - pad_left - pad_right, txt, font_size,
                justification, 0, test)).empty?
        res += document.pdf.font_height(font_size)
      end
      document.pdf.restore_state

      res + pad_bottom
    end

    private :add_text_wrap

    #renders specified text at the specified position
    #returns real position that caption was generated on
    def render(pos, av_height, test=false)
      self.check_fit_in_height
      if av_height >= self.height 
        super
        add_text_wrap(pos,test)
        used_height = [add_text_wrap(pos),self.height].max
        [used_height, true]
      else
        [0, false]
      end
    end

  end

end

