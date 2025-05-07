require 'faker'
namespace :seed do 
	task :populate => :environment do 

		I18n.locale = :en
		Faker::Config.locale = :en
		10.times do 
			Shipper.create(
				shipper_name: Faker::FunnyName.two_word_name,
				phone: Faker::PhoneNumber.phone_number
				)
		end

		5.times do 
			Category.create(
				category_name: Faker::FunnyName.two_word_name,
				description: Faker::ChuckNorris.fact
				)
		end

		20.times do
			Supplier.create(
				supplier_name: Faker::FunnyName.two_word_name,
				contact_name: Faker::FunnyName.two_word_name,
				address: Faker::Address.street_address,
				city: Faker::Address.city,
				postal_code: Faker::Address.postcode,
				country: Faker::Address.country,
				phone: Faker::PhoneNumber.phone_number
				)

		end
		
		100.times do
			Customer.create(
				customer_name: Faker::FunnyName.two_word_name,
				contact_name: Faker::FunnyName.two_word_name,
				address: Faker::Address.street_address,
				city: Faker::Address.city,
				postal_code: Faker::Address.postcode,
				country: Faker::Address.country
				)

		end

		60.times do 
			Employee.create(
				last_name: Faker::FunnyName.last_name,
				first_name: Faker::FunnyName.first_name,
				birth_date: Faker::Date.between(from: "1930-01-01", to: "2000-12-31"),
				notes: Faker::ChuckNorris.fact
			)
		end

		200.times do 
			o=Order.create(
				employee_id: Employee.pluck(:id).sample,
				shipper_id: Shipper.pluck(:id).sample,
				customer_id: Customer.pluck(:id).sample,
				order_date: Faker::Date.between(from: "2010-01-01", to: "2023-12-31")
			)
			#puts o.order_date 
		end
		
		120.times do 
			po = Product.create(
				product_name: "#{Faker::Food.dish} #{Faker::FunnyName.name}",
				supplier_id: Supplier.pluck(:id).sample,
				category_id: Category.pluck(:id).sample,
				unit: Faker::Number.within(range: 1..20),
				price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
			)
			#debugger
			#po.errors.each {|pe|puts.pe} 
		end

		Order.all.pluck(:id).each do |order_id|
			num = rand(1..20)
			num.times do 
				OrderDetail.create(
					order_id: order_id,
					product_id: Product.pluck(:id).sample,
					quantity: Faker::Number.within(range: 1..20)
				)
			end
		end
	end
end