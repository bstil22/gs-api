class AddWeaponSchema < ActiveRecord::Migration[5.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.string :manufacturer
    end
  end
end
