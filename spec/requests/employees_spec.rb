require 'rails_helper'

RSpec.describe "Employees", type: :request do
  let!(:office) { create(:office) }
  let!(:department) { create(:department) }
  let!(:department2) { create(:department, id: 2, name: "営業部") }
  let!(:employee) { create(:employee) }
  let!(:employee2) { create(:employee, notification_posting_authority: false) }
  let(:employee3) { create(:employee, department_id: 2) }

  describe "ログイン前" do
    it "社員情報一覧ページにアクセスできない。" do
      get root_path
      expect(response).to redirect_to login_path
    end
  end

  describe "employee#index" do
    describe "ログイン後" do
      before do
        login(employee)
      end

      it "ログイン後root_pathにアクセスすること" do
        # "社員情報一覧画面にアクセスできること"
        expect(current_path).to eq root_path
        # expect(response).to have_http_status(200)
        expect(body).to include "ログインしました。"
      end

      context "社員情報の一覧" do
        it "社員番号の表示が正しい" do
          # もう一回考える
          expect(body).to include employee.number.to_s
          expect(body).to include employee2.number.to_s
          expect(body).not_to eq employee3.number.to_s
        end

        it "氏名の表示が正しい" do
          expect(body).to include employee.first_name
          expect(body).to include employee.last_name
          expect(body).to include employee2.first_name
          expect(body).to include employee2.last_name
          expect(body).not_to include employee3.first_name
          expect(body).not_to include employee3.last_name
        end

        it "所属の表示が正しい" do
          expect(body).to include employee.department.name
          expect(body).to include employee2.department.name
          expect(body).not_to include employee3.department.name
        end

        # it "社員情報の上限が10であること" do
        # end
      end

      context "employee#new" do
        before do
          visit new_employee_path
        end

        it "新規登録画面にアクセスできること" do
          expect(current_path).to eq new_employee_path
          # get new_employee_pathでhttp_statusが302になる
          # expect(response).to have_http_status(200)
        end
      end

      # ↓profile_spec？
      # context "employee#show" do
      #   before do
      #     get employee_profiles_path(employee2)
      #   end

      #   it "新規登録画面にアクセスできること" do
      #     expect(response).to have_http_status(200)
      #   end

      #   it "社員情報の詳細が確認できること" do
      #     expect(response.body).to include employee2.number
      #     expect(response.body).to include employee2.last_name
      #     expect(response.body).to include employee2.first_name
      #     expect(response.body).to include employee2.date_of_joining
      #     expect(response.body).to include employee2.office.name
      #     expect(response.body).not_to include employee.number
      #   end
      # end

      context "employee#edit" do
        before do
          visit edit_employee_path(employee)
        end

        it "社員情報編集ページにアクセスできること" do
          expect(current_path).to eq edit_employee_path(employee)
          # get edit_employee_path(employee)でhttp_statusが302になる
          # expect(response).to have_http_status(200)
        end

        it "社員情報編集ページの情報が正しいこと" do
          expect(body).to include employee.last_name
          expect(body).not_to include employee2.last_name
          expect(body).to include employee.account
          expect(body).to include employee.number
          expect(body).to include employee.date_of_joining.to_s
        end
      end

      # system_spec?
      # context "employee#destroy" do
      #   before do
      #     delete employee_path
      #   end

      #   it "社員情報が削除される" do
      #     binding.pry
      #     expect(response.body).to include employee.number
      #     expect(response.body).not_to include employee2.number
      #     expect(response.body).to include employee.last_name
      #     expect(response.body).not_to include employee2.last_name
      #     expect(response.body).to include employee.first_name
      #     expect(response.body).not_to include employee2.first_name
      #   end
      # end
    end
  end
end
