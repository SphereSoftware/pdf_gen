module PDFGen

  module Container

    def regions
      @regions ||= []
    end
    
    def [](index)
      regions[index]
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
      regions.each { |region| region.render([x, document.pdf.y], document.pdf.y, test)}
    end
                                                                        
    #renders specified span at the specified position
    #returns real position that caption was generated on
    def render(pos,av_height, test = false)
      if av_height >= self.height
        render_regions(pos[0],pos[1], test)
        [self.height, true]
      else
        [0, false]
      end
    end

  end

end
