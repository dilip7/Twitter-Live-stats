define ['marionette','jade!app/views/layouts/header'],(Marionette,template) ->
  class HeaderLayout extends Marionette.Layout
    template: template
    ui:
      taginput : "taginput"
    events:
      'click #submit' : 'getStats'
    getStats :(e) ->
      e.preventDefault()
      console.log "cliekced"
      inputstring = @$("#taginput").val()
      if inputstring is ''
        alert "Enter a keyword"
      else if inputstring.split(' ').length isnt 1
        inputstring = inputstring.split(' ')[0]
      console.log "to search"
      console.log inputstring
      require ['cs!app/helpers/app'],(apphelper) ->
        apphelper.sendtag inputstring

