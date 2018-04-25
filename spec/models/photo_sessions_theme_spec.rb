# frozen_string_literal: true

require "rails_helper"

RSpec.describe PhotoSessionsTheme, type: :model do
  it "has a valid factory" do
    expect(build(:photo_sessions_theme)).to be_valid
  end

  describe "validations" do
    context "attributes" do
      it { is_expected.to validate_presence_of(:photo_session_id) }
      it { is_expected.to validate_presence_of(:theme_id) }
    end
    it { is_expected.to belong_to(:photo_session) }
    it { is_expected.to belong_to(:theme) }
  end
end
