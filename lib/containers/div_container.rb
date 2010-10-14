require "lib/div"
include PDFRegion


module DivContainer

  def div(style = nil, &initialization_block)
    div = Div.new self
    div.set_properties style unless style.nil?
    div.instance_eval(&initialization_block) if initialization_block
    self.add_region(div)
  end
  
end