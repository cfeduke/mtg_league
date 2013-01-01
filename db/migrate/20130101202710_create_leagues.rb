class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.date :start
      t.date :end
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
