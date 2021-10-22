Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * def headers = read('classpath:petStore/Suporte/headers')
    * url 'https://petstore.swagger.io/v2'

  Scenario: get pet by id
    Given path '/pet/5'
    When method get
    Then status 200
    * print response

  Scenario: get pet by id (não encontrado)
    Given path '/pet/st2'
    When method get
    Then status 404
    And match response.message =="java.lang.NumberFormatException: For input string: \"st2\""
    And match response.type == "unknown"
    * print response




#   * def first = response[0]
#
#    Given path 'users', first.id
#    When method get
#    Then status 200
#
#  Scenario: create a user and then get it by id
#    * def user =
#      """
#      {
#        "name": "Test User",
#        "username": "testuser",
#        "email": "test@user.com",
#        "address": {
#          "street": "Has No Name",
#          "suite": "Apt. 123",
#          "city": "Electri",
#          "zipcode": "54321-6789"
#        }
#      }
#      """
#
#    Given url 'https://jsonplaceholder.typicode.com/users'
#    And request user
#    When method post
#    Then status 201
#
#    * def id = response.id
#    * print 'created id is: ', id
#
#    Given path id
#    # When method get
#    # Then status 200
#    # And match response contains user
#