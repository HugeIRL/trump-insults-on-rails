class Insult < ApplicationRecord
  has_many :tweet_insults
  has_many :tweets, through: :tweet_insults
  validates :text, presence: true
end
