require "lib/table"
include PDFRegion


module TableContainer

  def table(&initialization_block)
    table = Table.new(self)
    table.width = self.width - self.pad_left - self.pad_right
    table.instance_eval(&initialization_block)
    self.add_region(table)
  end

end