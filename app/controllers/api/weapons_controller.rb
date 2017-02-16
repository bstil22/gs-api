class Api::WeaponsController < ActionController::Base
  def index
    render json: {guns: 'AR-PISTOL'}
  end
end