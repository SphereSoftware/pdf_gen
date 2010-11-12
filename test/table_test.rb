$: << File.expand_path("../")
require 'rubygems'
require 'lib/writer'
require 'pdf/writer'
require "lib/fixnum"
require 'pdf_gen'
require 'lib/containers/div_container'
require "test/helpers_for_testing"
include HelpersForTesting
include PDFGen
include Container
class Table
  attr_accessor :title, :header, :data, :footer
end
describe "Table" do
  
  before(:each) do
    @table = create_table
    @table.width = 900
  end
  it "should set inner region's width to the table's width" do
    @table.title.width = 300
    @table.render_region([0,750],@table.title,true)
    @table.title.width.should == 900
  end
#  it "should right calculate self height" do
#    caption = create_caption
#    caption1 = create_caption
#
#    caption.height = 100
#    caption1.height = 200
#
#    @table.title.add_region(caption)
#    @table.header.add_region(caption)
#    @table.body.add_region(caption)
#    @table.body.add_region(caption1)
#    @table.footer.add_region(caption)
#
#    @table.render([0,750],750,true).should == [600,true]
#  end

end