
/**
 * Module dependencies.
 */

var admin = require('./routes/admin');
var stat = require('./routes/stat');
var sp = require('./routes/sp');
var mobile = require('./routes/mobile');
var user = require('./routes/user');

var express = require('express');
var http = require('http');
var path = require('path');

var app = express();

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(express.cookieParser('your secret here'));
app.use(express.session());
app.use(app.router);
app.use(require('stylus').middleware(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'public')));
//app.use(express.static('public'));
//app.set("jsonp callback", true);

var allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization, Content-Length, X-Requested-With');
    
    console.log('Server');

    next();
};

app.configure(function () {
  app.use(allowCrossDomain);
});

// development only
if ('development' == app.get('env')) {
    app.use(express.errorHandler());
}

app.get('/', function(req, res){res.render('./login/login');});
app.post('/login', user.login);
app.post('/retrievePassword', user.retrievePassword);
app.get('/userList', user.userList);

app.get('/search', admin.search);
app.get('/searchResult', admin.searchResult);

app.get('/newService', admin.newService);
app.post('/add', admin.add);
app.get('/viewDetail', admin.viewDetail);
app.get('/edit', admin.editService);
app.post('/update', admin.deleteAgency);
app.post('/delete', admin.deleteAgency);
app.get('/validateAgency', admin.validateAgency);

app.get('/newUser', admin.newUser);
app.post('/addUser', admin.addUser);
app.get('/viewDetailUser', admin.viewDetailUser);
app.get('/editUser', admin.editUser);
app.post('/updateUser', admin.updateUser);
app.post('/deleteUser', admin.deleteUser);
app.get('/validateUser', admin.validateUser);

app.get('/stat', function(req, res){res.render('./stat/stat');});
app.get('/filterCategory', stat.filterCategory);
app.get('/filterCountry', stat.filterCountry);
app.get('/filterState', stat.filterState);
app.get('/filterCity', stat.filterCity);
app.get('/filterAgency', stat.filterAgency);
app.get('/agencyStat', stat.agencyStat);
app.get('/employeeStat', stat.employeeStat);
app.get('/emergencyResult', function(req, res){res.render('./stat/emergencyResult');});
app.get('/agencyResult', stat.agencyEmergency);
app.get('/employeeResult', stat.employeeEmergency);
app.get('/emergencyDetail', stat.emergencyDetail);

app.get('/sp', function(req, res){res.render('./sp/activeEmergency');});
app.post('/saveEmergency', sp.saveEmergency);
app.post('/relayEmergency', sp.relayEmergency);
app.get('/retrieveRelay', sp.retrieveRelay);
app.get('/history', function(req, res){res.render('./sp/history');});
app.get('/historyResult', sp.historyResult);
app.get('/retrieveHistory', sp.retrieveHistory);

app.get('/mobile', function(req, res){res.render('./mobile/home');});
app.get('/mobileEmergency', function(req, res){
    
    if(req.query.category=='hospital')
        mobile.hospitalCoordinate(req, res);
    else
        mobile.servicePhoneNumber(req, res);
});
//app.get('/servicePhoneNumber', mobile.servicePhoneNumber);
//app.get('/hospitalPhoneNumber', mobile.hospitalPhoneNumber);
app.get('/registerDevice', mobile.registerDevice);


http.createServer(app).listen(app.get('port'), function(){
    console.log('Express server listening on port ' + app.get('port'));
});
