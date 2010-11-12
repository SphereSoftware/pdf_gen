module PDFGen

  module CaptionContainer

    def caption(text = nil, style = nil)
      caption = Caption.new self
      caption.text = text if text
      caption.width = self.width - self.pad_left - self.pad_right
      caption.set_properties style unless style.nil?
      self.add_region(caption)
    end

  end
  
end