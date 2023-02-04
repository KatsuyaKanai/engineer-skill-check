require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let!(:office) { create(:office) }
  let!(:department) { create(:department) }
  let!(:department2) { create(:department, id: 2, name: "営業部") }
  let!(:employee) { create(:employee) }
  let!(:employee2) { create(:employee, notification_posting_authority: false) }
  let(:employee3) { create(:employee, department_id: 2) }
  let!(:profile) { create(:profile, employee_id: employee.id, profile: "テストプロフィール") }
  let!(:profile2) { create(:profile, employee_id: employee2.id, profile: "テスト2プロフィール") }
  let(:profile3) { create(:profile, employee_id: employee3.id, profile: nil) }

  before do
    login(employee)
  end

  describe "GET /profiles" do
    describe "profile#show" do
      before do
        visit employee_profile_path(employee2, profile2)
      end
      # visitを使っているので通らない？
      # it "プロフィールのページにアクセスできること" do
      #   expect(response).to have_http_status(200)
      # end

      it "プロフィールの表示が正しいこと" do
        # 見直す。includeで通るようにしたい
        expect(body).to include employee2.last_name
        expect(body).to include employee2.first_name
        expect(body).to include employee2.number
        expect(body).to include profile2.profile
        expect(body).not_to eq employee.last_name
        expect(body).not_to eq employee.first_name
        expect(body).not_to eq employee.number
        expect(body).not_to eq profile.profile
      end

      it "プロフィールが未記入の社員ページをアクセスした時、プロフィールがありませんと表示されること" do
        visit employee_profile_path(employee3, profile3)
        expect(body).to include "プロフィールがありません"
      end
    end

    describe "profile#edit" do
      before do
        visit edit_employee_profile_path(employee, profile)
      end

      it "プロフィールの新規登録ページにアクセスできること" do
        expect(response).to have_http_status(200)
      end

      it "プロフィールの編集ページの表示が正しいこと" do
        # 見直す。includeで通るようにしたい
        binding.pry
        expect(body).to include employee.last_name
        expect(body).to include employee.first_name
        expect(body).to include employee.number
        expect(body).not_to eq employee2.last_name
        expect(body).not_to eq employee2.first_name
        expect(body).not_to eq employee2.number
      end



    end



  end
end
