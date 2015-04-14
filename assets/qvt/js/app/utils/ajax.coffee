define ['jquery','cs!app/core/mediator'],($,mediator) ->
  class AjaxUtil
    ajax: (route,data,type,callback) ->
      mediator.events.trigger "ajaxstart"
      $.ajax
        type: type
        ###
        url: settings.getAPIEndPoint(route) + (
          if type is "GET" and data.id?
            "/#{data.id}"
          else if routeoverride?
            "/#{routeoverride}"
          else
            ""
        ) + "?code=#{password}&_csrf=#{token}"
        ###
        url: '' + route
        dataType: "json"
        crossDomain: true
        data: data
        success: (_data) =>
          callback _data
          mediator.events.trigger "ajaxend"
        error: ()=>
          mediator.events.trigger "ajaxend"

  new AjaxUtil()
