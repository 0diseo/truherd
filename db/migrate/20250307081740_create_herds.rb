class CreateHerds < ActiveRecord::Migration[8.0]
  def change
    create_table :herds do |t|
      t.string :name

      t.timestamps
    end
  end
end
