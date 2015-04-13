require.config({
  //urlArgs: "bust="  + (new Date()).getTime(),
  waitSeconds: 200,
  paths:{
    // NOTE : Space between words and colon required for optimizer automation
    "backbone" : "components/backbone/backbone",
    "bootstrap-dropdown" : "components/bootstrap/js/bootstrap-dropdown",
    "bootstrap-modal" : "components/bootstrap/js/bootstrap-modal",
    "bootstrap-daterangepicker" : "components/bootstrap-daterangepicker/daterangepicker",
    "date" : "components/bootstrap-daterangepicker/date",
    "coffee-script" :  "components/coffee-script/extras/coffee-script",
    "domReady" : "components/requirejs-domready/domReady",
    "gritter" : "components/Gritter/js/jquery.gritter",
    "jquery" : "components/jquery/jquery", 
    "marionette" : "components/marionette/lib/backbone.marionette",
    "noty" : "components/noty/js/noty/jquery.noty",
    "noty-top" : "components/noty/js/noty/layouts/top",
    "noty-theme" : "components/noty/js/noty/themes/default",
    "moment" : "components/moment/moment",
    "cs" : "components/require-cs/cs",
    "jade" : "components/require-jade/jade",
    "socketio" : "components/socket.io-client/dist/socket.io",
    "underscore" : "components/underscore/underscore"
  },
  shim:{
    "backbone" : {
      deps: ['underscore','jquery'],
      exports: 'Backbone'
    },
    "bootstrap-dropdown" : {
      deps : ['jquery']
    },
    "bootstrap-modal" : {
      deps : ['jquery'],
      exports: '$'
    },
    "bootstrap-daterangepicker" : {
      deps : ['jquery','date'],
      exports: '$'
    },
    "gritter" : {
      deps : ['jquery'],
      exports: '$'
    },
    "jquery" : {
      exports: '$'
    },
    "marionette" : {
      deps: ['backbone'],
      exports: 'Marionette'
    },
    "noty" : {
      deps: ['jquery'],
      exports: 'noty'
    },
    "noty-top" : {
      deps: ["noty"]
    },
    "noty-theme" : {
      deps: ["noty"]
    },
    "socketio" : {
      exports : 'io'
    },
    "underscore" : {
      exports: '_'
    }
  }
});

require(["domReady",'cs!app/qvt'],function(domReady,QVT){
  domReady(function(){
    QVT.start();
  });
});
