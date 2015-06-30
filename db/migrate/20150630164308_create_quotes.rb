class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :symbol

      t.timestamps
    end
  end
end
