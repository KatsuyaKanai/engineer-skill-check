FactoryBot.define do
  factory :employee do
    id { '1' }
    department_id { '1' }
    office_id { '1' }
    number { "1" }
    last_name { "test" }
    first_name { "testman" }
    account { "test" }
    password { "testpass" }
    email { "testman@example.com" }
    date_of_joining { "Thu, 05 Jan 2023" }
    employee_info_manage_auth { true }
    notification_posting_authority { true }
  end
end
