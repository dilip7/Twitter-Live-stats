require('coffee-script/register');
express = require('express');
exphbs = require('express-handlebars'),


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
routes = require('./routes');
config = require('./config');
streamHandler = require('./utils/streamHandler');


var app;

app = module.exports = express();
app.set('trust proxy',1);
app.disable('x-powered-by');


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());
//app.set('view engine', 'jade');

mongoose.connect('mongodb://localhost:27017/tweets');

// Set handlebars as the templating engine
app.engine('handlebars', exphbs({ defaultLayout: 'main'}));
app.set('view engine', 'handlebars');

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
port = require('./port');
server.listen(port,function(){
  console.log("Express boilerplate running on port %d in %s mode", port, app.settings.env);
  console.log('Server\'s UID is now ' + process.getuid());
});

// Create a new ntwitter instance
var twit = new twitter(config.twitter);

// Index Route
app.get('/', routes.index);

// Page Route
app.get('/page/:page/:skip', routes.page);

// Initialize socket.io
var io = require('socket.io').listen(server);

// Set a stream listener for tweets matching tracking keywords
twit.stream('statuses/filter',{ track: 'android'}, function(stream){
  streamHandler(stream,io);
});


