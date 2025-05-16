namespace :db do
  desc "Populate the Countries Table with the Countries from Orders"
  task populate_countries: :environment do
    # Country.destroy_all()
    customer_countries = Customer.pluck(:country)
    supplier_countries = Supplier.pluck(:country)
    countries = (supplier_countries + customer_countries).uniq
    countries.each do |country|
      Country.create!(
        name: country,
      )
    end
  end
end
