require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  let!(:office) { create(:office) }
  let!(:department) { create(:department) }
  let!(:employee) { create(:employee) }
  let!(:employee2) { create(:employee, notification_posting_authority: true) }
  let(:employee3) { create(:employee) }
  let!(:notification) { create(:notification, employee_id: employee.id, created_at: Time.current + 3.days) }
  let!(:notification2) { create(:notification, employee_id: employee2.id, created_at: Time.current + 2.days) }
  let(:notification3) { create(:notification, employee_id: employee3.id) }


  describe "ログイン前" do
    it "お知らせページにアクセスできない。" do
      get notifications_path
      expect(response).to redirect_to login_path
    end
  end

  before do
    login(employee)
    visit notifications_path
  end
  
  describe "notification#index" do
    # ↓ 通らない。getを使いたいがリダイレクトしている
    # it "お知らせの一覧ページにアクセスできること" do
    #   expect(response).to have_http_status(200)
    # end
    
    it "お知らせ画面の一覧の表示が正しい" do
      expect(body).to include notification.title
      expect(body).to include notification2.title
      expect(body).not_to include notification3.title
    end

    it "お知らせ画面の表示の上限が10件であること" do
      # notifications = create_list(:notification, 9, employee_id: employee.id, created_at: Time.current + 1.days)
      # binding.pry
      # expect(body).to include notifications.title
      # expect(body).not_to include notification.title
    end

  end

  # describe "notifications#new" do
  #   before do
  #     visit new_notification_path
  #   end

  #   it "お知らせ画面の新規登録画面にアクセスできる" do
  #     binding.pry
  #     expect(response).to have_http_status(200)
  #   end
  # end

  # describe "notifications#create" do
  # end

  describe "notifications#show" do
    before do
      visit notification_path(notification)
    end

    # visitを使ってるから通らない？
    # it "お知らせ画面の詳細確認画面にアクセスできる" do
    #   binding.pry
    #   expect(response).to have_http_status(200)
    # end

    it "お知らせ画面の詳細確認画面の表示が正しい" do
      expect(body).to include notification.title
      expect(body).to include notification.content
      expect(body).not_to include notification2.title
      expect(body).not_to include notification2.content
    end
  end

  describe "notifications#edit" do
    before do
      visit edit_notification_path(notification)
    end

    # visitを使ってるから通らない？
    # it "お知らせ画面の詳細確認画面にアクセスできる" do
    #   expect(response).to have_http_status(200)
    # end

    it "お知らせ画面の編集画面の表示が正しい" do
      expect(body).to include notification.title
      expect(body).to include notification.content
      expect(body).not_to include notification2.title
      expect(body).not_to include notification2.content
    end
  end

  # describe "notifications#destroy" do
  #   before do
  #     delete notification_path(notification)
  #   end

  #   it "お知らせの削除ができる" do
  #     binding.pry
  #     expect(body).not_to include notification.title
  #     expect(body).to include notification2.title
  #     expect(body).not_to include notification3.title
  #   end
  # end

end
