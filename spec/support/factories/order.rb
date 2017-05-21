FactoryGirl.define do
  factory :order do
    client Faker::Name.name
    description Faker::Commerce.product_name
    unit_price Faker::Number.number(4)
    amount Faker::Number.number(1)
    address Faker::Address.street_address
    supplier Faker::Company.name
  end
end
