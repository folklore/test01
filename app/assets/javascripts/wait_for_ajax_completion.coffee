$ ->

  KLASS = "ajax-completed"

  $(document.body)
    .on "ajaxSend", ->
      $(this).removeClass(KLASS)
    .on "ajaxComplete", ->
      $(this).addClass(KLASS)