RSpec.describe Favorite do
  describe "validation" do
    it { is_expected.to belong_to :product }
    it { is_expected.to belong_to :user }
  end
end
