require "pdf/writer"
require "lib/image"
require "lib/base_region"
require "lib/modules/container"
require "lib/caption"
require "lib/containers/caption_container"
require "lib/containers/image_container"
require "lib/containers/div_container"

module PDFRegion

  #Horizontal captions line
  class Span < BaseRegion
    
    include Container, CaptionContainer, ImageContainer, SpanContainer,\
      DivContainer

    def initialize(parent)
      super

      @vertical_interval = 0
      @vertical_align = false
    end

    attr_accessor :vertical_interval, :vertical_align

    def calculate_minimal_height
      (regions.collect{|region| region.height}.max || 0) + pad_top + pad_bottom
    end

#    def add_region(region)
#      if super
#        self.width=([width, render_regions].max)
#        clear_minimal_height
#      end
#
#    end

    #renders inner regions
    #returns height of the region content
    def render_regions(x=0, y=document.y,  test=true)
      content_width = pad_left
      last = regions.last
      regions.each do |region|
        if (content_width + region.width) > self.width
          regions[regions.index(region),regions.size].each do |item|
            regions.delete(item)
          end
        else
          region.height = height if vertical_align
          region.render([(x + content_width), (y - pad_top)],document.pdf.y) unless test

          content_width += region.width
          content_width += vertical_interval unless region == last
        end
      end
      
      content_width + pad_right
    end
    
    def render(pos, av_height,test=false)
      self.check_fit_in_height
      fill(pos) unless test
      add_border(pos) unless test
      super
    end

  end
  
end