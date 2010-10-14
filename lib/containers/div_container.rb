require "lib/div"
include PDFRegion

module DivContainer

  #adds new caption with initialization block
  def div(style = nil, &initialization_block)
    div = Div.new self
    div.set_properties style unless style.nil?
    div.instance_eval(&initialization_block) if initialization_block
    add_region(div)
  end

end