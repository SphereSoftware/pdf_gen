require "lib/table"
include PDFRegion


module TableContainer

  def table(data_table, &initialization_block)
    table = Table.new(self, data_table)
    table.instance_eval(&initialization_block)
    table.render([table.document.pdf.left_margin, table.document.pdf.y])
  end

end