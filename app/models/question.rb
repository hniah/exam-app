class Question < ApplicationRecord
  belongs_to :test
  validates :label, presence: true
  validates :description, presence: true
end