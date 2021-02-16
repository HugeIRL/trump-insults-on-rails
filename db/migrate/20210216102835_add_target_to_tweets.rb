class AddTargetToTweets < ActiveRecord::Migration[6.1]
  def change
    add_reference :tweets, :target, null: false, foreign_key: true
  end
end
