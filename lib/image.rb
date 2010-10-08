require "pdf/writer"
require 'lib/base_concrete_region'

module PDFRegion
	class Image < BaseConcreteRegion
		def initialize(parent)
			super parent

			@image = nil
		end

		attr_accessor :image
				
		def render(x, y, test=false)
			info = PDF::Writer::Graphics::ImageInfo.new(@image)
			width_new = width if width > 0
			height_new = height if height > 0
			
			width_new  ||= height / info.height.to_f * info.width
			height_new ||= width * info.height / info.width.to_f
			
			document.pdf.add_image(@image, x, y - width_new, width_new,height_new) if (width_new > 0 && height_new > 0)
			document.pdf.add_image(@image, x, y - info.width, nil,nil) if (width_new == 0 && height_new == 0)
			add_border(x,y)
		end
	end

	module ImageContainer
		def image(image_res, style=nil, &initialization_block)
			image = Image.new self
			image.image = image_res
			image.set_properties style unless style.nil?
			image.instance_eval(&initialization_block) if initialization_block

			self.add_region(image)
		end
	end
end