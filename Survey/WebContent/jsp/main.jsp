<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>问卷星调查网 - 问卷调查</title>
		 <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
		<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
		<script>

			$("document").ready(function(){
				$("#sy").attr("class","nav-link active");
				$("#wj").attr("class","nav-link ");
				$("#ks").attr("class","nav-link ");
				$("#gl").attr("class","nav-link ");
			})	
		</script>
		<style type="text/css">
		    .ziti{
		       padding-left:8px
		    
		    }
		
		</style>
		
	</head>

	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		

		<div class="mainWrap container-full">

			<div class="homeBr" >
				<div class="container">
					<div class="row">
						<div class="faceWapper col-sm-9 col-xs-12 top20">
							<img class="img-circle" src="${pageContext.request.contextPath}/img/40" alt="头像" width="52" height="52">
							<span class="infoText">
                   				 Hi，<span class="hidden-xs"><span class="nk">${sessionScope.user.userNickName}</span>，</span>你好</span>
						</div>
						<div class="right hidden-xs">
							<a href="${pageContext.request.contextPath}/main/surveyHistory.shtml" class="taskHis">问卷历史</a>
							
						</div>
					</div>
				</div>
			</div>

			<div class="container clearfix">
				<div class="row">
					<div class="main-con-left col-xs-12 col-sm-9">
						<div class="survey panel panel-default" id="surveyHome">
							<div class="panel-heading clearfix">
								<h3 class="pull-left">问卷列表</h3>
								<a class="more pull-right" href="${pageContext.request.contextPath}/main/surveyList.shtml">更多>></a>
							</div>
							<div class="panel-body">
								<ul id="surveyList">
								
			
								</ul>

							</div>
						</div>





						<div class="vote panel panel-default">
							<div class="panel-heading clearfix">
								<h3 class="pull-left">快速问答</h3>
								<a href="${pageContext.request.contextPath}/main/quickResponse.shtml" class="more pull-right">更多>></a>
							</div>

							<div class="panel-body">
								<ul class="top10">


                                </ul>
		                    </div>
		                 </div>
		    </div>




		<div class="main-con-right col-xs-6 col-sm-3 hidden-xs">

			<div id="planbanner">
				<div class="planpicshow">
					
					<a href="#" title="签到领奖券" style="display: inline;"><img class="img-responsive" src="${pageContext.request.contextPath}/img/checkInHomeBr.jpg" alt="weibo"></a>
				</div>
				<div class="planpicnum">
					<ul>
						<li class=""></li>
						<li class=""></li>
						<li class="hover"></li>
					</ul>
				</div>
			</div>


			<div class="notice panel panel-default">
				<div class="panel-heading">
					<h4>最热排行榜</h4>
				</div>
				<div class="panel-body">
					<ul id="top">
						<!-- <li><em></em>
							<a href="#">国庆节各类兑换延后通知</a>
						</li>
						<li><em></em>
							<a href="#">中秋节兑换延迟通知</a>
						</li>
						<li><em></em>
							<a href="#">91问问"问卷积分"上涨公告</a>
						</li>
						<li><em></em>
							<a href="#">关于手机费兑换延迟通知</a>
						</li>
						<li><em></em>
							<a href="#">国庆节各类兑换延后通知</a>
						</li>
						<li><em></em>
							<a href="#">中秋节兑换延迟通知</a>
						</li>
						<li><em></em>
							<a href="#">91问问"问卷积分"上涨公告</a>
						</li>
						<li><em></em>
							<a href="#">关于手机费兑换延迟通知</a>
						</li> -->
						
					</ul>
				</div>

			</div>

		</div>
		</div>
		</div>

		</div>
		

		<jsp:include page="footer.jsp"></jsp:include>
	</body>

</html>