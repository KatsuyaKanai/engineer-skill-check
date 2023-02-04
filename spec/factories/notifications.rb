FactoryBot.define do
  factory :notification do
    sequence(:employee_id) { |n| "#{n}" }
    sequence(:title) { |n| "test#{n}title" }
    sequence(:content) { |n| "#{n}testcontent" }
  end
end
