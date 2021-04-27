# Quiz Api

This project contains a basic Rails API that provides the magic behind the quizzes.

## Goals

* Finish implementing the existing endpoints
* Add new endpoints to support the frontend application

## Setup

* Install dependencies: `bundle install`
* Migrate database: `rake db:migrate`
* Run seed `rake db:seed`
* Run server on port 3100: `rails s -p 3100`

## Endpoints

1. This endpoint is responsible for generating a new quiz and associating 
questions to them. 

```
POST /quiz
```

Finish implementing this endpoint so that it does the following:
   - Take the questions randomly selected and assoicate them to the quiz
	   - Make sure you think about how to store answers to the quiz questions
   - Return how many questions there are in the quiz
   - Return first question in quiz when created.

<br> 

2. This is a new endpoint that should be added to handle answer submissions for a specific question

```
POST /quiz/:quiz_id/question/:question_id
```

It should do the following:

 - Check whether or not the submitted answer is correct
 - Store the user's answer and returns the result along with the next question

To make tests pass:

 - Give action an alias of 'answer'
 - Use response structure:

```

{ message: 'Recorded Answer', is_correct: nil, next_question: { question: nil, id: nil, answers: nil } }

```

<br>

3. (Optional) This is a new endpoint that should be added to return the highest quiz scorers. 

```     
GET  "Quizzes Leaderboard" 
```

It should do the following:

   - Return the top 10 scorers for the quiz thus far, including name and score

To make tests pass:

 - Use response structure:

```

{ leaderboard: [{name: "Rick Sanches", score: 0}] }

```

<br>    

## Completed Endpoints

This endpoint has already been completed, it allows a user to submit their name to finish and claim their quiz score.

```
POST /quiz/:quiz_id/claim 
```

# quiz-api
