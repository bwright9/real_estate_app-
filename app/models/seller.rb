class Seller < ActiveRecord::Base
	has_many :homes, dependent: :destroy

  validates_presence_of :name

  def self.by_name
    order(:name)
  end
end
