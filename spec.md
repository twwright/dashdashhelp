# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
-- A question `has_many` answers
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
-- An upvote `belongs_to` a user and an answer
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
-- A question `has_many` respondents `through` answers using the `user` association for its source
-- A user `has_many` answers `through` questions
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
-- User `has_many` questions `through` answers, question `has_many` respondents `through` answers using the `source: :users`
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
-- A user can submit the `content` of an answer
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
-- Validation errors are present for the following models: Answer, Upvote, User, and Question
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
-- There is an `unanswered` scope on the `question` model, with an aliased route of `/unanswered`
- [x] Include signup (how e.g. Devise)
-- Manual signup is handled by `Clearance`
- [x] Include login (how e.g. Devise)
-- Manual login is handled by `Clearance`
- [x] Include logout (how e.g. Devise)
-- Manual logout is handled by `Clearance`
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
-- Github omniauth is implemented
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
-- A user question is created via `
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
-- Technically, you can visit `questions/1/answers/new` to create a new answer, but you don't need to :)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
-- Validation errors are present for new questions, new answers that don't contain text
-- Validation errors are present on sign up forms

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
-- View helpers are located in `app/helpers`
- [x] Views use partials if appropriate
-- Views user partials throughout
