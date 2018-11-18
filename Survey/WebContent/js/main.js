$("document").ready(function(){
	

	
	$.ajax({
		url:"/Survey/main/initOne.shtml"   ,
		type:"post"   ,
		dataType:"json" ,
		data:{
						
		},
		success:function(data){
			var resultHtml = "";
			
			
			$.each(data,function(index,element){
				
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
		}
	})
	
	

	
	
	
	
	
	$.ajax({
		url:"/Survey/main/initTwo.shtml"   ,
		type:"post"   ,
		dataType:"json" ,
		data:{
						
		},
		success:function(data){
			
			var resultHtml2= "";
			$.each(data,function(index,element){
				
				if(element.questionnaireStatus=="发布中"){
					element.questionnaireStatus="可参与";
				}else{
					element.questionnaireStatus="去看看";
				}
				
				
				
				resultHtml2+="<li><div class='row'><span class='vote-txt col-xs-5 col-sm-5 col-md-6'>";
				resultHtml2+="<div class='title'><a href='#' class='ziti'>"+element.questionnaireName+"<span></span></a></div>";
				resultHtml2+="<div class='relate top15 hidden-xs hidden-sm'>";
				resultHtml2+="<div>参与人气：<span>"+element.completeStatus+"</span></div><div>截止日期："+element.stopTime+"</div></div></span>";
				resultHtml2+="<div class='vote-info col-xs-7 col-sm-7 col-md-4 pull-right text-right'><div class='voteBW'><a href='/Survey/main/voteDetails.shtml?questionnaireId="+element.questionnaireId+"' class='vote-btn btn' type='button'>"+element.questionnaireStatus+"</a></div></div></div></li><hr>";
				
				
				
			})
			
			$(".top10").html(resultHtml2);
		}
	})
	
	
	
	
	
	$.ajax({
		url:"/Survey/main/queryTop.shtml"   ,
		type:"post"   ,
		dataType:"json" ,
		data:{
						
		},
		success:function(data){
			
			var resultHtml2= "";
			$.each(data,function(index,element){
				
			
				
				
				
				resultHtml2+="<li><em></em><a href='#'>"+element.questionnaireName+"</a></li>";
				
				
				
			})
			
			$("#top").html(resultHtml2);
		}
	})
	
	
	
	
	
	
	
	
	
	
	
	
})


