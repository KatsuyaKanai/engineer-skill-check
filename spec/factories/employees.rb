FactoryBot.define do
  factory :employee do
    sequence(:id, &:to_s)
    department_id { '1' }
    office_id { '1' }
    sequence(:number, &:to_s)
    sequence(:last_name) { |n| "test#{n}" }
    sequence(:first_name) { |n| "testman#{n}" }
    sequence(:account) { |n| "test#{n}" }
    password { "testpass" }
    sequence(:email) { |n| "testman#{n}@example.com" }
    date_of_joining { "Thu, 05 Jan 2023" }
    employee_info_manage_auth { true }
    notification_posting_authority { true }
  end
end
