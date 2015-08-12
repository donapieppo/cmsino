class Cmsino::MediaUse < ActiveRecord::Base
  self.table_name = 'cmsino_media_uses'

  belongs_to :cmsino_content, class_name: "Cmsino::Content", foreign_key: "cmsino_content_id"
  belongs_to :cmsino_medium,  class_name: "Cmsino::Medium",  foreign_key: "cmsino_medium_id"
end
