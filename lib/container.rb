module PDFRegion

  module Container

    def regions
      @regions ||= []
    end

    #executes specified initialization block on all inner regions
    def elements(style = {}, &initialization_block)
      regions.each do |region|
        region.set_properties style unless style.nil?
        region.instance_eval(&initialization_block) if initialization_block
      end
    end

    #appliaes specified values

    #applies specified values
    def apply_values(values = {})
      regions.each{|region| region.apply_values values}
    end

    def page_pad_top=(value)
      super value

      regions.each {|region| region.page_pad_top=value}
    end

    #adds new region to the span
    def add_region region
      if region
        regions << region
      end
    end

    def render_regions(x, y, test = false)
      regions.each { |region| region.render(x, document.pdf.y, test)}
    end

    #renders specified span at the specified position
    #returns real position that caption was generated on
    def render(x, y, test = false)
      new_x, new_y = 0, 0
      new_x, new_y = super x, y, test

      render_regions(new_x, new_y, test) if new_x and new_y
    end

  end

end
