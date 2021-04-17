FactoryBot.define do
  factory :education do
    eduName {"Bachelor"}
  end
  factory :invalid_education, parent: :education do
    eduName {nil}
  end
end
