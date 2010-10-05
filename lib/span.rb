require "pdf/writer"

require "lib/base_concrete_region"
require "lib/container"
require "lib/caption"

module PDFRegion

  #Gorizontall captions line
  class Span < BaseConcreteRegion
    include Container, CaptionContainer

    #initialization
    def initialize parent
      super parent

      @vertical_interval = 0
      @vertical_align = false
    end

    #interval beetween regions
    attr_accessor :vertical_interval

    #vertical align
    attr_accessor :vertical_align


    #gets minimal span height
    def calculate_minimal_height

      #get max caption height
      (regions.collect{|region| region.height}.max || 0) + pad_top + pad_bottom

    end

    #adds new region to the span
    def add_region region

      if super region

        self.width=([width, render_regions].max)
        clear_minimal_height

      end

    end

    #renders inner regions
    #returns height of the region content
    def render_regions x = 0, y = document.y,  test = true

      content_height = pad_left
      last = regions.last

      regions.each do |region|

        region.height = height if vertical_align
        region.render((x + content_height), (y - pad_top)) unless test

        content_height += region.width
        content_height += vertical_interval unless region == last

      end

      content_height + pad_right
    end 

  end #Span

  #Span container
  module SpanContainer

    #adds new caption with initialization block
    def span(style = nil, &initialization_block)
      
      span = Span.new self

      span.set_properties style unless style.nil?

      span.instance_eval(&initialization_block) if initialization_block

      add_region(span)
    end

  end

end