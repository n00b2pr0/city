class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.text :footer
      t.string :status
      t.string :author
      t.string :tags
      t.string :path
      t.string :notes
      t.integer :site_id
      t.integer :layout_id
      t.string :redis_hash

      t.timestamps
    end
  end
end
