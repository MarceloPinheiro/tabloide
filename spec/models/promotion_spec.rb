RSpec.describe Promotion do
  describe "validation" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:start_promotion) }
    it { is_expected.to validate_presence_of(:end_promotion) }
    it { is_expected.to have_many(:promotion_product).dependent(:destroy) }
  end

  describe "Future Date Promotion" do
    it "Last day" do
      subject.start_promotion = Date.today - 1.day
      subject.valid?
      expect(subject.errors ).to include :start_promotion
    end

    it "Today" do
      subject.start_promotion = Date.today
      subject.valid?
      expect(subject.errors ).not_to include :start_promotion
    end

    it "Future day" do
      subject.start_promotion = Date.today + 1.day
      subject.valid?
      expect(subject.errors ).not_to include :start_promotion
    end
  end
end
