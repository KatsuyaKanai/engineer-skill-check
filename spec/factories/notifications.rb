FactoryBot.define do
  factory :notification do
    sequence(:employee_id, &:to_s)
    sequence(:title) { |n| "test#{n}title" }
    sequence(:content) { |n| "#{n}testcontent" }
  end
end
