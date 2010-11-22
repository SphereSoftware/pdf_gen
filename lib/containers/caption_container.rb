module PDFGen

  module CaptionContainer

    def caption(text = nil, style = nil)
      caption = Caption.new self
      caption.text = text if text
      caption.width = self.av_width
      caption.set_properties style unless style.nil?
      self.add_region(caption)
    end

  end
  
end