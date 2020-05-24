# frozen_string_literal: true

require 'rails_helper'

describe Portal::TestsController, type: :controller do
  let!(:admin)  { create :teacher }
  before        { sign_in admin }

  describe '#index' do
    def do_request
      get :index
    end

    let!(:tests) { create_list :test, 5 }

    it 'renders the :index view' do
      do_request
      expect(assigns(:tests).size).to eq tests.size
      expect(response).to render_template :index
    end
  end

  describe '#new' do
    def do_request
      get :new
    end

    it 'assigns a new test and renders the :new view' do
      do_request
      expect(assigns(:test)).to be_a_new Test
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    def do_request
      post :create, params: { test: test.attributes }
    end

  
    let(:test) { build(:test) }

    it 'successfull' do
      expect { do_request }.to change { [Test.count] }.from([0]).to([1])
      expect(response).to redirect_to edit_portal_test_url(Test.first)
    end
  end

  describe '#edit' do
    def do_request
      get :edit, params: { id: test.id }
    end

    let!(:test) { create(:test) }

    it 'returns edit page' do
      do_request
      expect(assigns(:test)).to match test
      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    def do_request
      patch :update, params: {
        id: test.id,
        test: attributes_for(:test, name: new_name)
      }
    end

    before do
      request.env['HTTP_REFERER'] = 'where_i_came_from'
    end

    let!(:test) { create(:test) }
    let!(:new_name) { 'New Test Name' }

    it 'updates test' do
      do_request

      expect(test.reload.name).to eq new_name
      expect(flash[:notice]).to eq 'Test has been updated.'
      expect(response).to redirect_to 'where_i_came_from'
    end
  end

  describe '#destroy' do
    def do_request(test)
      delete :destroy, params: { id: test.id }
    end

    let!(:test) { create(:test) }

    it 'successfully' do
      expect { do_request(test) }.to change { Test.count }.from(1).to(0)
      expect(flash[:notice]).to eq('Test has been deleted.')
      expect(response).to redirect_to portal_tests_url
    end
  end
end
