class TweetInsult < ApplicationRecord
  belongs_to :tweet
  belongs_to :insult
end
