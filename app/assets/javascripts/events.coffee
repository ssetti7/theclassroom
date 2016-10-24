class App.Datepicker
  init: ->
    $('#event_start_time').datetimepicker
      icons: @datepickerIcons()
      format: 'YYYY-MM-DD'
    $('#event_end_time').datetimepicker
      useCurrent: false
      icons: @datepickerIcons()
      format: 'YYYY-MM-DD'

    $('#event_start_time').on 'dp.change', (e)->
      $('#event_end_time').data('DateTimePicker').minDate(e.date)
    $('#event_end_time').on 'dp.change', (e)->
      $('#event_start_time').data('DateTimePicker').maxDate(e.date)

  datepickerIcons: ->
    {
      time: 'fa fa-clock-o',
      date: 'fa fa-calendar',
      up: 'fa fa-arrow-up',
      down: 'fa fa-arrow-down'
      next: 'fa fa-chevron-right'
      previous: 'fa fa-chevron-left'
    }
$ ->
  datepicker_manager = new App.Datepicker()
  datepicker_manager.init()
