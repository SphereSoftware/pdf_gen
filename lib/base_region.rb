require "lib/writer"

module PDFRegion

  #base region. can be generated to the several pages
  class BaseRegion

    def initialize parent
       @parent = parent

       @width = 0#document.pdf.page_width - document.pdf.left_margin - document.pdf.right_margin

       #@page_pad_top = document.pdf.top_margin

       @height = 0
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
      end
    end

    #breaks pdf page
    #def page_break
    #  pdf.page_break page_pad_top
    #end
    #protected :page_break

    #renders region
    def render(x, y, test=false)
      [x,y]
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