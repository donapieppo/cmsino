class CreateCmsinoMediaUsesSchema < ActiveRecord::Migration
  def up
    create_table :cmsino_media_uses do |t|
      t.integer :cmsino_content_id
      t.integer :cmsino_medium_id
    end
  end

  def self.down
    remove_table :cmsino_media_uses
  end
end



