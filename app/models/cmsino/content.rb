class Cmsino::Content < ActiveRecord::Base
  self.table_name = 'cmsino_contents'

  attr_accessible :page, :name, :text

  def div_id
    "content_#{@page}_#{@name}"
  end
end
