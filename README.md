+ GitHub: git@github.com:hniah/exam-app.git
+ Live app: https://test-exam-app.herokuapp.com/

* Setup project run at local:
    - Step 1: Pull project from github
    - Step 2: Go to {project_folder}/config 
    - Step 3: Make a copy application.rb from application.yml.sample and update username and password your PostgreSQL
    - Step 4: Open Terminal -> Go to root directory of the project
    - Step 5: $ bundle install
    - Step 6: $ yarn install
    - Step 7: $ rake db:create db:migrate db:seed
    - Step 8: $ rails s

* Portal:
  - Login:
    + email: teacher@example.com
    + password: 12345678

* API
    - Login
        + Endpoint: https://test-exam-app.herokuapp.com/v1/auth
        + Method: Post
        + Params: {email: 'student@example.com', password: '12345678'}
    - Get list of tests
        + Endpoint: https://test-exam-app.herokuapp.com/v1/tests
        + Method: Get
        + Header: {'Access-Token': 'Get access-token when student login successfully'}
    - Get test
        + Endpoint: https://test-exam-app.herokuapp.com/v1/tests/{test_id}
        + Method: Get
        + Header: {'Access-Token': 'Get access-token when student login successfully'}
    - Save answers: (not implement save the result to database)
        + Endpoint: https://test-exam-app.herokuapp.com/v1/tests/{test_id}/commit
        + Method: Post
        + Header: {'Access-Token': 'Get access-token when student login successfully'}
        + Params: {
                    "answers": [
                      {"question_id": 1, "option_id": 2},
                      {"question_id": 1, "option_id": 2}
                    ]
                  }