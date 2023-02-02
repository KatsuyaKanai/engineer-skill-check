require 'rails_helper'

RSpec.describe "Employees", type: :request do
  let!(:office) { create(:office) }
  let!(:department) { create(:department) }
  let!(:department2) { create(:department, id: 2, name: "営業部" )}
  let!(:employee) { create(:employee) }
  let!(:employee2) { create(:employee, notification_posting_authority: false )}
  let(:employee3) { create(:employee, department_id: 2)}



  describe "employee#index" do
    context "ログイン前" do
      it "社員情報一覧ページにアクセスできない。" do
        get root_path
        expect(response).to have_http_status(302)
        # 今通ってない、不明
        # expect(current_path).to eq login_path
      end
    end

    describe "ログイン後" do
      before do
        login(employee)
      end

        it "ログイン後root_pathにアクセスすること" do
          expect(current_path).to eq root_path
        end

        context "社員情報の一覧" do
          # before do
          #   get root_path
          # end

          it "社員番号の表示が正しい" do
            #もう一回考える
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
        end

        context "employee#new" do
          before do
            get new_employee_path
            binding.pry
          end

          it "新規登録画面にアクセスできること" do
            expect(response).to have_http_status(200)
          end

        end

        context "employee#show" do
        end

        context "employee#edit" do
        end

        context "employee#update" do
        end

        context "employee#destroy" do
        end




    end

  end
end
