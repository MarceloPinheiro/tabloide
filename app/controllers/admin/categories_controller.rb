module Admin
  class CategoriesController < AdminController
    before_action :restrict_access_for_admin!
    before_action :category_load, only: %i[edit update show]
    layout "admin"

    def index
      @categories = Category.all.order(title: :asc)
      respond_to do |format|
        format.html
        format.json { render(json: @categories.to_json(only: %i(id title)), status: :ok) }
      end
    end

    def new
      @category =  Category.new
    end

    def create
      @category = Category.new
      @category.attributes = category_params
      save_category!
    end

    def edit; end

    def update
      @category.attributes = category_params
      save_category!
    end

    private
      def category_load
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:id, :title)
      end

      def save_category!
        @category.save!
        redirect_to action: :index
      rescue StandardError
        render(params[:action] == "create" ? :new : :edit)
      end

  end
end
