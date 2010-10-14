require "lib/image"
include PDFRegion

module ImageContainer
  def image(image_res, style=nil, &initialization_block)
    image = Image.new self, image_res
    image.set_properties style unless style.nil?
    image.instance_eval(&initialization_block) if initialization_block
    self.add_region(image)
  end
end