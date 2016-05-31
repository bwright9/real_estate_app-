class Address < ActiveRecord::Base
	belongs_to :home
	validates :street, :city, :state, :zip, :presence => true 
end
