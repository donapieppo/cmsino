class CreateCmsinoContentSchema < ActiveRecord::Migration[5.0]
  def up
    # umbrella = :home 
    # name     = :index
    # locale   = :it
    # type     = Cmsino::Content
    #            Cmsino::Post
    create_table :cmsino_contents do |t|
      t.string   :umbrella
      t.string   :name
      t.string   :locale
      t.string   :title
      t.text     :text
      t.text     :excerpt  
      t.datetime :date
      t.datetime :from
      t.datetime :to
      t.string   :status 
      t.string   :type
      t.timestamps
    end
  end

  def self.down
    remove_table :cmsino_contents
  end
end

# post_name             | varchar(200)        | NO   | MUL |                     |                |
# post_parent           | bigint(20) unsigned | NO   | MUL | 0                   |                |
# post_type             | varchar(20)         | NO   | MUL | post                |                |
# post_mime_type        | varchar(100)        | NO   |     |                     |                |


