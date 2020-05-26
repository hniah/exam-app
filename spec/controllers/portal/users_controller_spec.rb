require 'rails_helper'

describe Portal::UsersController, type: :controller do
  let!(:admin)  { create :teacher }
  before        { sign_in admin }

  describe '#index' do
    def do_request
      get :index
    end

    let!(:users) { create_list :user, 5, :random_role }

    it 'renders the :index view' do
      do_request
      expect(assigns(:users).size).to eq User.count
      expect(response).to render_template :index
    end
  end

  describe '#show' do
    def do_request
      get :show, params: { id: user.id }
    end

    let!(:user) { create :student }

    it 'renders the :show view' do
      do_request
      expect(assigns(:user)).to match user
      expect(response).to render_template :show
    end
  end

  describe '#new' do
    def do_request
      get :new
    end

    it 'assigns a new user and renders the :new view' do
      do_request
      expect(assigns(:user)).to be_a_new User
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    def do_request
      post :create, params: { user: user.attributes.merge(password: '123123', password_confirmation: '123123') }
    end

     context 'creates a teacher' do
      let(:user) { build(:user, :teacher) }

      it 'successfull' do
        expect { do_request }.to change { [Teacher.count] }.from([1]).to([2])
        expect(response).to redirect_to portal_users_url
      end
    end

    context 'creates a student' do
      let(:user) { build(:user, :student) }

      it 'successfull' do
        expect { do_request }.to change { [Student.count] }.from([0]).to([1])
        expect(response).to redirect_to portal_users_url
      end
    end
  end

  describe '#edit' do
    def do_request
      get :edit, params: { id: user.id }
    end

    let!(:user) { create(:teacher) }

    it 'returns edit page' do
      do_request
      expect(assigns(:user)).to match user
      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    def do_request
      patch :update, params: {
        id: user.id,
        user: attributes_for(:user, name: new_name)
      }
    end

    let!(:user) { create(:user, :student) }
    let!(:new_name) { 'New User Name' }

    it 'updates user' do
      do_request

      expect(user.reload.name).to eq new_name
      expect(flash[:notice]).to eq 'User has been updated.'
      expect(response).to redirect_to portal_user_url(user)
    end
  end

  describe '#destroy' do
    def do_request(user)
      delete :destroy, params: { id: user.id }
    end

    context 'deletes a user not current user' do
      let!(:user) { create(:student) }

      it 'successfully' do
        expect { do_request(user) }.to change { Student.count }.from(1).to(0)
        expect(flash[:notice]).to eq('User has been deleted.')
        expect(response).to redirect_to portal_users_url
      end
    end

    context 'deletes a current user' do
      it 'unsuccessfully' do
        do_request(admin)
        expect(Teacher.count).to eq 1
        expect(flash[:alert]).to eq('Can not remove yourself.')
        expect(response).to redirect_to portal_users_url
      end
    end
  end
end
