require "lib/table"
require "lib/smart_table"
include PDFRegion


module TableContainer

  def table(style = nil, &initialization_block)
    table = (style.kind_of?(Hash) and style.has_key?(:data_source)) ?\
 SmartTable.new(self) : Table.new(self)
    table.width = self.width - self.pad_left - self.pad_right
    table.set_properties style unless style.nil?
    table.instance_eval(&initialization_block) if initialization_block
    self.add_region(table)
  end

end