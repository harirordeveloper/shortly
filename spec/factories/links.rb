FactoryBot.define do
  factory :link do
    original_url  { "http://google.com" }

    trait :invalid_link  do
      original_url { 'test' }
    end

    after :create do |link|
      create_list :analytics, 3, link: link
    end
  end
end
