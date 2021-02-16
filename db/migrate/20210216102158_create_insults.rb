class CreateInsults < ActiveRecord::Migration[6.1]
  def change
    create_table :insults do |t|
      t.string :text

      t.timestamps
    end
  end
end
