RSpec.describe Product do
  describe "validation" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:unity) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to have_many(:promotion_product).dependent(:destroy) }
    it { is_expected.to belong_to :category }
  end
end
