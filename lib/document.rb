require "lib/base_region"
require "lib/modules/composite"
require "lib/containers/div_container"
require "lib/containers/span_container"
require "lib/containers/caption_container"
require "lib/containers/image_container"
require "lib/containers/table_container"

module PDFGen

  class Document < BaseRegion

    include Canvas, Composite, TableContainer, CaptionContainer, SpanContainer,
            DivContainer, ImageContainer

    def initialize(pdf, page_pad_top)
      super(nil)
      pdf.y += pdf.top_margin # clear predefined top_margin
      pdf.y -= page_pad_top # set y considering page_pad_top
      pdf.top_margin = 0

      @pdf = pdf
      @page_pad_top = page_pad_top
      @header = []
    end

    attr_reader :pdf, :header

    #creates new page
    def break_page
      pdf.page_break @page_pad_top
    end

    def render
      pos = [0, pdf.y]
      regions.each do |region|
        pos[1] = pdf.y
        status = region.render(pos, pdf.y)
        if status[1]
          pdf.y -= status[0]
        else
          self.break_page          
          redo
        end
      end
    end

  end

end