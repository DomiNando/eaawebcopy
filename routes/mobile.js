

var mysql=require('mysql');

var db_config={
   host:'localhost',     
   user:'root',
   password:'sheis9Ke',
   database:'emergencyAssistantApp'     
};

exports.registerDevice=function(req, res){

    console.log('phone '+mysql.escape(req.query.clientPhoneNumber));
    console.log("name "+mysql.escape(req.query.name));

    var sql='INSERT INTO deviceAccount VALUES('+mysql.escape(req.query.clientPhoneNumber)+', '
                                            + ' '+mysql.escape(req.query.name)+', '
                                            + '" ", '                                            
                                            + '" ")';
    //console.log('register device: '+sql);
    var connection=mysql.createConnection(db_config);    
    connection.query(sql,
                        function (error) {  
                            connection.end();                                          
                            
                            if(error){
                                console.log('Register Device error: ' + error);
                                
                                res.json({result : 'Fail'});                                
                            }
                            else{
                                res.json({result : 'Success'});                                
                            }                                          
                        }
    );     
}

exports.servicePhoneNumber=function(req, res){

    var sql='SELECT DISTINCT(altPhoneNumber) phoneNumber FROM agency, alternativePhoneNumber, alternativeArea '+
                    'WHERE agency.agencyPhoneNumber=alternativeArea.agencyPhoneNumber '+
                            'AND agency.agencyPhoneNumber=alternativePhoneNumber.agencyPhoneNumber '+
                            'AND alternativeArea.altArea='+mysql.escape(req.query.city)+' '+
                            'AND category='+mysql.escape(req.query.category)+' '+
                            'AND state='+mysql.escape(req.query.state)+' '+
                            'AND country='+mysql.escape(req.query.country)+' '+
                            'limit 3';                              
    console.log('sql phone '+sql);
    var connection=mysql.createConnection(db_config);    
    connection.query(sql,
                        function (error, rows) {  
                            connection.end();                                          
                            
                            if(error){
                                console.log('Service Phone Number error: ' + error);
                            }
                            else{
                                if(rows.length > 0){
                                    formatPhone(req, res, rows);                                
                                }else{                                    
                                 console.log('z');
                                    res.json({phoneList : ""});    
                                }
                            }                                          
                        }
    );     
}

exports.hospitalCoordinate=function(req, res){

    var sql='SELECT latitude, longitude FROM agency, coordinate, alternativeArea '+
              'WHERE country='+mysql.escape(req.query.country)+' '+
                    'AND state='+mysql.escape(req.query.state)+' '+
                    'AND category="hospital" '+ 
                    'AND alternativeArea.altArea='+mysql.escape(req.query.city)+' '+
                    'AND agency.agencyPhoneNumber=alternativeArea.agencyPhoneNumber '+
                    'AND agency.agencyPhoneNumber=coordinate.agencyPhoneNumber '+
                    'limit 3';

    console.log('sql coordinate '+sql);
    var connection=mysql.createConnection(db_config);    
    connection.query(sql,
                        function (error, rows) {  
                            connection.end();                                          
                            
                            if(error){
                                console.log('Hospital Coordinate error: ' + error);
                            }
                            else{
                                if(rows.length > 0){
                                    formatCoordinate(req, res, rows);                                
                                }else{                                    
                                    res.json({latitudeList : '', longitudeList : ''});    
                                }
                            }                                          
                        }
    );     
}

function formatPhone(req, res, phoneList){
    
    var newPhoneList = '';

    for( index = 0; index < phoneList.length; index++ ) 
        newPhoneList += phoneList[index].phoneNumber +', ';

    saveCoordinate(req, res, newPhoneList, null, null );
}

function formatCoordinate(req, res, coordinateList){
    
    var latitudeList = '';
    var longitudeList = '';

    for( index = 0; index < coordinateList.length; index++ ){
        latitudeList += coordinateList[index].latitude +', ';
        longitudeList += coordinateList[index].longitude +', ';
    }

    saveCoordinate(req, res, null, latitudeList, longitudeList);
}

function saveCoordinate(req, res, phoneList, latitudeList, longitudeList){

    var sql='UPDATE deviceAccount SET latitude='+mysql.escape(req.query.latitude)+', '+
                                        'longitude='+mysql.escape(req.query.longitude)+' '+                        
                                            'WHERE clientPhoneNumber='+mysql.escape(req.query.clientPhoneNumber);

    var connection=mysql.createConnection(db_config);    
    connection.query(sql,
                        function (error) {  
                            connection.end();                                          
                            
                            if(error){
                                console.log('Save Coordinate error: ' + error);
                            }                        
                            else{
                                if( phoneList != null )
                                    res.json({phoneList : phoneList});
                                else
                                    res.json({latitudeList : latitudeList, longitudeList : longitudeList});                                                                                                                                 
                            }
                        }
    );     
}

exports.mobileChat=function(req, res){

    var sql='SELECT DISTINCT(alternativePhoneNumber.agencyPhoneNumber) phoneNumber FROM agency, alternativePhoneNumber, alternativeArea '+
                    'WHERE agency.agencyPhoneNumber=alternativeArea.agencyPhoneNumber '+
                            'AND agency.agencyPhoneNumber=alternativePhoneNumber.agencyPhoneNumber '+
                            'AND alternativeArea.altArea='+mysql.escape(req.query.city)+' '+
                            'AND category='+mysql.escape(req.query.category)+' '+
                            'AND state='+mysql.escape(req.query.state)+' '+
                            'AND country='+mysql.escape(req.query.country)+' '+
                            'limit 3';                              

    console.log('sql phone '+sql);
    var connection=mysql.createConnection(db_config);    
    connection.query(sql,
                        function (error, rows) {  
                            connection.end();                                          
                            
                            if(error){
                                console.log('Service Phone Number error: ' + error);
                            }
                            else{
                                if(rows.length > 0){
                                    formatPhoneChat(req, res, rows);                                
                                }else{                                    
                                    res.json({result : 'Empty'});;    
                                }
                            }                                          
                        }
    );     
}

function formatPhoneChat(req, res, phoneList){
    
    var newPhoneList = '';

    for( index = 0; index < phoneList.length; index++ ) 
        newPhoneList += phoneList[index].phoneNumber +', ';

    res.json({phoneList : newPhoneList});
}
