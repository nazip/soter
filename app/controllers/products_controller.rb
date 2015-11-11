class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index
  # before_action :pandit_authorize, except: [:index, :new]
  before_action :get_all_products, except: :new

  # respond_to :js

  def index
    respond_with(@products)
  end

  def sell
  end

  def edit
  end

  def new
    @product = Product.new
    # @attachment = @product.attachment.build
  end

  def create
  end

  private

    def get_all_products
      @products = Product.all.order(:group_id)
    end

    def pandit_authorize
      authorize Product.new
    end
end
