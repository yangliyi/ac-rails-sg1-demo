class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.text :bio
      t.date :birthday

      t.timestamps
      # t.datetime :created_at
      # t.datetime :updated_at
    end
  end
end
