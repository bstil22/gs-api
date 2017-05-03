require 'rails_helper'

RSpec.describe Api::UserTokenController, type: :controller do
  describe 'authenticate' do
    it 'authenticates a user properly' do
      @user = User.create!(email: 'coolguy@coolguy.io', password: 'superCereal')
      post :create, params: {auth: {email: @user.email, password: @user.password}}

      expect(response.status).to eq(201)
      expect(json['jwt'].length).to be > 1
    end

    it 'returns a 404 for users without valid credentials' do
      post :create, params: {auth: {email: 'goodluck', password: 'trash'}}

      expect(response.status).to eq(404)
    end
  end
end
