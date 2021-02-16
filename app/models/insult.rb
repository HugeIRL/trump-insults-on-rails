class Insult < ApplicationRecord
  has_many :tweets
  validates :text, presence: true
end
