class Customer < ApplicationRecord
  belongs_to :country, optional: false
	belongs_to :city #TODO: add optional: false
end
