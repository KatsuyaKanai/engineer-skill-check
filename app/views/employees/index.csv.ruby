require 'csv'
CSV.generate do |csv|
  csv << %W(社員番号 名字 名前)
  @employees.each do |employee|
    csv << [employee.number, employee.last_name, employee.first_name]
  end
end
