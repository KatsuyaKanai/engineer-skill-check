require 'rails_helper'

RSpec.describe Notification, type: :model do
  context "お知らせのタイトル" do
    it "未入力の場合登録に失敗する" do
      notification = FactoryBot.build(:notification, title: nil)
      notification.valid?
      expect(notification.errors[:title]).to include("を入力してください")
    end
    
    it "51文字以上の場合登録に失敗する" do
      notification = FactoryBot.build(:notification, title: "a" * 51)
      notification.valid?
      expect(notification.errors[:title]).to include("は50文字以内で入力してください")
    end
  end
  it "お知らせ内容が未入力の場合登録に失敗する" do
    notification = FactoryBot.build(:notification, content: nil)
    notification.valid?
    expect(notification.errors[:content]).to include("を入力してください")
  end
end
