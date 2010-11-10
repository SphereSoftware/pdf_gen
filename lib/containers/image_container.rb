require "lib/image"
module PDFRegion


module ImageContainer

    def image(image_res, style=nil)
      image = Image.new self, image_res
      image.set_properties style unless style.nil?
      self.add_region(image)
    end

  end
  
end