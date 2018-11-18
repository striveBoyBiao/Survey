//创建问卷
function previewSurvey(){
	
	    var surveyTitle=document.getElementById("surveyTitle").innerHTML;
	    var questions=document.getElementsByClassName("topic-type-content topic-type-question after-clear");
	    var type=$(".question-title");
	    var name=document.getElementsByClassName("qs-content edit-area edit-title");
	    var select=document.getElementsByTagName("select");
	    var danxuan=document.getElementsByClassName("edit-area edit-child-element");
	    var k=0;
	    var m=0
	    var allQuestion=new Array();
	     
	    
	    
	    
	    if(questions.length>0){
	    	
	    	for(var i=0;i<questions.length;i++){
	    		if(type.eq(i).attr("type")==6){
	    			var questionName6=name[i].innerHTML;
	    			var context1=danxuan[k].innerHTML;
	    			var context2=danxuan[k+1].innerHTML;
	    			k=k+2;
	    			var question=new Object();
	    			question.questionName=questionName6;
	    			question.context1=context1;
	    			question.context2=context2;
	    			question.type=6;
	    			allQuestion[i]=question;
	    			
	    		};
	    		if(type.eq(i).attr("type")==7){
	    			var questionName7=name[i].innerHTML;
	    			var select1=select[m].options[0].text;
	    			var select2=select[m].options[1].text;
	    			var select3=select[m].options[2].text;
	    			m++;
	    			var question=new Object();
	    			question.questionName=questionName7;
	    			question.select1=select1;
	    			question.select2=select2;
	    			question.select3=select3;
	    			question.type=7;
	    			allQuestion[i]=question;
	    		}
	    	}
	    	
	    	
	    	
	    	
	    	$.ajax({
				url:"/Survey/console/saveQuestion.shtml"   ,
				type:"post"   ,
				dataType:"json" ,
				async: false ,
				data:{
					"allQuestion":JSON.stringify(allQuestion),
					surveyTitle:surveyTitle
					
				}
			})
	    	
	    	location.href="/Survey/console/kongzhitai.shtml";
	    	
	    	
	    }else{
	    	$(".error-tips").html("请创建题目");
	    }
	    
}


function change(){
	
	 $(".error-tips").html("");
}



























