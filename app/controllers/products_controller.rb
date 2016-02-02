class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :pictures]
  before_action :pandit_authorize, except: [:index, :show]
  before_action :get_all_products, only: [:index]
  before_action :find_product, only: [:pictures, :edit, :update, :destroy]

  respond_to :js, only: :destroy

  def index
    respond_with(@products)
  end

  def sell
  end

  def destroy
    respond_with(@product.destroy)
  end

  def pictures
  end

  def edit
    respond_with @product
  end

  def update
    @product.update(product_params)
    respond_with(@product)
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
      params.require(:product).permit(:name, :art, :kolvo, :group_id, attachments_attributes: [:file])
    end

    def get_all_products
      @products = Product.all.order(:group_id)
    end

    def pandit_authorize
        authorize Product.new
    end
end
