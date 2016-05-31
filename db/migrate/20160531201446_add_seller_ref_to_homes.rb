class AddSellerRefToHomes < ActiveRecord::Migration
  def change
    add_reference :homes, :seller, index: true, foreign_key: true
  end
end
