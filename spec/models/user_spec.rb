# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    describe "password" do
      context "given user signs up" do
        let(:valid_user) { build(:user, password: "password", password_confirmation: "password") }
        let(:invalid_user) { build(:user, password: nil) }
        it "validates presence" do
          expect(valid_user).to be_valid
          expect(invalid_user).to_not be_valid
        end
      end

      context "given password_confirmation is given" do
        let(:user_invalid_password) { build(:user, password: nil, password_confirmation: "password") }
        it "validates presence" do
          expect(user_invalid_password).to_not be_valid
        end
      end
      context "given password is less than 8 characters" do
        let(:user_short_password) { build(:user, password: "12345") }
        it "validates length is greater than 8 characters" do
          expect(user_short_password).to_not be_valid
        end
      end
    end
  end
end
