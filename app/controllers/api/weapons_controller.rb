class Api::WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all

    json_response(@weapons, :ok)
  end

  def create
    @weapon = Weapon.create!(weapon_params)

    json_response(@weapon, :created)
  end

  private

  def weapon_params
    params.permit(:model, :manufacturer)
  end

end
