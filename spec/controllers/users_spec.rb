require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    let!(:users) { create_list(:user, 3) }

    before { get :index }

    it 'populates an array of users' do
      expect(assigns(:users)).to match_array(users)
    end

    it 'renders the :index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }

    before { get :show, params: { id: user } }

    it 'assigns the requested user to @user' do
      expect(assigns(:user)).to eq(user)
    end

    it 'renders the :show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new User to @user' do
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new user in the database' do
        expect {
          post :create, params: { user: attributes_for(:user) }
        }.to change(User, :count).by(1)
      end

      it 'redirects to the new user' do
        post :create, params: { user: attributes_for(:user) }
        expect(response).to redirect_to(user_path(assigns(:user)))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new user in the database' do
        expect {
          post :create, params: { user: attributes_for(:user, name: nil) }
        }.not_to change(User, :count)
      end

      it 're-renders the :new template' do
        post :create, params: { user: attributes_for(:user, name: nil) }
        expect(response).to render_template :new
      end
    end
  end
end
