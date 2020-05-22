class AddEnableAdminToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :enable_admin, :boolean, default: true, null: false
  end
end
