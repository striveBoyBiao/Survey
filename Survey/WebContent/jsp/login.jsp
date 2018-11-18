<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>问卷星调查网 - 登录</title>
       
         <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
        <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
        
        <style type="text/css">
           .errorReg{
               
                padding-right: -400px;
                margin-top: 15px;
                width: 70px;
           }
        
        </style>
        
            
    </head>
    <body>
    <div class="container-full unlogin">
        <div class="pp-section">
		<nav class="navbar navbar-fixed-top">
	        <div class="container">
	        	<div class="row">
        			<div class="col-xs-12">
			        	<div class="navbar-header pull-left" style="margin-top:20px;margin-left: 100px;">
							
								
								
								
									<img class="logo" src="${pageContext.request.contextPath}/img/logo.gif" alt="问卷星">
								
			        		
			        	</div>
						<a href="${pageContext.request.contextPath}/register.shtml" class="btn pull-right top17" type="button" style="margin-top:20px;margin-right:100px;">注册</a>
					</div>
	        	</div>
			</div>
		</nav>
		<div class="section" id="section0" style="background-image: url(${pageContext.request.contextPath}/img/1.jpg)">
			<div class="sectionCon center-block">
				<div class="container">
					<div class="LRWrap row">
						<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2">
						    <div class="login loginUq">
						        <div class="login-con logWrap">
									<form action="${pageContext.request.contextPath}/main.shtml" method="post" name="form1" id="form1" novalidate="novalidate" >
										<div class="error errorLogBack"></div>
										<ul>
											<li class="liner">
												<input type="text" id="login_email" name="login[email]" required="required" placeholder="账号" onclick="userChange()">
												<div class="errorReg"  ></div>
											</li>
											<li>
												<input type="password" id="login_password" name="login[password]" required="required" placeholder="密码" onclick="passwordChange()">
												<div class="errorReg"  ></div>
											</li>
										</ul>
										  
										<input type="button" class="login-btn" value="登录" onclick="checkform()">
						            </form>
						        
						            <div class="login-btn-others">
						            	<p class="othersLine">快捷登录</p>
						                <p class="othersItem row">
											<span class="col-md-4 hidden-xs hidden-sm">
												<a class="weixin-login" href="#" title="使用微信账号登录">
													<i class="fa fa-weixin" aria-hidden="true"></i>
												</a>
											</span>
											<span class="col-md-4">
												<a class="qq-login" href="#" title="使用QQ账号登录">
													<i class="fa fa-qq" aria-hidden="true"></i>
												</a>
											</span>
											<span class="col-md-4">
												<a class="weibo-login" href="#" title="使用新浪微博账号登录">
													<i class="fa fa-weibo" aria-hidden="true"></i>
												</a>
											</span>
										</p>
						            </div>
						        </div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
      
    

</body></html>