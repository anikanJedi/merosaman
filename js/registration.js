function Register(){

    var userpassword = $("#userpassword").val();
        var username = $("#name").val();
        var useraddress = $("#address").val();
        var useremail = $("#useremail").val();
        var userpassword = $("#userpassword").val();

        var confpassword = $("#confpassword").val();
        var usertype =$("#usertype").val();
        //alert(userpassword);
        var length = userpassword.length;

        // Checking for blank fields.
        if (username == '' || useraddress =='' || useremail == '' || userpassword == '' || confpassword == '' || usertype=='') {
                alert("Please fill all fields...!!!!!!");
        }   else if (length < 5) {
                alert("Password should atleast 5 character in length...!!!!!!");
        }   else if (!(userpassword).match(confpassword)) {
                 alert("Your passwords don't match. Try again?");
        }   else {
                userApi="http://localhost/MA/php/api.php?module=user&task=store";
                $.post(userApi,{username: username, useraddress: useraddress, useremail: useremail, userpassword: userpassword, usertype: usertype})
                .done(function(data) {
           
                if(data.status=='403') {
                    $('input[type="text"]').css({"border":"2px solid red","box-shadow":"0 0 3px red"});
                    $('input[type="password"]').css({"border":"2px solid #00F5FF","box-shadow":"0 0 5px #00F5FF"});
               
                }else if(data.status=='200'){
                    localStorage.setItem('user', JSON.stringify(data.data));
                    console.log('set in local storage');
                    window.location="index.html#login";
            
                }
            });
        }
    }
