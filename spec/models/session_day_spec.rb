# frozen_string_literal: true

require "rails_helper"

RSpec.describe SessionDay, type: :model do
  it "has a valid factory" do
    expect(build(:session_day)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:photo_session_id) }
    it { is_expected.to validate_presence_of(:currency_id) }
    it { is_expected.to validate_presence_of(:price_per_additional_photo) }
    it { is_expected.to validate_presence_of(:additional_photos_limi) }

    it { is_expected.to belong_to(:photo_session) }
    it { is_expected.to belong_to(:currency) }
  end
end
