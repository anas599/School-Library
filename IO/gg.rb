require 'csv'
CSV.open('mydata.csv', 'w') do |csv|
  csv << %w[Name Age Gender]
  csv << ['Alice', 25, 'F']
  csv << ['Bob', 30, 'M']
end