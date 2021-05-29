FactoryBot.define do
  factory :book do
    title { "hoge" }
    learn { "fuga" }
    genre { "aaa" }
    association :user
    #after(:build) do |book|
      #book.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    #end
  end
end