# frozen_string_literal: true

require "rails_helper"

RSpec.describe Order, type: :model do
  let(:session_day) { create(:session_day) }
  let(:client) { create(:user, role: :client) }
  let(:photographer) { create(:user, role: :photographer) }
  let(:order) { build(:order,
                      photographer: photographer,
                      client: client,
                      photo_count: session_day.additional_photos_limit,
                      photographer_id: photographer.id)
  }
  it "has a valid factory" do
    expect(order).to be_valid
  end

  describe "validations" do
    context "Presence" do
      it { is_expected.to validate_presence_of(:client_id) }
      it { is_expected.to validate_presence_of(:photographer_id) }
      it { is_expected.to belong_to(:client) }
      it { is_expected.to belong_to(:photographer) }
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
