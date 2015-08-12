class Cmsino::Medium < ActiveRecord::Base
  self.table_name = 'cmsino_media'

  has_attached_file :attach,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" } 
  validates_attachment_content_type :attach, :content_type => /\Aimage\/.*\Z/

  validates_presence_of   :name 
  validates_uniqueness_of :name

end
