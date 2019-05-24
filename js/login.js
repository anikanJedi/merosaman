function Login(){
        var useremail = $("#email").val();
        var userpassword = $("#password").val();
        // Checking for blank fields.
        
    
        if( useremail =='' || userpassword ==''){
        
        alert(userpassword);
        alert(useremail);
        alert("Please fill all fields!!!");
        }
        else {
            
            userApi="http://localhost/MA/php/api.php?module=user&task=login";
            $.post(userApi,{ useremail: useremail, userpassword:userpassword})
            .done(function(response) {

                //alert("into the login.js")

                console.log(response);
                data = JSON.parse(response);
                console.log(data.status);
                alert(data.status);
                                
                if(data.status=='403') {
                    $('input[type="text"]').css({"border":"2px solid red","box-shadow":"0 0 3px red"});
                    $('input[type="password"]').css({"border":"2px solid #00F5FF","box-shadow":"0 0 5px #00F5FF"});
                    alert(response);
                }else if(data.status=='200'){
                    localStorage.setItem('user', JSON.stringify(data.data));
                    console.log('set in local storage');
                    alert(response);

                    window.location="index.html#dashboard";
                }
            });

            
        }
    }