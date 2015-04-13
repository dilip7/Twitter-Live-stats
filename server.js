require('coffee-script/register');
express = require('express');
//exphbs = require('express-handlebars'),


bodyParser = require("body-parser");
cookieParser = require('cookie-parser');
session = require('express-session');
RedisStore = require('connect-redis')(session),
methodOverride = require('method-override');
errorHandler = require('errorhandler');
helmet = require('helmet');
csrf = require ('csurf');
twitter = require('twitter');
mongoose = require('mongoose');
//routes = require('./routes');
config = require('./config');
streamHandler = require('./utils/streamHandler');


var app;

app = module.exports = express();
app.set('trust proxy',1);
app.disable('x-powered-by');


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');

//mongoose.connect('mongodb://localhost:27017/tweets');

// Set handlebars as the templating engine
//app.engine('handlebars', exphbs({ defaultLayout: 'main'}));
//app.set('view engine', 'handlebars');

app.use(session({
  secret: "asdodweodnqjndoskxmlaskxmklsmx",
  store: new RedisStore({client:require('./core/redis').getClient()}),
  resave:true,
  saveUninitialized : true
}));

app.use(express.static(__dirname + '/assets'));



webappRouter = express.Router();
//webappRouter.use(csrf());
webappRoutes = require('./routers')(webappRouter);
app.use('/',webappRoutes);


var server = null;
server = require('http').createServer(app);
require('./core/bootstrap').isEnvironmentSane(server,function(err,port){ 
  if(err){
    console.log(err);
    process.exit(1)
  }
  else
  {
    server.listen(port,function(){
    console.log("Server  listening on port %d in %s mode", port , app.settings.env);
    console.log('Server\'s UID is now ' + process.getuid());
    });
  }
});
module.exports = app;



// Create a new ntwitter instance
//var twit = new twitter(config.twitter);

// Index Route
//app.get('/', routes.index);

// Page Route
//app.get('/page/:page/:skip', routes.page);

// Initialize socket.io
//app.io = require('socket.io').listen(server);

//console.log(app.io);
// Set a stream listener for tweets matching tracking keywords
// pass comma separated for many 
/**
twit.stream('statuses/filter',{ track: 'livquik'}, function(stream){
  streamHandler(stream,app.io);
});
**/


