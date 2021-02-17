class AddInsultToTweetInsults < ActiveRecord::Migration[6.1]
  def change
    add_reference :tweet_insults, :insult, null: false, foreign_key: true
  end
end
