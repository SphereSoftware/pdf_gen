module PDFGen

  class DsBase
    
    include Enumerable
    
    def initialize(data)
      raise "Not Implemented"
    end

    def columns
      raise "Not Implemented"
    end

    def body
      raise "Not Implemented"
    end

    def each
      raise "Not Implemented"
    end
  end

end