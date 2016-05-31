class ChangeIntegerLimitInYourTable < ActiveRecord::Migration
  def change
  	change_column :sellers, :phone, :email, :integer, limit: 8
  end
end
