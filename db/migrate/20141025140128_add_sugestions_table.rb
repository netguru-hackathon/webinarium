class AddSugestionsTable < ActiveRecord::Migration
  def up
    create_table :suggestions do |t|
      t.text :description
      t.references :user, index: true
      t.timestamps
    end
  end

  def down
    drop_table :suggestions
  end
end
