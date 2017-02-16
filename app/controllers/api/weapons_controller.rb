class Api::WeaponsController < ApplicationController
  def index
    render status: 200, json: {guns: ['AR-PISTOL', '1911', 'SKS']}
  end

  def create
    @weapon = Weapon.create!(weapon_params)

    json_response(@weapon, :created)
  end

  private

  def weapon_params
    params.permit(:name, :manufacturer)
  end

end