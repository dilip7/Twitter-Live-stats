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


var app;

app = module.exports = express();
app.set('trust proxy',1);
app.disable('x-powered-by');


// express components 
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');


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
    server.listen( process.env.PORT || port,function(){
    console.log("Server  listening on port %d in %s mode", port , app.settings.env);
    console.log('Server\'s UID is now ' + process.getuid());
    require('./helpers/getlivestats').getdata();
    });
  }
});
module.exports = app;
