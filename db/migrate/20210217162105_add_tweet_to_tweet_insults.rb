class AddTweetToTweetInsults < ActiveRecord::Migration[6.1]
  def change
    add_reference :tweet_insults, :tweet, null: false, foreign_key: true
  end
end
