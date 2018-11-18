<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">






<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>问卷星</title>
		<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
		<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aio.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		
		<script type="text/javascript">
		$("document").ready(function(){
			
			$(".tpl-button").click(function(){
				var title=$(".create-survey-name").val();
				var length=title.length;
	            if(title==""){
	            	$(".error-tip").html("*问卷名不能为空");
	            	$(".error-tip").css("color","red");
	            }else if(length>17){
	            	$(".error-tip").html("*问卷名过长");
	            	$(".error-tip").css("color","red");
	            }else{
	            	location.href="${pageContext.request.contextPath}/console/designSurvey.shtml?title="+title;
	            }
				
			});
			
			$(".create-survey-name").click(function(){
				
				$(".error-tip").html("");
			});
				
			
			
			
		})
		
		
		</script>
		
		
		
	</head>

	<body>
	
		<jsp:include page="header.jsp"></jsp:include>
		<div id="page">
			
			<div id="content-wrapper">
				
				<div id="bce-main">
					<div class="main" style="position: relative">
						<div ng-app="surveyTemplate" class="content common-task-content ng-scope">
							<p class="bce-breadcrumb">
								<a href="#"><span>问卷调研</span></a>
								<span class="divider">/</span>
								<span class="active">创建问卷</span>
							</p>
							<div class="survey-template-wrap">
								<div class="survey-template-nav">
									<!-- <a style="color: #333;" href="#" id="use_tpl" class="">引用模板问卷</a> -->
									<a style="color: #333;" href="#" id="create_survey" class="survey-active">创建空白问卷</a>
								</div>
								<!-- ngView:  -->
								<div ng-view="" class="ng-scope">
									<div class="survey-create ng-scope">
										<div class="survey-create-title">问卷标题</div>
										<div class="survey-create-content">
											<input class="create-survey-name" value="" placeholder="标题最多输入17个字">
											<p class="error-tip"></p>
										</div>
										<div class="survey-create-button">
											<input type="button" class="tpl-button" id="survey-confirm-y" value="创建问卷" ng-click="createSurvey()">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			
			<div id="footer1">
				<div class="container1">
			
					<jsp:include page="footer.jsp"></jsp:include>
				</div>
			</div>
			
	</div>
			
			
			
			
			
		
	</body>

</html>