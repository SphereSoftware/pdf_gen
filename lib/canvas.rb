module PDFRegion
  module Canvas

    #gets current y - coordinate on canvas
    def y
      pdf.y
    end

    #sets current y - coordinate on canvas
    def y= (value)
      pdf.y = value
    end

  end
end