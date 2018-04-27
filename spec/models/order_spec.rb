# frozen_string_literal: true

require "rails_helper"

RSpec.describe Order, type: :model do
  it "has a valid factory" do
    expect(build(:order)).to be_valid
  end

  describe "validations" do
    context "Presence" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:phone) }
      it { is_expected.to validate_presence_of(:email) }
    end
    context "email uniqueness" do
      it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    end
  end

  describe "user agreement & receive info" do
    context "user disagree consent data processing" do
      let(:order) { build(:order, :consent_data_false) }
      it "should not save the order" do
        expect(order).to_not be_valid
      end
    end
    context "user disagree accepting of terms" do
      let(:order) { build(:order, :terms_false) }
      it "should not save the order" do
        expect(order).to_not be_valid
      end
    end
    context "user disagree to receive info" do
      let(:order) { build(:order, :not_get_info) }
      it "should save the order" do
        expect(order).to be_valid
      end
    end
  end
end
