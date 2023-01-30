FactoryBot.define do
  factory :notification do
    employee_id { '1' }
    title { 'testtitle' }
    content { 'testcontent' }
  end
end
