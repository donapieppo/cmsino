class Cmsino::Content < ActiveRecord::Base
  self.table_name = 'cmsino_contents'

  attr_accessible :page, :name, :locale, :text

  validates_presence_of :page, :name, :locale

  validates_uniqueness_of :name, :scope => [:page, :locale]

  def div_id
    "content_#{self.page}_#{self.name}"
  end
end
