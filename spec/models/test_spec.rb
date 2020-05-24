require 'rails_helper'

RSpec.describe Test, type: :model do
  describe 'Associations' do
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end
