module Admin
  class PromotionsController < AdminController
    before_action :restrict_access_for_admin!
    before_action :promotion_load, only: %i[edit update show]
    layout "admin"

    def index
      @promotions = Promotion.all.order(end_promotion: :desc)
      respond_to do |format|
        format.html
        format.json { render(json: @promotions.to_json(only: %i(id title description)), status: :ok) }
      end
    end

    def show; end

    def new
      @promotion =  Promotion.new
    end

    def create
      @promotion = Promotion.new
      @promotion.attributes = promotion_params
      save_promotion!
    end

    def edit; end

    def update
      @promotion.attributes = promotion_params
      save_promotion!
    end

    def promotion_product
      @promotion_product = PromotionProduct.new
      @promotion_product.attributes = promotion_product_params
      save_promotion_product!
    end

    private
      def promotion_load
        @promotion = Promotion.find(params[:id])
      end

      def promotion_params
        params.require(:promotion).permit(:id, :title, :description, :start_promotion, :end_promotion, :observation, image: [])
      end

      def promotion_product_params
        params.require(:promotion_product).permit(:id, :promotion_id, :product_id, :price, :discount, :special)
      end

      def save_promotion!
        @promotion.save!
        render :show
      rescue StandardError
        render(params[:action] == "create" ? :new : :edit)
      end

      def save_promotion_product!
        @promotion_product.save!
        redirect_to action: "show", id: @promotion_product.promotion_id
      rescue StandardError
        print("Erro")
      end

  end
end
