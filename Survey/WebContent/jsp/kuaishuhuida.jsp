<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html lang="zh-CN">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>问卷星调查网 - 快速问答</title>
		 <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
		<link href="${pageContext.request.contextPath}/css/vote.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		<script>

			$("document").ready(function(){
				$("#sy").attr("class","nav-link ");
				$("#wj").attr("class","nav-link ");
				$("#ks").attr("class","nav-link active");
				$("#gl").attr("class","nav-link ");
				
				
				
				
				$.ajax({
					url:"/Survey/main/initFour.shtml"   ,
					type:"post"   ,
					dataType:"json" ,
					data:{
						"pageNo":"1"			
					},
					success:function(data){
						
						var resultHtml= "";
						$.each(data.pageDate,function(index,element){
						
							if(element.questionnaireStatus=="发布中"){
								element.questionnaireStatus="去投票";
							}else{
								
								element.questionnaireStatus="去看看";
							}
							
						
							resultHtml+="<li><div class='row'><span class='vote-txt col-xs-5 col-sm-5 col-md-6'>";
							resultHtml+="<div class='title'><a href='#' class='ziti'>"+element.questionnaireName+"<span></span></a></div>";
							resultHtml+="<div class='relate top15 hidden-xs hidden-sm'>";
							resultHtml+="<div>参与人气：<span>"+element.completeStatus+"</span></div><div>截止日期："+element.stopTime+"</div></div></span>";
							resultHtml+="<div class='vote-info col-xs-7 col-sm-7 col-md-4 pull-right text-right'><div class='voteBW'><a href='/Survey/main/voteDetails.shtml?questionnaireId="+element.questionnaireId+"' class='vote-btn btn' type='button'>"+element.questionnaireStatus+"</a></div></div></div></li><hr>";
							
							
							
						})
						
						$(".top10").html(resultHtml);
						pageInfo(data.pageNo,data.pageCount);
						queryNew()
					}
				})
				
				
				
				
				
	
				
				
			})	
			
			
			
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
	 			url:"/Survey/main/initFour.shtml"   ,
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
					element.questionnaireStatus="去投票";
				}else{
					
					element.questionnaireStatus="去看看";
				}
				
				resultHtml+="<li><div class='row'><span class='vote-txt col-xs-5 col-sm-5 col-md-6'>";
				resultHtml+="<div class='title'><a href='#' class='ziti'>"+element.questionnaireName+"<span></span></a></div>";
				resultHtml+="<div class='relate top15 hidden-xs hidden-sm'>";
				resultHtml+="<div>参与人气：<span>"+element.completeStatus+"</span></div><div>截止日期："+element.stopTime+"</div></div></span>";
				resultHtml+="<div class='vote-info col-xs-7 col-sm-7 col-md-4 pull-right text-right'><div class='voteBW'><a href='/Survey/main/voteDetails.shtml?questionnaireId="+element.questionnaireId+"' class='vote-btn btn' type='button'>"+element.questionnaireStatus+"</a></div></div></div></li><hr>";
				
				
				
				
			});
		    $(".top10").html(resultHtml);
			pageInfo(data.pageNo,data.pageCount);
			queryNew();
	
	  }
 
	  
	  
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
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
			<div class="container">
				<div class="row">
					<div class="col-sm-9 col-xs-12">
						<div class="vote panel panel-default">
							<div class="panel-heading hidden-xs">
								<h3>快速问答</h3></div>
							<div class="panel-body top15">
								<ul class="top10">
								
								
								
									
								</ul>
								
								
								
								<div style="width: 500px; float:right;" id="footer"></div>
								<!-- <div class="page-wrapper">
								
									<p class="page">

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
					
					
					
					<div class="col-sm-3 hidden-xs">
						<div class="row">
							<div class="clearfix col-xs-12">
								<a href="#"><img class="img-responsive" src="${pageContext.request.contextPath}/img/prize.jpg" alt="有奖出题"></a>
							</div>
						</div>
						<div class="exchange-dynamics panel panel-default hidden-xs top20">
							<div class="panel-heading">
								<h4>最新动态</h4>
							</div>
							<div class="panel-body">
								<div class="mask">
									<ul style="top: 0px;" id="news">

									<!-- 	<li>2016-12-18 cao**商业问卷获得300积分</li>
										<li>2016-12-18 wtm**商业问卷获得400积分</li>
										<li>2016-12-18 微澜浣**商业问卷获得400积分</li>
										<li>2016-12-18 sam**商业问卷获得100积分</li>
										<li>2016-12-18 vf**商业问卷获得400积分</li>
										<li>2016-12-18 wtm**商业问卷获得500积分</li>
										<li>2016-12-18 wde**抽奖获得100积分</li>
										<li>2016-12-18 wox**商业问卷获得100积分</li>
										<li>2016-12-18 TOM**商业问卷获得400积分</li>
										<li>2016-12-18 TOM**商业问卷获得400积分</li> -->
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