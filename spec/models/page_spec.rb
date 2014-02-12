require 'spec_helper'

# see ./spec/dummy/config/cmsino.yml
describe "Page" do
  before(:each) do
    @page = Cmsino::Page.new('pippo')
  end

  it "should have a description from conf file" do
    @page.description.should == 'Pippo Description'
  end

  it "should" do
  end
end



