class Subscription < ApplicationRecord
  validates :name, presence: true
  validates :price_per_month, presence: true
  validates :billing_period, presence: true

  def capitalize_name
    capitalized_words = name.split(" ").map do |word|
      word.capitalize
    end
    self.name = capitalized_words.join(" ")
  end
end
