FactoryGirl.define do
  factory :event, class: Event do

    sequence :name do |n|
      "Pikachu#{n}"
    end

    sequence :hash_data do |n|
      "hash#{n}"
    end

  	coords { "123,123" }
  	category { "Electric" }
  	dex_number { 25 }
  	description { "Pika. pika. Find it next to the cashier" }
  	image { "https://s3-eu-west-1.amazonaws.com/calpaterson-pokemon/25.jpeg" }
  	level_min { 10 }
  	level_max { 20 }
  end
end
