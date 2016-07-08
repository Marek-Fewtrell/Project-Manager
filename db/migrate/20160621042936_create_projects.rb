class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :dev_env
      t.text :prod_env
      t.text :language_desc

      t.timestamps null: false
    end
  end
end
