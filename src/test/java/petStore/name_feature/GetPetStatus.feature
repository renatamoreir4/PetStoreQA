Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * def headers = read('classpath:petStore/Suporte/headers')
    * url 'https://petstore.swagger.io/v2'

  Scenario Outline: get all users and then get the first user by id
    Given path 'pet/findByStatus'
    And params <valorStatus>
    When method get
    Then status <status_code>
    * print response[10].status
    #And match response[2] contains {status:"sold"}

    Examples:

      | status_code | valorStatus        |
      | 200         | {status:available} |
      | 200         | {status:pending}   |
      | 200         | {status:sold}      |

#    * def first = response[0]
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