RSpec.describe "Admin::Promotions" do
  let!(:user) { create(:user) }

  describe "GET /index" do
    let(:url) {"/admin/promotions.json"}
    let!(:promotions) { create_list(:promotion,5) }
    
    it "returns http not authenticated" do
      get "/admin/promotions"
      expect(response).to have_http_status(302)  
    end

    it "return all promotions" do
      sign_in user
      get url
      expect(body_json).to contain_exactly *promotions.as_json(only: %i(id title description))
    end
    
    it "returns http success" do
      sign_in user
      get url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    
    let!(:promotion_params) { {promotion: attributes_for(:promotion)} }

    it "add new Promotion" do
      sign_in user
      expect do
        post "/admin/promotions", params: promotion_params
      end.to change(Promotion, :count).by(1)
    end
    
    it "returns http success" do
      sign_in user
      get "/admin/promotions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    let!(:promotion) { create(:promotion) }

    it "returns http success" do
      sign_in user
      get "/admin/promotions/#{promotion.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let!(:promotion) { create(:promotion) }

    it "returns http success" do
      sign_in user
      get "/admin/promotions/#{promotion.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
