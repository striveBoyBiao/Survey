<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="zh-CN">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>91问问调查网 - 任务历史</title>
		<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
		<link href="${pageContext.request.contextPath}/css/point.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		
		<script type="text/javascript">
		$.ajax({
			url:"/Survey/main/getHistory.shtml"   ,
			type:"post"   ,
			dataType:"json" ,
			data:{
							
			},
			success:function(data){
				var resultHtml = "";
				
			
			$.each(data,function(index,element){
				
				resultHtml+="<tr>";
				resultHtml+="<td>"+element.questionnaireName+"</td>";
				resultHtml+="<td></td>";
				resultHtml+="<td>"+element.historyTime+"</td></tr>";
			})
				
				$("#body").html(resultHtml);
			}	
			
			
		});
		
		
		
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
										
										<li class="active">
											<a href="${pageContext.request.contextPath}/main/surveyHistory.shtml"><i class="fa fa-clock-o" aria-hidden="true"></i>问卷历史</a>
										</li>
										
										<li class="">
											<a href="${pageContext.request.contextPath}/main/accountSet.shtml"><i class="fa fa-cog" aria-hidden="true"></i>账户设置</a>
										</li>
									</div>
								</ul>
							</div>
							
							
							<div class="main-personal-right rp-main-personal-right panel">
								<div class="main-personal-points table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th class="title">问卷名称</th>
												<th></th>
												<th>问卷时间</th>
											</tr>
										</thead>
										<tbody id="body">
											<!-- <tr>
												<td>1021 旅游的问卷调查</td>
												<td></td>
												<td>2016-12-18 22:13</td>
											</tr>
											<tr>
												<td>快速问答</td>
												<td></td>
												<td>2016-12-18 21:56</td>
											</tr>
											<tr>
												<td>同意参与海外市场调查项目</td>
												<td></td>
												<td>2016-12-18 21:31</td>
											</tr>
											<tr>
												<td>q001 属性问卷</td>
												<td></td>
												<td>2016-12-18 21:29</td>
											</tr>
											<tr>
												<td>q002 属性问卷</td>
												<td></td>
												<td>2016-12-18 21:29</td>
											</tr>
											<tr>
												<td>q004 属性问卷</td>
												<td></td>
												<td>2016-12-18 21:29</td>
											</tr>
											<tr>
												<td>完成注册</td>
												<td></td>
												<td>2016-12-18 21:29</td>
											</tr> -->
										</tbody>
									</table>
									<div class="text-center">

									</div>
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