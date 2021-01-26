module Admin  
  class AdminController < ApplicationController
    class ForbiddenAccess < StandardError; end

    include Authenticatable
    before_action :restrict_access_for_admin!


    rescue_from ForbiddenAccess do
      redirect_to "/"
    end

    private
      def restrict_access_for_admin!
        raise ForbiddenAccess unless current_user.admin?
      end
  end
end