<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">







<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>问卷星调查网 - 快速问答详情</title>





<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aio.css" />
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/vote2.css" rel="stylesheet">
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
	url:"/Survey/main/doQuestion2.shtml"   ,
	type:"post"   ,
	dataType:"json" ,
	data:{
		"questionnaireId":questionnaireId			
	},
	success:function(data){
		var resultHtml = "";
		var result="";
		$(".lead").html(data[0].questionName);
		$("#co").html(data[0].stopTime);
		$("#co1").html(data[0].number);
		
		
		$.each(data,function(index,element){
			
			
				
			if(element.type=="6"){
				resultHtml+="<li class='list-group-item'><input type='radio' name='answer_number' id='answer_number_1' value='1'>";
				resultHtml+="<label for='answer_number_1'>1."+element.context1+"</label></li>";
				resultHtml+="<li class='list-group-item'><input type='radio' name='answer_number' id='answer_number_2' value='2'>";
				resultHtml+="<label for='answer_number_2'>2."+element.context2+"</label></li>";
			}else {
				resultHtml+="<li class='list-group-item'><input type='radio' name='answer_number' id='answer_number_1' value='1'>";
				resultHtml+="<label for='answer_number_1'>1."+element.select1+"</label></li>";
				resultHtml+="<li class='list-group-item'><input type='radio' name='answer_number' id='answer_number_2' value='2'>";
				resultHtml+="<label for='answer_number_2'>2."+element.select2+"</label></li>";
				resultHtml+="<li class='list-group-item'><input type='radio' name='answer_number' id='answer_number_3' value='3'>";
				resultHtml+="<label for='answer_number_3'>3."+element.select3+"</label></li>";
				
			}
			
			
		})
		
		
		
	
	   
		$(".list-group").html(resultHtml);
		
	
		
		result+="<li class='previous'><a href='${pageContext.request.contextPath}/main/quickResponse.shtml'>返回快速问答一览&gt;&gt;</a></li>";
		result+="<li class='next'><a class='result'  href='${pageContext.request.contextPath}/main/voteResult.shtml?questionnaireId="+questionnaireId+"'>仅查看结果&gt;&gt;</a></li>";
		
		$(".pager").html(result);
		queryNew();
	}
})



function tijiao(){
	 var questionnaireId=$("#sp").html();
	 var val=$('input:radio[name="answer_number"]:checked').val();
	 var allQuestion=new Array();
	 if(val==null){
	 }else{
		 if(val=="1"){
			 allQuestion[0]="A"; 
		 }else if(val=="2"){
			 allQuestion[0]="B"; 
		 }else{
			 allQuestion[0]="C"; 
		 }
		 $.ajax({
				url:"/Survey/main/saveResult.shtml"   ,
				type:"post"   ,
				dataType:"json" ,
				data:{
					"allQuestion":JSON.stringify(allQuestion),
					"questionnaireId":questionnaireId
				}
			})
	 	location.href="/Survey/main/main.shtml";
	}
}
	 
	










function queryNew(){
	
	$.ajax({
		url:"/Survey/main/queryNew.shtml"   ,
		type:"post"   ,
		dataType:"json" ,
		data:{
					
		},
		success:function(data){
			
			var resultHtml= "";
			$.each(data,function(index,element){
				
				
				resultHtml+="<li>"+element.historyTime+" "+element.userNickName+"完成"+element.questionnaireName +"</li>";
				
			})
			
			$("#news").html(resultHtml);
		}
	})
	
	
}	



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
							<form action="#" method="post"
								name="form1" id="show_form">
								<input type="hidden"
									value="ccc1b91b3dc4ba590d6140cf5cf9cfbae09fad7d"
									name="csrf_token"> <input type="hidden" value="3393"
									name="id">
								<div class="row">
									<div class="col-md-3"></div>
									<div class="col-xs-12 col-sm-12 col-md-9">
										<div class="options">
											<ul class="list-group">
											
												<!-- <li class="list-group-item"><input type="radio"
													name="answer_number" id="answer_number_1" value="1">
													<label for="answer_number_1">1.豆类蔬菜</label></li>
												<li class="list-group-item"><input type="radio"
													name="answer_number" id="answer_number_2" value="2">
													<label for="answer_number_2">2.薯类</label></li>
												<li class="list-group-item"><input type="radio"
													name="answer_number" id="answer_number_3" value="3">
													<label for="answer_number_3">3.富含硝酸盐的蔬菜如菠菜，芥菜</label></li>
												<li class="list-group-item"><input type="radio"
													name="answer_number" id="answer_number_4" value="4">
													<label for="answer_number_4">4.含草酸较多的蔬菜如竹笋，茭白</label></li>
												<li class="list-group-item"><input type="radio"
													name="answer_number" id="answer_number_5" value="5">
													<label for="answer_number_5">5.黄花菜</label></li>
												<li class="list-group-item"><input type="radio"
													name="answer_number" id="answer_number_6" value="6">
													<label for="answer_number_6">6.荸荞</label></li>
												<li class="list-group-item"><input type="radio"
													name="answer_number" id="answer_number_7" value="7">
													<label for="answer_number_7">7.淀粉类蔬菜如土豆，芋头，山药</label></li>
												<li class="list-group-item"><input type="radio"
													name="answer_number" id="answer_number_8" value="8">
													<label for="answer_number_8">8.木耳</label></li>
												<li class="list-group-item"><input type="radio"
													name="answer_number" id="answer_number_9" value="9">
													<label for="answer_number_9">9.塌地生长的绿叶菜</label></li>
												<li class="list-group-item"><input type="radio"
													name="answer_number" id="answer_number_10" value="10">
													<label for="answer_number_10">10.其他</label></li> -->
													
													
											</ul>
											<div class="btn">
												<input type="button" value="投  票" class="submit" onclick="tijiao()">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<ul class="pager">
										<%-- <li class="previous"><a
											href="${pageContext.request.contextPath}/main/quickResponse.shtml">返回快速问答一览&gt;&gt;</a></li>
										<li class="next"><a
											href="${pageContext.request.contextPath}/main/voteResult.shtml?questionnaireId="+${questionnaireId}
											class="result">仅查看结果&gt;&gt;</a></li> --%>
									</ul>
								</div>
							</form>
						</div>
					</div>
				</div>




				<div class="col-sm-3 hidden-xs">
					<div class="row">
						<div class="clearfix col-xs-12">
							<a href="#"><img
								class="img-responsive" src="${pageContext.request.contextPath}/img/prize.jpg"
								alt="有奖出题"></a>
						</div>
					</div>
					<div class="exchange-dynamics panel panel-default hidden-xs top20">
						<div class="panel-heading">
							<h4>最新动态</h4>
						</div>
						<div class="panel-body">
							<div class="mask">
								<ul style="top: 0px;" id="news">


									<!-- <li>2017-03-26 jer**获得100积分</li>
									<li>2017-03-26 钞级夢**获得100积分</li>
									<li>2017-03-26 mik**商业问卷获得400积分</li>
									<li>2017-03-26 木笙流**获得100积分</li>
									<li>2017-03-26 木得**获得100积分</li>
									<li>2017-03-26 飘渺晨**获得100积分</li>
									<li>2017-03-26 水滴**获得100积分</li>
									<li>2017-03-26 vic**获得100积分</li>
									<li>2017-03-26 哈根达**获得100积分</li>
									<li>2017-03-26 pay**获得100积分</li>
									<li>2017-03-26 男人。**获得100积分</li> -->




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