$("document").ready(function(){
					
					
					
					//同意条款，才能注册
					$("#signup_subscribe").click(function(){
						
						ischck();
						
					}) 
					
					$("#signup_termAccepted").click(function(){
						ischck();
					})
					
					function ischck(){
						var subs=$("#signup_subscribe").prop("checked");
						var term=$("#signup_termAccepted").prop("checked");
						
						if(subs&&term){
							
							$(".login-btn").prop("disabled",false);
						}else{
							
							$(".login-btn").prop("disabled",true);
						}
					}
					
					
					
					
					
					
					
})


var divID=document.getElementsByClassName("errorReg");
var isExit=false;
//检查表单数据
function checkform(){
	
	var signup_nick=document.getElementById("signup_nick");
	if(signup_nick&&signup_nick.value==""){
		
		signup_nick.focus();
		errorAlt(divID[0],"请输入昵称");
		return false;
	}else{
		
		var len0=signup_nick.value.length;
		if(len0>6){
			errorAlt(divID[0],"昵称过长");
			return false;
		}
		
	}

	
	var signup_user=document.getElementById("signup_user");
	if(signup_user&&signup_user.value==""){
		
		signup_user.focus();
		errorAlt(divID[1],"请输入账号");
		 m();
	}else{
		var reg=/\w{1,12}/;
		var re=/[\u4e00-\u9fa5]/;
		var len1=signup_user.value.length;
		
		if(len1>12){
			errorAlt(divID[1],"账号1-12位");
			return false;
		}
		
		if(!reg.test(signup_user.value)||re.test(signup_user.value)){//判断是否有汉字
			errorAlt(divID[1],"账号格式不对");
			return false;
		}
		
		
		
	}
	
	
	
	
	
	var signup_pwd=document.getElementById("signup_pwd");
	if(signup_pwd&&signup_pwd.value==""){
		
		signup_pwd.focus();
		errorAlt(divID[2],"请输入密码");
		return false;
	}else{
		var reg=/\w{1,12}/;
		
		var len2=signup_pwd.value.length;
		if(len2>12){
			errorAlt(divID[2],"密码过长");
			return false;
		}
		if(!reg.test(signup_pwd.value)||re.test(signup_pwd.value)){
			errorAlt(divID[2],"密码格式不对");
			return false;
		}
	
		
		
	}
	
	
	var signup_captcha=document.getElementById("signup_captcha");
	if(signup_captcha&&signup_captcha.value==""){
		
		signup_captcha.focus();
		errorAlt(divID[3],"请输入验证码");
		return false;
	}else{
		var yan=signup_captcha.value;
		if(yan!=str){
			errorAlt(divID[3],"验证码错误");
			return false;
		}
		
	}
	
	
	if(isExit){
		return false;
	}
	
	
	
	
	
	
	
	
	
}





//消除提示
function change0(){
	var signup_nick=document.getElementById("signup_nick");
	var len=signup_nick.value.length;
	if(len>0&&len<7){
		divID[0].innerHTML="";
	}
}
function change1(){
	isExit=false;
	var signup_user=document.getElementById("signup_user");
	var reg=/\w{1,12}/;
	var len=signup_user.value.length;
	if(reg.test(signup_user.value)&&len>0&&len<13){
		divID[1].innerHTML="";
	}
	
	
	var zhanghao=signup_user.value;
	$.ajax({
		type:"POST",
		url:"/Survey/account.shtml",
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify({
				"userAccount":zhanghao
		}),
		success:function(data){
			
			if(data.userAccount){
				
				errorAlt(divID[1],"账号已存在");
				
				isExit=true;
				
			};
		}
	
	});
	
}

function change2(){
	var signup_pwd=document.getElementById("signup_pwd");
	var reg=/\w{1,12}/;
	var len=signup_pwd.value.length;
	if(reg.test(signup_pwd.value)&&len>0&&len<13){
		divID[2].innerHTML="";
	}
}


function change3(){
	var signup_captcha=document.getElementById("signup_captcha");
	var yan=signup_captcha.value;
	if(yan==str){
		divID[3].innerHTML="";
	}
}


	



//数据错误提示
function errorAlt(divID,message){
	
	divID.innerHTML=message;
	divID.style.color="red";
	
	
	
}

























			