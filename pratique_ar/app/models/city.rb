class City < ApplicationRecord
  belongs_to :country, optional: false
end
