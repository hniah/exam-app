require 'rails_helper'

describe Api::V1::AuthController, type: :controller do
  describe '#create' do
    def do_request(email = nil, password = nil)
      post :create, params: {email: email, password: password}
    end

    context 'Missing params' do
      it 'should return error' do
        do_request
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq Error::API::LoginFailure.error_code
        expect(result[:message]).to eq Error::API::LoginFailure.message
      end
    end

    context 'Login successfully' do
      let!(:student) { create :student }
      it 'should return token' do
        do_request(student.email, '123123123')
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq 0
        expect(result[:token]).to eq student.api_token
      end
    end
  end
end