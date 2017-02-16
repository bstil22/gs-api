require 'rails_helper'

RSpec.describe Api::WeaponsController, type: :controller do
  describe 'index' do
    it 'returns a 200' do
      get :index

      expect(response).to be_success
      expect(response['Content-Type']).to match('application/json')
    end
  end

  describe 'create' do
    before {post :create, params: {model: 'M4 Carbine', manufacturer: 'Colt'}}

    it 'returns a 201 Created' do
      expect(response.status).to be(201)
    end

    it 'creates a Weapon' do
      expect{post :create, params: {model: 'M4 Carbine', manufacturer: 'Colt'}}.to change(Weapon, :count).by(1)
    end

    it 'returns the record in JSON form' do
      expect(json['model']).to eq('M4 Carbine')
      expect(json['manufacturer']).to eq('Colt')
    end
  end
end
