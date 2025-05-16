require 'faker'
namespace :db do 
	task :populate_employee_educations => :environment do 

		I18n.locale = :en
		Faker::Config.locale = :en
		(Employee.all.length()*2).times do 
			EmployeeEducation.create(
				employee_id: Employee.pluck(:id).sample,
				institution: [Faker::Educator.university, Faker::University.name].sample,
				degree: Faker::Educator.degree,
				date_obtained: Faker::Date.between(from: "1960-01-01", to: "2025-2-28"),
				completed: [true, true, true, true, false].sample,
				)
		end
		# 		category_name: Faker::FunnyName.two_word_name,
		# 		description: Faker::ChuckNorris.fact
		# 		address: Faker::Address.street_address,
		# 		city: Faker::Address.city,
		# 		postal_code: Faker::Address.postcode,
		# 		country: Faker::Address.country,
		# 		phone: Faker::PhoneNumber.phone_number
		# 		address: Faker::Address.street_address,
		# 		city: Faker::Address.city,
		# 		postal_code: Faker::Address.postcode,
		# 		country: Faker::Address.country
		# 		last_name: Faker::FunnyName.last_name,
		# 		first_name: Faker::FunnyName.first_name,
		# 		birth_date: Faker::Date.between(from: "1930-01-01", to: "2000-12-31"),
		# 		notes: Faker::ChuckNorris.fact
		# 		employee_id: Employee.pluck(:id).sample,
		# 		shipper_id: Shipper.pluck(:id).sample,
		# 		customer_id: Customer.pluck(:id).sample,
		# 		order_date: Faker::Date.between(from: "2010-01-01", to: "2023-12-31")
		# 		product_name: "#{Faker::Food.dish} #{Faker::FunnyName.name}",
		# 		supplier_id: Supplier.pluck(:id).sample,
		# 		category_id: Category.pluck(:id).sample,
		# 		unit: Faker::Number.within(range: 1..20),
		# 		price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
		# 			order_id: order_id,
		# 			product_id: Product.pluck(:id).sample,
		# 			quantity: Faker::Number.within(range: 1..20)
	end
end
