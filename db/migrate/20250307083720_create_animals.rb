class CreateAnimals < ActiveRecord::Migration[8.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :status
      t.string :species
      t.string :health_status
      t.belongs_to :pen
      t.belongs_to :herd

      t.timestamps
    end
  end
end
