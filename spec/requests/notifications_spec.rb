require 'rails_helper'

RSpec.describe "/notifications", type: :request do
  let!(:office) { create(:office) }
  let!(:department) { create(:department) }
  let!(:employee) { create(:employee) }
  let!(:employee2) { create(:employee, id: 2, number: 2, account: "test2", notification_posting_authority: false )}
  let!(:notification) { create(:notification) }
  let!(:notification2) { create(:notification, employee_id: 2) }
  
  before do
    login(employee)
  end

  describe "notification#index" do
    before do
      get notifications_path
    end

    it "お知らせの一覧ページにアクセスできること" do
      get notifications_path
      expect(response).to have_http_status(200)
    end


  end

  describe "notifications#new" do


  end

  describe "notifications#create" do
  end

  describe "notifications#show" do
  end

  describe "notifications#edit" do
  end

  describe "notifications#destroy" do
  end

end
