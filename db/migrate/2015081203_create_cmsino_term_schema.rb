class CreateCmsinoTermSchema < ActiveRecord::Migration
  def up
    create_table :cmsino_terms do |t|
      t.string   :name
      t.string   :locale
    end
  end

  def self.down
    remove_table :cmsino_terms
  end
end



