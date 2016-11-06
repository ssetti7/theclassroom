Feature: Create event
  An event is an exceptional activity of the school, different from a Lesson.
  Ex: Science day, Bring you dad day, College meeting...

  Business rules:
    - An event can be realized at the same time that a Lesson
    - An event could cancel the lessons for a whole day
    - An event could cancel the lessons programmed at the same time that the event

  @done
  Scenario: User is not authenticated
    Given the user is not authenticated
    When visit create event view
    Then should be redirected to login view

  @done
  Scenario: Logged user create event parallel to lessons
    Given The user is logged in the system
    When visit create event view
    And fill the event form with the valid data
    Then should see a message saying that the event creation succeed

#  Scenario: Logged user create event that cancel concurrent lessons
#    Given The user is logged in the system
#    And there is a lesson scheduled
#    When Go to create event view
#    And select the same time for an existing lesson
#    And fill the the form selecting cancel paralel lessons
#    Then should see a message saying that creation succeed
#    And should see a message saying that the lesson was canceled
#
#  Scenario: Logged user create event parallel to lessons
#    Given The user is loggued in the system
#    When Go to create event view
#    And fill the event form with the valid data
#    Then should see a message saying that creation succeed
#
#  Scenario: Logged user create event that cancel all day lessons
#    Given The user is loggued in the system
#    And there are several lessons for the day
#    When Go to create event view
#    And select a day in which there are several lessons scheduled
#    And fill the the form selecting cancel all day lessons
#    Then should see a message saying that creation succeed
#    And should see a message with a list of al lessons canceled

