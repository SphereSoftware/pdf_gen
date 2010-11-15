require "lib/data/ds_base"

module PDFRegion
  
  class DsActiveRecord < DsBase
    def initialize(data)
      @data = data
    end

    def columns
      @data.first.class.columns.map(&:name)
    end

    def body
      @fields = []
      @data.each do |row|
        @mas = []
        columns.each do |title|
          @mas << row.send(title)
        end
        @fields << @mas
      end
      @fields
    end

    def each
      self.body.each {|item| yield item}
    end
  end

end