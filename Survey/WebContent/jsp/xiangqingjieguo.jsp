<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>问卷星调查网 - 投票结果</title>








<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aio.css" />
<link href="${pageContext.request.contextPath}/css/voteDetail.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>


<style type="text/css">
		
		   #sp{
		   
		       display: none;
		   }
		
		
</style>




</head>



<body>
	<span id="sp">${questionnaireId}</span>
	
<script type="text/javascript">
	var questionnaireId=$("#sp").html();


$.ajax({
	url:"/Survey/main/voteDetailsResult.shtml"   ,
	type:"post"   ,
	dataType:"json" ,
	data:{
		"questionnaireId":questionnaireId			
	},
	success:function(data){
		var resultHtml = "";
		$(".lead").html(data[0].questionName);
		$("#co").html(data[0].stopTime);
		$("#co1").html(data[0].number);
		
		
		$.each(data,function(index,element){
			/* <div class="row top10">
			<dt class="col-xs-10 col-sm-12 col-md-6" title="一直会穿">一直会穿</dt>
			<dd class="option1 col-xs-12 col-sm-12 col-md-6">
				<span class="result">510票</span> <span class="progress"><p
						style="width: 13.5928%;"></p>
					<input type="hidden" value="13.592750533049%"></span>
			</dd>
		</div> */
			
				
			if(element.type=="6"){
				resultHtml +="<div class='row top10'><dt class='col-xs-10 col-sm-12 col-md-6' >"+element.context1+"</dt>";
				resultHtml +="<dd class='option1 col-xs-12 col-sm-12 col-md-6'><span class='result'>"+element.numberA+"票</span> <span class='progress'>";
				resultHtml +="<p style='width:"+ element.probabyA+"%;'></p>";
				resultHtml +="<input type='hidden' value='"+element.probabyA+"%'></span></dd></div>";
				
				resultHtml +="<div class='row top10'><dt class='col-xs-10 col-sm-12 col-md-6' >"+element.context2+"</dt>";
				resultHtml +="<dd class='option1 col-xs-12 col-sm-12 col-md-6'><span class='result'>"+element.numberB+"票</span> <span class='progress'>";
				resultHtml +="<p style='width:"+ element.probabyB+"%;'></p>";
				resultHtml +="<input type='hidden' value='"+element.probabyB+"%'></span></dd></div>";
				
			}else {
				resultHtml +="<div class='row top10'><dt class='col-xs-10 col-sm-12 col-md-6' >"+element.select1+"</dt>";
				resultHtml +="<dd class='option1 col-xs-12 col-sm-12 col-md-6'><span class='result'>"+element.numberA+"票</span> <span class='progress'>";
				resultHtml +="<p style='width:"+ element.probabyA+"%;'></p>";
				resultHtml +="<input type='hidden' value='"+element.probabyA+"%'></span></dd></div>";
				
				resultHtml +="<div class='row top10'><dt class='col-xs-10 col-sm-12 col-md-6' >"+element.select2+"</dt>";
				resultHtml +="<dd class='option1 col-xs-12 col-sm-12 col-md-6'><span class='result'>"+element.numberB+"票</span> <span class='progress'>";
				resultHtml +="<p style='width:"+ element.probabyB+"%;'></p>";
				resultHtml +="<input type='hidden' value='"+element.probabyB+"%'></span></dd></div>";
				
				resultHtml +="<div class='row top10'><dt class='col-xs-10 col-sm-12 col-md-6' >"+element.select3+"</dt>";
				resultHtml +="<dd class='option1 col-xs-12 col-sm-12 col-md-6'><span class='result'>"+element.numberC+"票</span> <span class='progress'>";
				resultHtml +="<p style='width:"+ element.probabyC+"%;'></p>";
				resultHtml +="<input type='hidden' value='"+element.probabyC+"%'></span></dd></div>";
				
				
				
			}
			
			
		})
		
		$("#body").html(resultHtml);
	}
})





$.ajax({
					url:"/Survey/main/queryNew.shtml"   ,
					type:"post"   ,
					dataType:"json" ,
					data:{
								
					},
					success:function(data){
						
						var resultHtml= "<li></li>";
						$.each(data,function(index,element){
							
							
							resultHtml+="<li>"+element.historyTime+" "+element.userNickName+"完成"+element.questionnaireName +"</li>";
							
						})
						
						$("#news").html(resultHtml);
					}
				})





</script>		
	
	
	
	
	
	
	 <jsp:include page="header.jsp"></jsp:include>
	
	<div class="mainWrap container-full">
		<div class="container">
			<div class="row">
				<div class="col-sm-9 col-xs-12">
					<div class="vote vote-sub voteDet panel panel-default">
						<div class="panel-body">
							<div class="relate row">
								<div class="hidden-xs col-sm-3 top5">
									<!-- <img class="pull-right img-responsive"
										src="./91问问调查网 - 快速问答详情_files/63ed7f74ee5c53b6356fc4e26a3f804f_s.jpg"
										alt="【生活】不能生吃的蔬菜您知道哪些？" width="90"> -->
								</div>
								<div class="relateText col-xs-12 col-sm-9">
									<h3 class="lead"></h3>
									<div class="description well">
										<div class="fst">
											<span class="cor9">截止时间：</span><span id="co"></span>
										</div>
										<div>
											 <span class="cor9">参与人气：</span><span id="co1"></span>
											
										</div>
									</div>
								</div>
							</div>
							<div class="options">
								<div class="row">
									<div class="col-md-3"></div>
									<dl class="col-xs-12 col-sm-12 col-md-9" id="body">
									
									
										<!-- <div class="row top10">
											<dt class="col-xs-10 col-sm-12 col-md-6" title="一直会穿">一直会穿</dt>
											<dd class="option1 col-xs-12 col-sm-12 col-md-6">
												<span class="result">510票</span> <span class="progress"><p
														style="width: 13.5928%;"></p>
													<input type="hidden" value="13.592750533049%"></span>
											</dd>
										</div>
										
										
										<div class="row top10">
											<dt class="col-xs-10 col-sm-12 col-md-6" title="有时候会穿">有时候会穿</dt>
											<dd class="option1 col-xs-12 col-sm-12 col-md-6">
												<span class="result">706票</span> <span class="progress"><p
														style="width: 18.8166%;"></p>
													<input type="hidden" value="18.816631130064%"></span>
											</dd>
										</div>
										
										
										<div class="row top10">
											<dt class="col-xs-10 col-sm-12 col-md-6" title="偶尔忘记脱了">偶尔忘记脱了</dt>
											<dd class="option1 col-xs-12 col-sm-12 col-md-6">
												<span class="result">317票</span> <span class="progress"><p
														style="width: 8.44883%;"></p>
													<input type="hidden" value="8.4488272921109%"></span>
											</dd>
										</div>
										<div class="row top10">
											<dt class="col-xs-10 col-sm-12 col-md-6" title="不会穿">不会穿</dt>
											<dd class="option1 col-xs-12 col-sm-12 col-md-6">
												<span class="result">2133票</span> <span class="progress"><p
														style="width: 56.8497%;"></p>
													<input type="hidden" value="56.849680170576%"></span>
											</dd>
										</div>
										
										<div class="row top10">
											<dt class="col-xs-10 col-sm-12 col-md-6" title="其他">其他</dt>
											<dd class="option1 col-xs-12 col-sm-12 col-md-6">
												<span class="result">86票</span> <span class="progress"><p
														style="width: 2.29211%;"></p>
													<input type="hidden" value="2.2921108742004%"></span>
											</dd>
										</div> -->
										
										
									
									</dl>
								</div>
							</div>
							<div class="row">
								<ul class="pager">
									<li class="next"><a
										href="${pageContext.request.contextPath}/main/quickResponse.shtml">返回快速问答一览&gt;&gt;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				
				<div class="col-sm-3 hidden-xs">
					<div class="row">
						<div class="clearfix col-xs-12">
							<a href="#"><img
								class="img-responsive" src="${pageContext.request.contextPath}/img/prize.jpg" alt="有奖出题"></a>
						</div>
					</div>
					<div class="exchange-dynamics panel panel-default hidden-xs top20">
						<div class="panel-heading">
							<h4>最新动态</h4>
						</div>
						<div class="panel-body">
							<div class="mask">
								<ul style="top: -39.4177px;" id="news">


								<!-- 	<li>2016-12-18 wox**商业问卷获得100积分</li>
									<li>2016-12-18 TOM**商业问卷获得400积分</li>
									<li>2016-12-18 住在长**商业问卷获得300积分</li>
									<li>2016-12-18 xia**商业问卷获得400积分</li>
									<li>2016-12-18 核桃木**抽奖获得100积分</li>
									<li>2016-12-18 410**商业问卷获得500积分</li>
									<li>2016-12-18 赤/x**获得100积分</li>
									<li>2016-12-18 gss**商业问卷获得100积分</li>
									<li>2016-12-18 赤/x**获得100积分</li>
									<li>2016-12-18 匿名2**商业问卷获得400积分</li>
									<li>2016-12-18 lid**商业问卷获得300积分</li>
									<li>2016-12-18 赤/x**获得100积分</li>
									<li>2016-12-18 风云变**商业问卷获得400积分</li>
									<li>2016-12-18 山中人**抽奖获得100积分</li> -->
								
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