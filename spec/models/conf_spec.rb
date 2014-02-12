require 'spec_helper'

describe "Conf" do
  before(:all) do
    Cmsino::Conf.setup do |c|
      c.locales = ['it', 'en', 'es']
    end
  end

  before(:each) do
    @conf = Cmsino::Conf.instance
  end

  it "should initialize locales" do
    @conf.locales.should == ['it', 'en', 'es']
  end

  it "should read pages from cmsino.yml" do
    p @conf.pages
  end
end


