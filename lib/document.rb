require "lib/writer"
require "lib/base_region"
require "lib/table"
require "lib/caption"
require "lib/canvas"
require "lib/span"
require "lib/div"

module PDFRegion
  class Document < BaseRegion
    include Canvas, Container, TableContainer, CaptionContainer, SpanContainer, DivContainer

    #initialization
    def initialize(pdf, page_pad_top)
      super nil

      @pdf = pdf
      @page_pad_top = page_pad_top
      @header = []
    end

    attr_reader :pdf

    #creates new page
    def break_page
      pdf.page_break @page_pad_top
      @header.each {|header_region| header_region.render([pdf.left_margin, pdf.y])}
    end

    def add_header_region(header_region)

      unless header_region.nil?
        @header << header_region
      end

    end

    def remove_header_region(header_region)

      unless header_region.nil?
        @header.delete(header_region)
      end

    end

  end

  def self.document(pdf, page_pad_top, &initialization_block)
    document = Document.new(pdf, page_pad_top)
    document.instance_eval(&initialization_block)
    document.render(0, pdf.y, false)
    pdf.render
  end
end