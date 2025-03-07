class CreatePens < ActiveRecord::Migration[8.0]
  def change
    create_table :pens do |t|
      t.string :name

      t.timestamps
    end
  end
end
