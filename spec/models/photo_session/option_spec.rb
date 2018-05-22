require "rails_helper"

RSpec.describe PhotoSession::Option, type: :model do
  it "has a valid factory" do
    expect(build(:option)).to be_valid
  end

  describe "validations" do
    context "attributes" do
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.not_to be_nil }
      it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(1) }
    end
    context "associations" do
      it { is_expected.to belong_to(:photo_session) }
      it { is_expected.to belong_to(:additional_option) }
    end
  end
end
