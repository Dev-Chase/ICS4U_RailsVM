class Order < ApplicationRecord
	belongs_to :customer
	belongs_to :employee
	belongs_to :shipper
	has_many :order_details
end
