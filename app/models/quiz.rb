class Quiz < ApplicationRecord
    has_many :quiz_lists

    has_many :questions,
    through: :quiz_lists
end