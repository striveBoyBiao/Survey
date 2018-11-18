<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="zh-CN">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>问卷星调查网 - 问卷调查</title>
  		<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
		<link href="${pageContext.request.contextPath}/css/survey.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script>

			$("document").ready(function(){
				$("#sy").attr("class","nav-link ");
				$("#wj").attr("class","nav-link active");
				$("#ks").attr("class","nav-link ");
				$("#gl").attr("class","nav-link ");
				
				
				
				
				
				
				$.ajax({
					url:"/Survey/main/initThree.shtml"   ,
					type:"post"   ,
					dataType:"json" ,
					data:{
						"pageNo":"1"		
					},
					success:function(data){
						var resultHtml = "";
						
						
						$.each(data.pageDate,function(index,element){
							
							
							if(element.questionnaireStatus=="发布中"){
								element.questionnaireStatus="可参与";
							}else{
								element.questionnaireStatus="已截止";
							}
							
							
							resultHtml+="<li><div class='row'><div class='survey-item col-xs-5 col-sm-6 col-md-8'>";
							resultHtml+="<div class='title'><a href='#'>"+element.questionnaireName+"<span></span></a></div>";
							resultHtml+="<ul class='con clearfix'><li class='last'><div class='relate top15 hidden-xs hidden-sm'><div>参与人气：<span>"+element.completeStatus+"</span></div> </div></li></ul></div>";
							resultHtml+="<div class='survey-info col-xs-7 col-sm-6 col-md-4 pull-right'><div class='survey-btn proBtn'><a href='/Survey/main/doQuestion.shtml?questionnaireId="+element.questionnaireId+"' >"+element.questionnaireStatus+"</a></div></div></div></li><hr>";
							
							
						})
						
						$("#surveyList").html(resultHtml);
						pageInfo(data.pageNo,data.pageCount);
					}
				})
				
				
				
				
				
				
			})	
			
			
			
			
			
			
			
			  //动态创建 分页 
	   function pageInfo(pageNo,pageCount){
		   pageNo = parseInt(pageNo,"10");
	 		var result="";
	 		result+="<nav>";
	 		result+="<ul class='pagination'>";
	 		if(pageNo==1){
	 			result+="<li class='disabled'><a href='#'>&laquo;</a></li>";
	 		}else{
	 			result+="<li><a href='#' onclick=\"shangyiye("+(pageNo-1)+")\""+" >上一页</a></li>";
	 		}
	 		var begin=0;
	 		var end=0;
	 		if(pageCount<=5){
	 			begin=1;
	 			end=pageCount;
	 		}else{
	 			begin=pageNo-2;
	 			end=pageNo+3;
	 			if(begin<1){
	 				begin=1;
	 	 			end=5;
	 			}
	 			if(end>pageCount){
	 				begin=pageCount-4;
	 	 			end=pageCount;
	 			}
	 			
	 		}
	 		
	 			
			//<!--显示中间页数  -->
	 		for(var i=begin;i<=end;i++){
	 			if(i==pageNo){
	 				result+="<li class='active'><a href='#' onclick=\"zhongjianye("+i+")\""+" >"+i+"</a></li>";
	 		}else{
	 				result+="<li><a href='#' onclick=\"zhongjianye("+i+")\""+" >"+i+"</a></li>";
	 			}
	 		}
	 			
	 		
			if(end< pageCount){
	 			result+="<li><a href='#'>....</a></li>";
	 		}
	 		//<!--禁止  -->
	 		if(pageNo==pageCount){
	 			result+="<li class='disabled'><a href='#'>&raquo;</a></li>";
	 		}
	 		//<!--下一页  -->
			if(pageNo!=pageCount){
				result+="<li><a href='#' onclick=\"xiayiye("+(pageNo+1)+")\""+">下一页</a></li>";
			}

			result+="</ul></nav>";
			$("#footer").html(result);
	 			
	 	 
	    }
	  
	
	
	   
	   
	   
	   
	   
	 //上一页 
	   function shangyiye(pageNo){
	 		
	 	  gongzong(pageNo);
	 }

	 	//下一页 
	 function xiayiye(pageNo){
	 	
	 	 gongzong(pageNo);
	 }
	 	
	 //中间数字 
	 function zhongjianye(pageNo){
	 	  gongzong(pageNo);
	 }    
	   
	   //公共代码 
	  function gongzong(pageNo){
	 	 $.ajax({
	 			url:"/Survey/main/initThree.shtml"   ,
	 			type:"post",
	 			data:{
	 				
	 				"pageNo":pageNo
	 				
	 			},
	 			datatype:"json",
	 			success:function(data){
	 				var resultHtml = ""; 	
	 	  			if(data){
	 	  				
	 	  				update2(resultHtml,data);
	 	 			}	
	 			}
	 	});
	  }
	   
	  
	  
	  
	  
	  /*获取json数据    */
	  function update2(resultHtml,data){
		  
		 
		 
		  $.each(data.pageDate,function(index,element){
			
			
			  if(element.questionnaireStatus=="发布中"){
					element.questionnaireStatus="可参与";
				}else{
					element.questionnaireStatus="已截止";
				}
				
				
				resultHtml+="<li><div class='row'><div class='survey-item col-xs-5 col-sm-6 col-md-8'>";
				resultHtml+="<div class='title'><a href='#'>"+element.questionnaireName+"<span></span></a></div>";
				resultHtml+="<ul class='con clearfix'><li class='last'><div class='relate top15 hidden-xs hidden-sm'><div>参与人气：<span>"+element.completeStatus+"</span></div> </div></li></ul></div>";
				resultHtml+="<div class='survey-info col-xs-7 col-sm-6 col-md-4 pull-right'><div class='survey-btn proBtn'><a href='/Survey/main/doQuestion.shtml?questionnaireId="+element.questionnaireId+"' >"+element.questionnaireStatus+"</a></div></div></div></li><hr>";
				
				
				
				
			});
			$("#surveyList").html(resultHtml);
			pageInfo(data.pageNo,data.pageCount);
	
	  }
 
			
			
			
			
			
			
			
			
			
		</script>
	</head>

	<body>

		<jsp:include page="header.jsp"></jsp:include>



		<div class="mainWrap container-full">
			<div class="container">
				<div class="survey panel panel-default">
					<div class="panel-heading hidden-xs">
						<h3>问卷列表</h3></div>
						
						
					<div class="panel-body">
						<ul id="surveyList">
						
						
							
						</ul>
						
						
						 <div style="width: 570px; float:right;" id="footer"></div>
					<!-- 	<div class="page-wrapper">
						
								
									<p class="page">
                                             <div style="width: 450px; float:right;" id="footer"></div>
										<span class="active"><a href="#">1</a></span>

										<span><a href="#">2</a></span>

										<span><a href="#">3</a></span>

										<span><a href="#">4</a></span>

										<span><a href="#">尾页</a></span>
									</p> 
						</div> -->
						
						
					</div>
				</div>
			</div>

		</div>
		
		
		
		<jsp:include page="footer.jsp"></jsp:include>
		
		
	

	</body>

</html>