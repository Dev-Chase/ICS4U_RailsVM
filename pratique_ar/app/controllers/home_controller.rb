class HomeController < ApplicationController
  def page
    @orders = Order.order(order_date: :desc).limit(10)
  end
end
