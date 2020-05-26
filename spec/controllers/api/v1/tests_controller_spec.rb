require 'rails_helper'

describe Api::V1::TestsController, type: :controller do
  let!(:student) { create :student, :token }

  describe '#index' do
    let!(:tests) { create_list :test, 5 }
    def do_request
      get :index
    end

    context 'Missing token' do
      it 'should return error' do
        do_request
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq Error::API::MissingToken.error_code
        expect(result[:message]).to eq Error::API::MissingToken.message
      end
    end

    context 'Invalid token' do
      let(:header) { {'Access-Token': ''} }

      it 'should return token' do
        request.headers.merge! header
        do_request
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq Error::API::InvalidToken.error_code
        expect(result[:message]).to eq Error::API::InvalidToken.message
      end
    end

    context 'Get list of test' do
      let(:header) { {'Access-Token': student.api_token} }

      it 'successfully' do
        request.headers.merge! header
        do_request
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq 0
        expect(result[:data].size).to eq tests.size
      end
    end
  end

  describe '#show' do
    let!(:test) { create :test}
    
    def do_request
      get :show, params: { id: test.id }
    end

    context 'Missing token' do
      it 'should return error' do
        do_request
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq Error::API::MissingToken.error_code
        expect(result[:message]).to eq Error::API::MissingToken.message
      end
    end

    context 'Invalid token' do
      let(:header) { {'Access-Token': ''} }

      it 'should return token' do
        request.headers.merge! header
        do_request
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq Error::API::InvalidToken.error_code
        expect(result[:message]).to eq Error::API::InvalidToken.message
      end
    end

    context 'Get test' do
      let(:header) { {'Access-Token': student.api_token} }

      it 'successfully' do
        request.headers.merge! header
        do_request
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq 0
        expect(result[:data][:id]).to eq test.id
      end
    end
  end

  describe '#commit' do
    let!(:test) { create :test}
    
    def do_request
      post :commit, params: { id: test.id, answers: [{question_id: 1, option_id: 1}] }
    end

    context 'Missing token' do
      it 'should return error' do
        do_request
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq Error::API::MissingToken.error_code
        expect(result[:message]).to eq Error::API::MissingToken.message
      end
    end

    context 'Invalid token' do
      let(:header) { {'Access-Token': ''} }

      it 'should return token' do
        request.headers.merge! header
        do_request
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq Error::API::InvalidToken.error_code
        expect(result[:message]).to eq Error::API::InvalidToken.message
      end
    end

    context 'Save test' do
      let(:header) { {'Access-Token': student.api_token} }

      it 'successfully' do
        request.headers.merge! header
        do_request
        result = JSON.parse(response.body).with_indifferent_access
        expect(result[:error_code]).to eq 0
      end
    end
  end

end