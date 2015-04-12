require('coffee-script/register');
var express = require('express');

bodyParser = require("body-parser");
cookieParser = require('cookie-parser');
session = require('express-session');
RedisStore = require('connect-redis')(session),
methodOverride = require('method-override');

errorHandler = require('errorhandler');
helmet = require('helmet');
csrf = require ('csurf');

var app;

app = module.exports = express();
app.set('trust proxy',1);
app.disable('x-powered-by');

app.use(cookieParser());
app.set('view engine', 'jade');

app.use(session({
  secret: "asdodweodnqjndoskxmlaskxmklsmx",
  store: new RedisStore({client:require('./core/redis').getClient()}),
  resave:true,
  saveUninitialized : true
}));

app.use(express.static(__dirname + '/assets'));

webappRouter = express.Router();
webappRouter.use(csrf());
webappRoutes = require('./routers')(webappRouter);
app.use('/',webappRoutes);

var server = null;
server = require('http').createServer(app);
port = require('./port');
server.listen(port,function(){
  console.log("Express boilerplate running on port %d in %s mode", port, app.settings.env);
  console.log('Server\'s UID is now ' + process.getuid());
});
