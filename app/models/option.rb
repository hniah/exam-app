class Option < ApplicationRecord
  belongs_to :question
  validates :answer, presence: true
end