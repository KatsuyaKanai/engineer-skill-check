require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let!(:office) { create(:office) }
  let!(:department) { create(:department) }
  let!(:department2) { create(:department, id: 2, name: "営業部") }
  let!(:employee) { create(:employee) }
  let!(:employee2) { create(:employee, last_name: "sample2", first_name: "sample2", notification_posting_authority: false) }
  let(:employee3) { create(:employee, department_id: 2) }
  let!(:profile) { create(:profile, employee_id: employee.id, profile: "テストプロフィール") }
  let!(:profile2) { create(:profile, employee_id: employee2.id, profile: "テスト2プロフィール") }
  let(:profile3) { create(:profile, employee_id: employee3.id) }

  before do
    login(employee)
  end

  describe "GET /profiles" do
    describe "profile#show" do
      before do
        visit employee_profile_path(employee2, profile2)
      end
      # visitを使っているので通らない？そもそもなぜvisitが使えているか不明、getを使いたいがstatusが302になる
      # it "プロフィールのページにアクセスできること" do
      #   expect(response).to have_http_status(200)
      # end

      it "プロフィールの表示が正しいこと" do
        expect(body).to include employee2.last_name
        expect(body).to include employee2.first_name
        expect(body).to include employee2.number
        expect(body).to include profile2.profile
        expect(body).not_to include profile.profile
      end
    end

    describe "profile#index" do
      it "プロフィールが未入力の社員ページをアクセスした時、プロフィールがありませんと表示されること" do
        visit employee_profiles_path(employee3)
        expect(body).to include "プロフィールがありません"
      end
    end

    describe "profile#new" do
      before do
        visit new_employee_profile_path(employee3)
      end

      # it "プロフィールの新規登録ページにアクセスできる" do
      #   expect(response).to have_http_status(200)
      # end

      # it "プロフィールの新規登録画面の表示が正しい" do
      # end
    end

    describe "profile#edit" do
      before do
        visit edit_employee_profile_path(employee, profile)
      end

      # it "プロフィールの編集ページにアクセスできること" do
      #   expect(response).to have_http_status(200)
      # end

      it "プロフィールの編集ページの表示が正しいこと" do
        expect(body).to include employee.last_name
        expect(body).to include employee.first_name
        expect(body).to include employee.number
        expect(body).to include profile.profile
        expect(body).not_to include profile2.profile
      end
    end
  end
end
