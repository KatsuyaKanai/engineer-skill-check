require 'rails_helper'

RSpec.describe "Employees", type: :model do

  describe "employees#new" do
    context "社員番号" do
      it "社員番号が未入力の場合無効である" do
        employee = FactoryBot.build(:employee, number: nil)
        employee.valid?
        expect(employee.errors[:number]).to include("を入力してください")
      end

      it "社員番号が半角数字以外の場合無効である" do
        employee = FactoryBot.build(:employee, number: "a")
        employee.valid?
        expect(employee.errors[:number]).to include("は半角数字を入力してください")
      end

      it "社員番号が既に登録されているの場合無効である" do
        binding.pry
        employee = FactoryBot.create(:employee)
        employee2 = FactoryBot.build(:employee, number: "1")
        
        employee2.valid?
        expect(employee2.errors[:number]).to include("はすでに存在しています")
      end
    end

    it "氏名(姓)が未入力の場合無効である" do
      employee = FactoryBot.build(:employee, last_name: nil)
      employee.valid?
      expect(employee.errors[:last_name]).to include("を入力してください")
    end

    it "氏名(名)が未入力の場合無効である" do
      employee = FactoryBot.build(:employee, first_name: nil)
      employee.valid?
      expect(employee.errors[:first_name]).to include("を入力してください")
    end

    it "アカウントが未入力の場合無効である" do
      employee = FactoryBot.build(:employee, account: nil)
      employee.valid?
      expect(employee.errors[:account]).to include("を入力してください")
    end

    it "emailが未入力の場合無効である" do
      employee = FactoryBot.build(:employee, email: nil)
      employee.valid?
      expect(employee.errors[:email]).to include("を入力してください")
    end
  
    it "パスワードが未入力の場合無効である" do
      employee = FactoryBot.build(:employee, password: nil)
      employee.valid?
      expect(employee.errors[:password]).to include("を入力してください")
    end

    it "入社年月日が未入力の場合無効である" do
      employee = FactoryBot.build(:employee, date_of_joining: nil)
      employee.valid?
      expect(employee.errors[:date_of_joining]).to include("を入力してください")
    end

    it "入社年月日が今日以降の日付の場合無効である" do
      employee = FactoryBot.build(:employee, date_of_joining: "Thu, 01 Jan 2030")
      employee.valid?
      expect(employee.errors[:date_of_joining]).to include("は今日以降の日付は登録できません")
    end
  end
end
