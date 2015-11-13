class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index
  # before_action :pandit_authorize, except: [:index, :new]
  before_action :get_all_products, except: [:new, :pictures]
  before_action :find_product, only: [:pictures, :edit]

  # respond_to :js

  def index
    respond_with(@products)
  end

  def sell
  end

  def pictures
  end

  def edit
    respond_with @product
  end

  def show
    redirect_to products_path
  end

  def new
    respond_with(@product = Product.new)
  end

  def create
    respond_with(@product = Product.create(product_params))
  end

  private

    def find_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :kolvo, :group_id, attachments_attributes: [:file])
    end

    def get_all_products
      @products = Product.all.order(:group_id)
    end

    def pandit_authorize
      authorize Product.new
    end
end
