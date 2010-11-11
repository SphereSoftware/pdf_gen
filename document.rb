$:.unshift(File.expand_path(File.dirname(__FILE__)))
require "rubygems"
require "pdf/writer"
require "lib/writer"
require "lib/base_region"
require "lib/fixnum"
require "lib/float"
require "lib/table"
require "lib/caption"
require "lib/modules/canvas"
require "lib/modules/container"
require "lib/span"
require "lib/div"
require "lib/image"
require "lib/containers/table_container"
require "lib/smart_table"


module PDFRegion

  class Document < BaseRegion

    include Canvas, Container, TableContainer, CaptionContainer, SpanContainer,
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
          pdf.y -= page_pad_top
          redo
        end
      end
    end

  end


  def self.document(pdf, page_pad_top, &initialization_block)
    document = Document.new(pdf, page_pad_top)
    document.width = document.pdf.page_width
    document.instance_eval(&initialization_block)
    document.render
    pdf.render
  end

end