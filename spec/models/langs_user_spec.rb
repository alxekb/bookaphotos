# frozen_string_literal: true

require "rails_helper"

RSpec.describe LangsUser, type: :model do
  it "has a valid factory" do
    expect(build(:langs_user)).to be_valid
  end

  describe "validations" do
    context "attributes" do
      it { is_expected.to validate_presence_of(:user_id) }
      it { is_expected.to validate_presence_of(:lang_id) }
    end
    it { is_expected.to belong_to(:lang) }
    it { is_expected.to belong_to(:user) }
  end
end
