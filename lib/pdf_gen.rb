$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))

require "rubygems"
require "pdf/writer"
require "lib/writer"
require "lib/base_region"
require "lib/fixnum"
require "lib/float"
require "lib/table"
require "lib/caption"
require "lib/modules/canvas"
require "lib/modules/composite"
require "lib/span"
require "lib/div"
require "lib/image"
require "lib/containers/table_container"
require "lib/smart_table"
require "lib/document"


module PDFGen

  def self.document(pdf, page_pad_top, &initialization_block)
    document = Document.new(pdf, page_pad_top)
    document.width = document.pdf.page_width
    document.instance_eval(&initialization_block)
    document.render
    pdf.render
  end

end