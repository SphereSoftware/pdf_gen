module PDFGen

  module DivContainer

    def div(style = nil, &initialization_block)
      div = Div.new(self)
      div.width = self.av_width
      div.set_properties style unless style.nil?
      div.instance_eval(&initialization_block) if initialization_block
      self.add_region(div)
    end

  end
end