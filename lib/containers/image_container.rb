module PDFRegion

  module ImageContainer

    def image(image_res, style=nil, &initialization_block)
      image = Image.new self, image_res
      image.width = self.width - self.pad_left - self.pad_right
      image.set_properties style unless style.nil?
      image.instance_eval(&initialization_block) if initialization_block
      self.add_region(image)
    end

  end
end