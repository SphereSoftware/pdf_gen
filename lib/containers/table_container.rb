require "lib/table"
include PDFRegion


module TableContainer

  def table(&initialization_block)
#    debugger
    table = Table.new(self)
    table.instance_eval(&initialization_block)
    self.add_region(table)
#    table.render([table.document.pdf.left_margin, table.document.pdf.y])
  end

end