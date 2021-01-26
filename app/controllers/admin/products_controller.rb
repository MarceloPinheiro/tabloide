module Admin
  class ProductsController < AdminController
    before_action :restrict_access_for_admin!
    before_action :product_load, only: %i[edit update show]
    layout "admin"

    def index
      @products = Product.all.order(title: :asc)
      respond_to do |format|
        format.html
        format.json { render(json: @products.to_json(only: %i(id title description)), status: :ok) }
      end
    end

    def new
      @product =  Product.new
    end

    def create
      @product = Product.new
      @product.attributes = product_params
      save_product!
    end

    def edit; end

    def update
      @product.attributes = product_params
      save_product!
    end

    private
      def product_load
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:id, :title, :description, :ean, :unity, :image, :category_id)
      end

      def save_product!
        @product.save!
        render :show
      rescue StandardError
        render(params[:action] == "create" ? :new : :edit)
      end
  end
end