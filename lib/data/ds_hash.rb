require "lib/data/ds_base"


module PDFRegion

  class DsHash < DsBase
    def initialize(data)
      @data = data
    end

    def columns
      @data[:columns]
    end

    def body
      @data.body
    end
  end

end