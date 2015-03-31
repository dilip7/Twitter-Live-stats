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

app.use(session({
  secret: "asdodweodnqjndoskxmlaskxmklsmx",
  store: new RedisStore({client:require('./core/redis').getClient()}),
  resave:true,
  saveUninitialized : true
}));
