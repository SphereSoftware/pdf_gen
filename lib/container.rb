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

    #applies specified values
    def apply_values(values = {})
      regions.each{|region| region.apply_values values}
    end

    def page_pad_top=(value)
      super

      regions.each {|region| region.page_pad_top=value}
    end

    #adds new region to the span
    def add_region region
      regions << region if region
    end

    def render_regions(x, y, test = false)
      regions.each { |region| region.render(x, document.pdf.y, test)}
    end

    #renders specified span at the specified position
    #returns real position that caption was generated on
    def render(x, y, test = false)
      new_x, new_y = super

      render_regions(new_x, new_y, test) if new_x and new_y
    end

  end

end
