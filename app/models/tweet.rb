class Tweet < ApplicationRecord
  validates :date, :message, presence: true
end
