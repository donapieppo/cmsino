class CreateCmsinoContentSchema < ActiveRecord::Migration
  def up
    create_table :cmsino_contents do |t|
      t.string   :page
      t.string   :name
      t.text     :text
      t.string   :type
      t.timestamps
    end
  end
end

