namespace :db do
  desc "Populate the Countries Table with the Countries from Orders"
  task populate_cities: :environment do
    # City.destroy_all() # TODO: comment line
    
    
    customer_arr = Customer.pluck(:city, :country)
    supplier_arr = Supplier.pluck(:city, :country)
    arr = (supplier_arr + customer_arr).uniq
    matched_arr = arr.map do |item|
      [item[0], Country.where(name: item[1]).pluck(:id).first]
    end
    matched_arr.each do |item|
      City.create!(
        name: item[0],
        country_id: item[1]
      )
    end
  end
end
