require 'rails_helper'

RSpec.describe Option, type: :model do
   describe 'Associations' do
    it { should belong_to :question }
  end

  describe 'Validations' do
    it { should validate_presence_of(:answer) }
  end
end
