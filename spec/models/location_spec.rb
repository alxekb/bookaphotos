# frozen_string_literal: true

require "rails_helper"

RSpec.describe Location, type: :model do
  it "has a valid factory" do
    expect(build(:location)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:lat) }
    it { is_expected.to validate_presence_of(:lng) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:city_id) }
    it { is_expected.to validate_numericality_of(:lat).is_greater_than_or_equal_to(-90) }
    it { is_expected.to validate_numericality_of(:lng).is_greater_than_or_equal_to(-180) }
    it { is_expected.to validate_numericality_of(:lat).is_less_than_or_equal_to(90) }
    it { is_expected.to validate_numericality_of(:lng).is_less_than_or_equal_to(180) }
  end
end
