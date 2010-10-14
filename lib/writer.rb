require "pdf/writer"

module PDF
  class Writer
    #extends PDF writer class StrikeStyle with several well known styles
    class StrokeStyle
      DOTTED = StrokeStyle.new(1, :dash => {:pattern => [1, 1]})
      SOLID = StrokeStyle.new(1, :dash => {:pattern => [1, 0]})
      NONE = StrokeStyle.new(1, :dash => {:pattern => [0, 1]})
    end #StrokeStyle

    #performs page break with the specified top padding (page header height for ex.)
    def page_break pad_top

      start_new_page

      self.y = self.y - pad_top
    end

    def y=(yy) #:nodoc:
      @y = yy
    end
  end #Writer  
end #PDF