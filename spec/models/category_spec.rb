RSpec.describe Category do
  describe "validation" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to have_many(:product).dependent(:destroy) }
  end
end
