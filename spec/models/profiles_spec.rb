require 'rails_helper'

RSpec.describe "Profiles", type: :model do
  describe "profile#new" do
    context "プロフィールの文字数" do
      it "プロフィールの文字数が未入力の時登録できない" do
        profile = FactoryBot.build(:profile, profile: nil)
        profile.valid?
        expect(profile.errors[:profile]).to include("を入力してください")
      end
      it "プロフィールの文字数が301文字以上の場合登録できない" do
        profile = FactoryBot.build(:profile, profile: "a" * 301)
        profile.valid?
        expect(profile.errors[:profile]).to include("は300文字以内で入力してください")
      end
    end
  end
end
