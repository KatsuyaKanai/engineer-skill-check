require 'rails_helper'

RSpec.describe "Employees", type: :request do
  let!(:office) { create(:office) }
  let!(:department) { create(:department) }
  let!(:employee) { create(:employee) }
  let!(:employee2) { create(:employee, id: 2, number: 2, account: "test2", notification_posting_authority: false )}

  describe "ログイン前" do
    it "お知らせページにアクセスできない。" do
      get root_path
      expect(response).to have_http_status(302)
    end
  end


  describe "employee#index" do

    before do
      login(employee)
    end

    it "お知らせの一覧ページにアクセスできること" do
      get root_path
      expect(response.body).to include employee.number
      expect(response.body).to include employee2.number
    end


  end
end
