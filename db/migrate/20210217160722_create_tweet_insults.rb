class CreateTweetInsults < ActiveRecord::Migration[6.1]
  def change
    create_table :tweet_insults do |t|

      t.timestamps
    end
  end
end
