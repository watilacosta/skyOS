# frozen_string_literal: true

FactoryBot.define do
  factory :equipment do
    sequence(:icao) { |x| ('AAAA'..'ZZZZ').to_a[x] }
    sequence(:name) { |x| "Aircraft #{x}" }
    sequence(:short_name) { |x| "A#{x}" }

    trait :invalid do
      short_name { nil }
      icao { nil }
      name { nil }
    end
  end
end
