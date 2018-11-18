<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>问卷星调查网 - 回答完成</title>







        <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
		<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aio.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/questionnaire.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>


</head>
<body>
	
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="mainWrap container-full">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-10 col-sm-offset-1">
					<div class="main-con">
						<div class="qnWrap">
							<div class="qnCon qnEnd">
								<div class="qnEndTxt">
									<div class="txt">
										<img src="${pageContext.request.contextPath}/img/sadface.png">
										<p>该调查问卷已经结束</p>
										<p>去看看别的问卷。</p>
									</div>
								</div>
								<a class="backBtn" href="${pageContext.request.contextPath}/main/main.shtml">返回首页</a>
							</div>
							<div class="bottom">
								<br>
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