class CreateAnimes < ActiveRecord::Migration[7.1]
  def change
    create_table :animes do |t|
      t.string :name
      t.text :about

      t.timestamps
    end
  end
end
