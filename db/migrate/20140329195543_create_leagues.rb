class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.references :sport
      t.string     :name
      t.timestamps
    end
  end
end
