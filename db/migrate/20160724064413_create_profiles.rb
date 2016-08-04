class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.date :birthday
      t.text :bio
      t.string :color
      t.string :twitter
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
