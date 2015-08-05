class Cmsino::Content < ActiveRecord::Base
  self.table_name = 'cmsino_contents'

  validates_presence_of   :name, :locale
  validates_uniqueness_of :name, :scope => [:umbrella, :locale]

  def self.div_id(p, n)
    "content_#{p}_#{n}"
  end

  def div_id
    Cmsino::Content.div_id(self.umbrella, self.name)
  end
end
