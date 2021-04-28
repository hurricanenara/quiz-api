Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'quiz' => 'quiz#create'
  post 'quiz/:quiz_id/claim' => 'quiz#claim', as: :claim
  post '/quiz/:quiz_id/question/:question_id' => 'quiz#verify', as: :answer
end
