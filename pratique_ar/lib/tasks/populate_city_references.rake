def populate_cities_in_table(a)
  a.find_each do |obj|
    cities = City.where(country_id: obj.country_id).pluck(:id)
    # puts("Len(cities): #{cities.length()}")
    city = cities.sample
    if city
      obj.update_columns(city_id: city)
    else
      puts("Country: #{Country.where(id: obj.country_id).first.name}, City: #{city}")
    end
  end
end

namespace :db do
  desc "Populate city_id column in Related Fields w/ matching ids"
  task populate_city_references: :environment do
    populate_cities_in_table(Customer)
    populate_cities_in_table(Supplier)
  end
end
