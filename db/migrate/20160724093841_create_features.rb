class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.text :description
      t.string :status
      t.references :project, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
