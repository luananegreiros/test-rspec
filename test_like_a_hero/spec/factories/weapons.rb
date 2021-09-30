FactoryBot.define do
  factory :weapons do 
      name { FFaker::Name.name } 
      description { FFaker::Lorem.phrase }
      power_base { Random.rand(3000..999999) }
      power_step { 100 } 
      level { Random.rand(1..99) } 
  end
end
