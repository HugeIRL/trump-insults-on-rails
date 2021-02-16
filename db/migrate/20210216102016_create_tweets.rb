class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.datetime :date
      t.string :message

      t.timestamps
    end
  end
end
