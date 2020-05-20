class ChangeDefaultValueEnableOffer < ActiveRecord::Migration[6.0]
  def change
    change_column_default :offers, :enable, from: true, to: false 
  end
end
