

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
                            'limit 10';                              
    console.log('sql phone '+sql);
    var connection=mysql.createConnection(db_config);    
    connection.query(sql,
                        function (error, rows) {  
                            connection.end();                                          
                            
                            if(error){
                                console.log('Service Phone Number error: ' + error);
                            }
                            else{
                                //console.log('phone 1 '+rows.length);
                                
                                if(rows.length > 0){
                                    //console.log('phone 2');
                                
                                    formatPhone(req, res, rows);                                
                                }else{                                    
                                    res.json({result : 'Empty'});;    
                                }
                                //console.log('phone 3');
                            }                                          
                        }
    );     
}

exports.hospitalCoordinate=function(req, res){

    var sql='SELECT latitude, longitude FROM agency, coordinate '+
              'WHERE country='+mysql.escape(req.query.country)+' AND state='+mysql.escape(req.query.state)+' '+
                    'AND city='+mysql.escape(req.query.city)+' AND category="hospital" '+ 
                    'AND agency.agencyPhoneNumber=coordinate.agencyPhoneNumber';

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
                                    //console.log('coordinate: '+rows[0].latitude+', '+rows[0].longitude);

                                    formatCoordinate(req, res, rows);                                
                                }else{                                    
                                    res.json({result : 'Empty'});;    
                                }
                            }                                          
                        }
    );     
}

function formatPhone(req, res, phoneList){
    
    var newPhoneList = '';

    //console.log('format phone 1');
    for( index = 0; index < phoneList.length; index++ ) 
        newPhoneList += phoneList[index].phoneNumber +', ';

    //console.log('format phone 2');
    saveCoordinate(req, res, newPhoneList, null, null );
}

function formatCoordinate(req, res, coordinateList){
    
    var latitudeList = '';
    var longitudeList = '';

    //console.log('format coordinate 1');
    for( index = 0; index < coordinateList.length; index++ ){
        latitudeList += coordinateList[index].latitude +', ';
        longitudeList += coordinateList[index].longitude +', ';
    }

    //console.log('format coordinate 2');
    saveCoordinate(req, res, null, latitudeList, longitudeList);
}

function saveCoordinate(req, res, phoneList, latitudeList, longitudeList){

    var sql='UPDATE deviceAccount SET latitude='+mysql.escape(req.query.latitude)+', '+
                                        'longitude='+mysql.escape(req.query.longitude)+' '+                        
                                            'WHERE clientPhoneNumber='+mysql.escape(req.query.clientPhoneNumber);

    //console.log('save coordinate 1');
    var connection=mysql.createConnection(db_config);    
    connection.query(sql,
                        function (error) {  
                            connection.end();                                          
                            
                            if(error){
                                console.log('Save Coordinate error: ' + error);
                            }                        
                            else{
                                //console.log('save coordinate 2');
                            
                                if( phoneList != null )
                                    res.json({phoneList : phoneList});
                                else
                                    res.json({latitudeList : latitudeList, longitudeList : longitudeList});                                                                                                                                 
                                    
                                //console.log('save coordinate 3');
                            }
                        }
    );     
}


