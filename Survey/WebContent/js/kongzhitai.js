$("document").ready(function(){
	$.ajax({
		url:"/Survey/console/kongzhitai1.shtml" ,
		type:"post",
		dataType:"json" ,
		data:{
		    "pageNo":"1"
		},
		success:function(data){
			
			var resultHtml = "";
			resultHtml+="<tr class='survey-manage-table-head' style='font-size: 14px;height: 50px;text-align: left'>";
			resultHtml+="<th style='width: 25%'>问卷名称/问卷ID</th>";
			resultHtml+="<th style='width: 10%'>发布方式</th>";
			resultHtml+="<th style='width: 15%'>创建时间</th>";
			resultHtml+="<th style='width: 12%'>完成情况</th>";
			resultHtml+="<th style='width: 17%'>问卷状态</th>";
			resultHtml+="<th id='list-header-operate'>操作</th></tr>";
			
			
			$.each(data.pageDate,function(index,element){
				
				resultHtml+="<tr class='survey-manage-table-row ng-scope'>";
				resultHtml+="<td title=\""+element.questionnaireName+"\">";
				resultHtml+="<a  href='#' style='color:#0886e9' class='ng-binding'>"+element.questionnaireName+ "/"+ element.questionnaireId+"</a></td>";
				resultHtml+="<td  class='ng-binding'>无偿收集</td>";
				resultHtml+="<td  class='ng-binding'>"+element.createTime+"</td>";
				resultHtml+="<td><span  class='ng-binding'>"+element.completeStatus+"</span>/<span  class='ng-binding'>50</span></td>";
				resultHtml+="<td  class='ng-binding survey-status-warning'>"+element.questionnaireStatus+"</td>";
				resultHtml+="<td  class='survey-operation'>";
				resultHtml+="<a href='/Survey/console/topicResult.shtml?questionnaireId="+element.questionnaireId+"&questionnaireType="+element.questionnaireType+"'>查看&nbsp;</a>";
				//resultHtml+="<a href='#'>删除&nbsp;</a></td>";
				resultHtml+="</tr>";
				
			})
			
			
			$("#body").html(resultHtml);
			pageInfo(data.pageNo,data.pageCount);
		}
		
		
	})
	
	
	$(".ng-hide").css("display","none");
	
	
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
	 			result+="<li><a href='#' onclick=\"shangyiye("+(pageNo-1)+")\""+" ><<</a></li>";
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
				result+="<li><a href='#' onclick=\"xiayiye("+(pageNo+1)+")\""+">>></a></li>";
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
	 			url:"/Survey/console/kongzhitai2.shtml" ,
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
		  
		    resultHtml+="<tr class='survey-manage-table-head' style='font-size: 14px;height: 50px;text-align: left'>";
			resultHtml+="<th style='width: 25%'>问卷名称/问卷ID</th>";
			resultHtml+="<th style='width: 10%'>发布方式</th>";
			resultHtml+="<th style='width: 15%'>创建时间</th>";
			resultHtml+="<th style='width: 12%'>完成情况</th>";
			resultHtml+="<th style='width: 17%'>问卷状态</th>";
			resultHtml+="<th id='list-header-operate'>操作</th></tr>";
		 
		  $.each(data.pageDate,function(index,element){
			
			
			    resultHtml+="<tr class='survey-manage-table-row ng-scope'>";
				resultHtml+="<td title=\""+element.questionnaireName+"\">";
				resultHtml+="<a  href='#' style='color:#0886e9' class='ng-binding'>"+element.questionnaireName+ "/"+ element.questionnaireId+"</a></td>";
				resultHtml+="<td  class='ng-binding'>无偿收集</td>";
				resultHtml+="<td  class='ng-binding'>"+element.createTime+"</td>";
				resultHtml+="<td><span  class='ng-binding'>"+element.completeStatus+"</span>/<span  class='ng-binding'>50</span></td>";
				resultHtml+="<td  class='ng-binding survey-status-warning'>"+element.questionnaireStatus+"</td>";
				resultHtml+="<td  class='survey-operation'>";
				resultHtml+="<a href='/Survey/console/topicResult.shtml?questionnaireId="+element.questionnaireId+"&questionnaireType="+element.questionnaireType+"'>查看&nbsp;</a>";
				//resultHtml+="<a href='#'>删除&nbsp;</a></td>";
				resultHtml+="</tr>";
				
				
				
			});
		    $("#body").html(resultHtml);
			pageInfo(data.pageNo,data.pageCount);
	
	  }
 
	  
	  
	  
	  /*模糊查询   */
	  function mohuSearch(){
		
		var state=$("#bind").html();
	  	var mh=document.getElementById("mh").value;
	  	
	  	$.ajax({
	  		url:"/Survey/console/kongzhitai3.shtml" ,
	  		type:"post",
	  		data:{
	  			"state":state,
	  			"mohu":mh
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
	   
	  

















function change(){
	
	$(".ng-hide").css("display","");
	
}

function change1(){
	$("#bind").html("全部状态");
	$(".ng-hide").css("display","none");
	
}
function change2(){
	$("#bind").html("发布中");
	$(".ng-hide").css("display","none");
	
}
function change3(){
	$("#bind").html("已完成");
	$(".ng-hide").css("display","none");
	
}












