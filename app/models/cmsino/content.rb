class Cmsino::Content < ActiveRecord::Base
  self.table_name = 'cmsino_contents'

  attr_accessible :page, :name, :locale, :text

  validates_presence_of :page, :name, :locale

  validates_uniqueness_of :name, :scope => [:page, :locale]

  def self.div_id(p, n)
    "content_#{p}_#{n}"
  end

  def div_id
    Cmsino::Content.div_id(self.page, self.name)
  end
end
