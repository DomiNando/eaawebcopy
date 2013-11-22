
mysql=require('mysql');

var db_config={
   host:'localhost',     
   user:'root',
   password:'sheis9Ke',
   database:'emergencyAssistantApp'     
};

exports.login=function(req, res){
    
    var sql='SELECT username, agencyPhoneNumber, role FROM userAccount '+
                    'WHERE username='+mysql.escape(req.body.username)+' '+  
                            'AND password='+mysql.escape(req.body.password);

    var connection=mysql.createConnection(db_config);
    connection.query(sql,
                    function(error, rows){
                        connection.end();
                    
                        if(error){
                            console.log('validate user error: ' + error);   
                        }else{
                            if(rows.length > 0)
                                res.json(rows[0]);
                            else 
                                res.json({});
                        }
                    }                        
    );
}

exports.retrievePassword=function(req, res){
    
    var sql='SELECT password FROM userAccount '+
                    'WHERE username='+mysql.escape(req.body.username)+' '+  
                            'AND email='+mysql.escape(req.body.email);

    var connection=mysql.createConnection(db_config);
    connection.query(sql,
                    function(error, rows){
                        connection.end();
                    
                        if(error){
                            console.log('retrieve password user error: ' + error);   
                        }else{
                            if(rows.length > 0)
                                res.render('./admin/user/validateUser',{title : 'password: ' + rows[0].password});
                            else
                                res.render('./admin/user/validateUser',{title : 'password: not found'});
                        }
                    }                        
    );
}

exports.userList=function(req, res){
    
    var sql='SELECT username, agencyPhoneNumber FROM userAccount WHERE username != "admin"';

    //console.log(sql);
    var connection=mysql.createConnection(db_config);
    connection.query(sql,
                    function(error, rows){
                        connection.end();
                    
                        if(error){
                            console.log('user list error: ' + error);   
                        }else{
                            res.json(rows);
                        }
                    }                        
    );
}


