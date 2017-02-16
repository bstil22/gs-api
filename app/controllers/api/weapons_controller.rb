class Api::WeaponsController < ActionController::Base
  def index
    render json: {guns: ['AR-PISTOL', '1911', 'SKS']}
  end
end