# umbrella can be the name of the page
# or the group of Cmsino::Post 
# (posts are contents with type="Cmsino::Post")
class Cmsino::Content < ActiveRecord::Base
  self.table_name = 'cmsino_contents'

  has_many :cmsino_media_uses, class_name: "Cmsino::MediaUse", foreign_key: "cmsino_content_id"
  has_many :cmsino_media, through: :cmsino_media_uses, class_name: "Cmsino::Medium"

  validates_presence_of   :name, :locale
  validates_uniqueness_of :name, :scope => [:umbrella, :locale]

  def self.div_id(p, n)
    "content_#{p}_#{n}"
  end

  def div_id
    Cmsino::Content.div_id(self.umbrella, self.name)
  end

  def to_s
    self.title ? self.title : self.name
  end
end
