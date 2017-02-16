require 'rails_helper'

RSpec.describe Api::WeaponsController, type: :controller do
  it 'does not blow up' do
    get 'index'

    expect(response).to be_success
    expect(response['Content-Type']).to match('application/json')
  end
end
