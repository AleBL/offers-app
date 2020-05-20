class ChangeColumnNameDisableOffer < ActiveRecord::Migration[6.0]
  def change
    rename_column :offers, :disable, :enable
  end
end
