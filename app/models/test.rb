class Test < ApplicationRecord
  has_many :questions
  has_many :options, through: :questions

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :options

  validates :name, presence: true
  validates :description, presence: true
end