$: << File.expand_path("../")
require 'rubygems'
require 'lib/writer'
require 'pdf/writer'
require "lib/fixnum"
require 'lib/pdf_gen'
require 'lib/containers/div_container'
require "test/helpers_for_testing"

include HelpersForTesting
include PDFGen
include Composite
class Table
  attr_accessor :title, :header, :data, :footer
end
describe "Table" do
  
  before(:each) do
    @table = create_table
  end

  it "should set inner region's width to the table's width" do
    @table.width = 900
    @table.title.width.should == 900
  end

end