module PDFRegion

  module TableContainer

    def table(style = nil, &initialization_block)
      table = (style.is_a?(Hash) and style.is_a?(:data_source)) ?
              SmartTable.new(self) : Table.new(self)
      table.set_properties style unless style.nil?
      table.instance_eval(&initialization_block) if initialization_block
      self.add_region(table)
    end

  end
end