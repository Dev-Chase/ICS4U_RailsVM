def populate(a)
  a.find_each do |obj|
    country = Country.find_by(name: obj.country)
    obj.update_columns(country_id: country.id)
  end
end

namespace :db do
  desc "Populate country_id column in Customers w/ matching ids"
  task populate_country_references: :environment do
    populate(Customer)
    populate(Supplier)
  end
end
