class Pet < ApplicationRecord
  validates :name, presence: true
  validates :species, inclusion: { in: %w(dog cat rabbit snake turtle hamster wolf), message: "this is not a valid species" }
end
