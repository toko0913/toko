class CreateTokoyus < ActiveRecord::Migration[7.1]
  def change
    create_table :tokoyus do |t|

      t.timestamps
    end
  end
end
