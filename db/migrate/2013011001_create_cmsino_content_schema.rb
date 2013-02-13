class CreateCmsinoContentSchema < ActiveRecord::Migration
  def up
    # page = :home 
    # name = :index
    # locale = :it
    create_table :cmsino_contents do |t|
      t.string   :page
      t.string   :name
      t.string   :locale
      t.string   :title
      t.text     :text
      t.string   :type
      t.timestamps
    end
  end
end

