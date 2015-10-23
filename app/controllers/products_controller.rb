class ProductsController < ApplicationController
  def index
    respond_with(@products = Product.all.order(:group_id))
  end
end
