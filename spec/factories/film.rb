FactoryGirl.define do
  sequence :id do |n|
    n
  end
  factory :film do
    id
    name { Film.random_value_of :name }
    description { Film.random_value_of :description }
#    premiere: 2016-02-13
#    us_premiere: 2016-02-13
#    genre: MyString
#    running_time: 1
#    country: MyString
#    language: MyString
#    budget: 
#    box_office: 
  end
end
