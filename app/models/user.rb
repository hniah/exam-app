class User < ApplicationRecord
  extend Enumerize

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  ROLE = ['Teacher', 'Student'].freeze

  enumerize :type, in: ROLE, scope: true

  validates :name, presence: true
  validates :type, presence: true
end
