require_relative '../models/init'
firstNames = %w{chris ray trevor robert kevin amy joe darryl renee annie travis bryan}
lastNames  = %w{jones tran nguyen brown white cooper smith banks kimble howser harris}

100.times do |i|
  firstName = firstNames.sample
  middleName = firstNames.sample
  lastName = lastNames.sample

  Person.create!(
    :id => i + 1,
    :first_name => firstName,
    :middle_name => middleName,
    :last_name => lastName,
    :gender => ['m', 'f'].sample,
    :email => firstName + "." + lastName + "@evisions.com"
  )
end
