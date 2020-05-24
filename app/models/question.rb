class Question < ApplicationRecord
  belongs_to :test
  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

  validates :label, presence: true
  validates :description, presence: true
end