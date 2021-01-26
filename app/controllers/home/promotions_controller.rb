module Home
  class PromotionsController < HomeController

    before_action :promotion_load, only: %i[show]

    def index
      @promotions = Promotion.where("? between start_promotion and end_promotion",Date.today).order("start_promotion asc")
    end

    def show 
      @first = true
    end

    private
      def promotion_load
        @promotion = Promotion.find(params[:id])
      end
  end
end