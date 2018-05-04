# frozen_string_literal: true

require "rails_helper"

RSpec.describe PhotoSession, type: :model do
  it "has a valid factory" do
    expect(build(:photo_session)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_presence_of(:photos_count) }
    it { is_expected.to validate_presence_of(:period_of_execution) }
    it { is_expected.to validate_presence_of(:for_whom) }
    it { is_expected.to validate_presence_of(:preparation) }
    it { is_expected.to validate_presence_of(:what_to_take) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to belong_to(:currency) }
    it { is_expected.to validate_presence_of(:currency_id) }
  end
end
