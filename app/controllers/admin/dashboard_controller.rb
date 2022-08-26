class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_BASIC_USER'], password: ENV['HTTP_BASIC_PASSWORD']

  def show
    @category_count = Category.count
    @product_count = Product.count
  end
end
