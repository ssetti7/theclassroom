FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@theclassroom.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    email
    password 'Sample123456'
    password_confirmation 'Sample123456'
  end
end
