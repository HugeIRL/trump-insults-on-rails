class Tweet < ApplicationRecord
  belongs_to :target
  belongs_to :insult
  validates :date, :message, presence: true
end
