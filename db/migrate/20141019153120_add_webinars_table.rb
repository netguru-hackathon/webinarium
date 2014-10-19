class AddWebinarsTable < ActiveRecord::Migration
  def change
    create_table :webinars do |t|
      t.string :title
      t.string :youtube_url
      t.string :blogpost_url
      t.string :doc_url
      t.string :code_url
      t.string :language
      t.boolean :translation_available
      t.timestamps
    end
  end
end
