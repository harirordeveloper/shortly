FactoryBot.define do
  factory :analytics, class: 'Analytic' do
    user_ip { '13:233:11:22' }
    country { 'India' }
    region { 'Andhra Pradesh' }
    postal_code { '500058' }
  end
end
