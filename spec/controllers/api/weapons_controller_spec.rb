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

  describe 'update' do
    before(:each) do
      weapon = Weapon.create!(model: 'Foo Gun', manufacturer: 'good guys')
      put :update, params: {id: weapon.id, model: 'AK-47', manufacturer: 'Grease'}
    end

    it 'returns a 200' do
      expect(response.status).to be(200)
    end

    it 'returns the updated record in JSON form' do
      expect(json['model']).to eq('AK-47')
      expect(json['manufacturer']).to eq('Grease')
    end
  end

  describe 'show' do
    before(:each) do
      weapon = Weapon.create!(model: 'm16', manufacturer: 'Iran')
      get :show, params: {id: weapon.id}
    end

    it 'returns a 200' do
      expect(response.status).to be(200)
    end

    it 'returns the updated record in JSON form' do
      expect(json['model']).to eq('m16')
      expect(json['manufacturer']).to eq('Iran')
    end
  end

  describe 'destroy' do
    it 'returns a 200' do
      weapon = Weapon.create!(model: 'Going Away', manufacturer: 'Forever')
      delete :destroy, params: {id: weapon.id}
      expect(response.status).to be(200)
    end

    it 'removes the weapon' do
      weapon = Weapon.create!(model: 'Going Away', manufacturer: 'Forever')
      expect{delete :destroy, params: {id: weapon.id}}.to change(Weapon, :count).by(-1)
    end

    it 'responds with JSON' do
      weapon = Weapon.create!(model: 'Going Away', manufacturer: 'Forever')
      delete :destroy, params: {id: weapon.id}
      expect(json['message']).to eq('Item Deleted Successfully.')
    end
  end
end
