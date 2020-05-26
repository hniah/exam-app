+ GitHub: git@github.com:hniah/exam-app.git
+ Live app: https://test-exam-app.herokuapp.com/

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