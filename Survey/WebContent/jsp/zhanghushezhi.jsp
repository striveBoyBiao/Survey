<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="zh-CN">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>问卷星调查网 - 基本信息</title>
		<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
		<link href="${pageContext.request.contextPath}/css/account.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		
		
		
		<script type="text/javascript">
		   
		    function save(){
		    	var danqian=$("#form_password").val();
		    	var news=$("#form_new_password_first").val();
		    	var queren=$("#form_new_password_second").val();
		    	var divID=document.getElementsByClassName("pwdFrontEr");
		    	
		    	 
		    	//当前
		    	if(danqian==""){
		    		errorAlt(divID[0],"请输入密码")
		    	}
		    	
		    	//新的
                if(news==""){
                	errorAlt(divID[1],"请输入密码")
		    	}
		    	//确认
                if(queren==""){
                   errorAlt(divID[2],"请输入密码")
		        }
		    	
		    	if(danqian!=""&&news!=""&&queren!=""){
		    		
		    		
		    		$.ajax({
		    			type:"GET",
		    			url:"/Survey/main/updatePasswords.shtml",
		    			dataType:"json",
		    			contentType:"application/json;charset=utf-8",
		    			data:{
		    					"danqian":danqian,
		    					"news":news,
		    					"queren":queren
		    			},
		    			success:function(data){
		    				if(data.errorMessage=="密码错误"){
		    					errorAlt(divID[0],"密码错误");
		    					
		    				}else if(data.errorMessage=="密码不相等"){
		    					
		    					errorAlt(divID[2],"密码不相等");
		    				}else{
		    					errorAlt(divID[0],"修改成功");
		    				};
		    				
		    			}
		    		
		    		});
		    		
		    		
		    	}
		    	
		    	
		    }
		
		    
		    
		  //数据错误提示
		    function errorAlt(divID,message){
		    	
		    	divID.innerHTML=message;
		    	divID.style.color="red";
		    	
		    	
		    	
		    }
		    var divID=document.getElementsByClassName("pwdFrontEr");
		  //清除
		    function errorChange1(){
		    	divID[0].innerHTML="";
		    }
		    function errorChange2(){
		    	divID[1].innerHTML="";
		    }
		    function errorChange3(){
		    	divID[2].innerHTML="";
		    }
		    function errorChange4(){
		    	divID[3].innerHTML="";
		    }
		    function errorChange5(){
		    	divID[4].innerHTML="";
		    }
		  
		  
		  
		  function xiaohui(){
			  var account=$("#form_email").val();
			  var password=$("#form_password1").val();
			  var divID=document.getElementsByClassName("pwdFrontEr");
			
			
			  //账号
		    	if(account==""){
		    		
		    		errorAlt(divID[3],"请输入账号")
		    	}
		    	
		    	//密码
              if(password==""){
              	
		    		errorAlt(divID[4],"请输入密码")
		    	}
			  
			  
		    	
              if(account!=""&&password!=""){
		    		
		    		
		    		$.ajax({
		    			type:"GET",
		    			url:"/Survey/main/destoryUser.shtml",
		    			dataType:"json",
		    			contentType:"application/json;charset=utf-8",
		    			data:{
		    					"account":account,
		    					"password":password
		    					
		    			},
		    			success:function(data){
		    				
		    				if(data.errorMessage=="密码错误"){
		    					errorAlt(divID[4],"密码错误")
		    					
		    				}else if(data.errorMessage=="账户错误"){
		    					errorAlt(divID[3],"账户错误")
		    				}else{
		    					window.location.href="/Survey/entry.shtml";
		    				};
		    				
		    			}
		    		
		    		});
		    		
		    		
		    	}
		    	
		    	
		    	
		    	
		  }
		  
		  
		  
		  
		  
		  
		
		</script>
		
		

	</head>

	<body>
		
		
		<jsp:include page="header.jsp"></jsp:include>
		
		

		
		
		
		
		

		<div class="mainWrap container-full">
			<div class="container">
				<div class="main-personal clearfix">
					<div class="row">
						<div class="col-xs-12 col-sm-10 col-sm-offset-1">

							<div class="main-personal-left rp-personal-nav">
								<h1 class="pull-left hidden-xs hidden-sm">个人中心</h1>
								<ul class="rp-clearfix pull-right">
									<div class="row">
										<li class="">
											<a href="${pageContext.request.contextPath}/main/personalData.shtml"><i class="fa fa-user" aria-hidden="true"></i>个人资料</a>
										</li>
										
										<li class="">
											<a href="${pageContext.request.contextPath}/main/surveyHistory.shtml"><i class="fa fa-clock-o" aria-hidden="true"></i>问卷历史</a>
										</li>
										
										<li class="active">
											<a href="${pageContext.request.contextPath}/main/accountSet.shtml"><i class="fa fa-cog" aria-hidden="true"></i>账户设置</a>
										</li>
									</div>
								</ul>
							</div>
							
							
							
							
							<div class="main-personal-right rp-main-personal-right panel">
								<div class="main-personal-account">
									<ul>
										<li>
											<label class="tit" for="login_pwd">修改密码</label>
											<div class="con form">
												<div class="pwdBackError"></div>
												<form action="#" method="post" novalidate="novalidate">
													<ul>
														<li>
															<label for="form_password" class="required" id="danqian">当前密码</label>
															<input type="password" id="form_password" name="form[password]" required="required" onclick="errorChange1()">
															<div class="pwdFrontEr"></div>
														</li>
														<li>
															<label for="form_new_password_first" class="required" id="news">新密码</label>
															<input type="password" id="form_new_password_first" name="form[new_password][first]" required="required" onclick="errorChange2()">
															<div class="pwdFrontEr"></div>
														</li>
														<li>
															<label for="form_new_password_second" class="required" id="queren">确认密码</label>
															<input type="password" id="form_new_password_second" name="form[new_password][second]" required="required" onclick="errorChange3()">
															<div class="pwdFrontEr"></div>
														</li>
													</ul>
													<input type="hidden" id="form__token" name="form[_token]" value="43466642c470e9fda11f4da5c3e78a3fa039138e">

													<div class="btn"><input id="pwd_error" tabindex="0" type="button" value="保存" onclick="save()"></div>
												</form>
											</div>
										</li>
										<hr>
										
									
										
										
										
										
										
										
										<li>
											<label class="tit" for="withdraw">注销账户&nbsp;&nbsp;&nbsp;<p><i class="fa fa-pencil-square-o" aria-hidden="true"></i>请您完成以下简单的问卷调查后，点击注销按钮完成会员注销手续</p></label>
											<div class="con withdraw">
												<div class="step2 form">

													<form action="#" method="post" novalidate="novalidate">
														<ul class="reason">
															<div class="pwdBackError"></div>
															<li>
																<label for="form_email" class="required">请输入您的账号</label>
																<input type="email" id="form_email" name="form[email]" required="required" onclick="errorChange4()">
																<div class="pwdFrontEr"></div>
															</li>
															<li>
																<label for="form_password" class="required">请输入您的密码</label>
																<input type="password" id="form_password1" name="form[password]" required="required" onclick="errorChange5()">
																<div class="pwdFrontEr"></div>
															</li>
															<li>
																<label class="required">注销用户的理由</label>
																<div id="form_reason">
																	<input type="checkbox" id="form_reason_0" name="form[reason][]" value="问卷调查活动的数量太少了">
																		<label for="form_reason_0">问卷调查活动的数量太少</label>
																	<input type="checkbox" id="form_reason_1" name="form[reason][]" value="每个问卷的奖励太少">
																		<label for="form_reason_1">每个问卷的奖励太少</label>
																	<input type="checkbox" id="form_reason_2" name="form[reason][]" value="问卷所要的时间太长">
																		<label for="form_reason_2">问卷所要的时间太长</label>
																	<input type="checkbox" id="form_reason_3" name="form[reason][]" value="相对于问题，积分报酬太少">
																		<label for="form_reason_3">相对于问题来说，积分报酬太少</label>
																	<input type="checkbox" id="form_reason_4" name="form[reason][]" value="问卷的内容太难">
																		<label for="form_reason_4">问卷的内容太难</label>
																	<input type="checkbox" id="form_reason_5" name="form[reason][]" value="工作生活太忙，没时间参加">
																		<label for="form_reason_5">工作生活太忙，没时间参加</label>
																	<input type="checkbox" id="form_reason_6" name="form[reason][]" value="失去兴趣了">
																		<label for="form_reason_6">失去兴趣</label>
																</div>
																<div class="pwdFrontEr"></div>
															</li>
														</ul>
														<input type="hidden" id="form__token" name="form[_token]" value="43466642c470e9fda11f4da5c3e78a3fa039138e">

														<div class="btn"><input type="button" value="保存" onclick="xiaohui()"></div>
													</form>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		<jsp:include page="footer.jsp"></jsp:include>
		

	</body>

</html>
