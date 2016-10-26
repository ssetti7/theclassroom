Feature: Home show
  In the application home the user can see:
    - The days of the current week and the events that take place this days

  @wip
  Scenario: See event that take place a day of the current week
    Given there is an event scheduled for today
    When the user visit the home page
    Then should see the event listed in the proper day