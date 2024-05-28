FactoryBot.define do
  factory :user do
    sequence :name do |n|
      "hakjae#{n}"
    end
    password { '1234512345' }
    password_confirmation { '1234512345' }
  end
end
