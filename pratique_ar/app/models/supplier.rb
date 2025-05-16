class Supplier < ApplicationRecord
	has_many :products
	belongs_to :country, optional: false
	belongs_to :city #TODO: add optional: false
end
