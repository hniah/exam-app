require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:type) }
  end
end
