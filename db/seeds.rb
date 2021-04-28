require 'json'

# Seed data into database

Question.delete_all
JSON.parse(open("#{Rails.root}/db/question_seed.json").read)["questions"].each do |g|
   Question.create(:question => g["question"], :answers => g["answers"], :correct_answer => g["correct_answer"])
end