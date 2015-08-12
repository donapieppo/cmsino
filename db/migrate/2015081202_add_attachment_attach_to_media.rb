class AddAttachmentAttachToMedia < ActiveRecord::Migration
  def self.up
    change_table :cmsino_media do |t|
      t.attachment :attach
    end
  end

  def self.down
    remove_attachment :cmsino_media, :attach
  end
end
