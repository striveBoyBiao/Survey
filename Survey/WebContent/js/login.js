


//验证账号
function checkform(){
	var user=$("#login_email").val();
	var password=$("#login_password").val();
	var error=$(".errorReg");
	 
	isCorrect=false;
	if(user==""){
		
		errorAlt(error.eq(0),"请输入账号");
		
	}
    if(password==""){
		
		errorAlt(error.eq(1),"请输入密码");
		
	}
    
    if(user!=""&&password!=""){
    	
     $.ajax({
		type:"POST",
		url:"/Survey/reallyLogin.shtml",
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify({
				"userAccount":user
				
		}),
		success:function(data){
			
			if(data.userAccount=="错误"||data.userPassword!=password||data.isDestroy=="是"){
				if(data.userAccount=="错误"){
					errorAlt(error.eq(0),"账号错误");
				}else if(data.isDestroy=="是"){
					errorAlt(error.eq(0),"账号已注销");
				}else{
					errorAlt(error.eq(1),"密码错误");
				}
				
			}else{
				window.location.href="/Survey/main.shtml?userAccount="+data.userAccount;
			};
			
		}
	})
	
  }
	
}





//清除
function userChange(){
	$(".errorReg").eq(0).html("");
}
function passwordChange(){
	$(".errorReg").eq(1).html("");
}




//数据错误提示
function errorAlt(divID,message){
	
	divID.html(message);
	divID.css("color","red");
	
}