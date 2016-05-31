class Home < ActiveRecord::Base
  belongs_to :seller
  has_one :address
  validates_presence_of :square_feet, :price
  # validates :beds, :baths, :home_type
  # validates :active, inclusion: {in: [true, false]}

  def self.by_feet
    order(:square_feet)
  end

  def self.by_cost
    order(:price)
  end

  def status
    if self.active
      "Home is available for purchase!"
    else
      "Unfortunately, this home is no longer available."
    end
  end
end
