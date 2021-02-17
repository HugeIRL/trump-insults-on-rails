class Tweet < ApplicationRecord
  has_many :tweet_insults
  has_many :insults, through: :tweet_insults
  belongs_to :target
  validates :date, :message, presence: true

  def insults_list
    self.insults.map(&:text).join(", ")
  end
end
