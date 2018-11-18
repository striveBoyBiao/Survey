<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">





<html class="expanded">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		

	
		<title>问卷星-问卷列表</title>
		
		

		<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
		<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/timuyulan.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aio.css" />
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
				var indexs;
				
				
				
				$.each(data,function(index,element){
					indexs=index+1;
					
					if(element.type=="6"){
						
						resultHtml+="<div class='survey-question ng-scope' id='survey-question-1-1' >";
						resultHtml+="<div class='survey-question-title' >";
						resultHtml+="<div class='survey-show-as-html ng-binding ng-scope'>"+indexs+"."+ element.questionName +"<input onclick='change()' type='text' name='xz' style='width:20px; height:20px;'> </div>";
						resultHtml+="<span class='must-do ng-binding'></span></div><div class='must-do ng'></div>";
						resultHtml+="<div class='survey-question-content ng-scope' >";
						resultHtml+="<div class='survey-question-radio ng-scope'>";
						resultHtml+="<div class='survey-question-radio-choice ng-scope' ><div class='radio-image'></div>";
						resultHtml+="<label class='survey-show-as-html ng-binding'>"+"A."+element.context1+"</label></div>";
						resultHtml+="<div class='survey-question-radio-choice ng-scope' ><div   class='radio-image'></div>";
						resultHtml+="<label class='survey-show-as-html ng-binding'>"+"B."+element.context2+"</label></div></div></div></div>";
						
						
					}else {
						
					
						
						resultHtml+="<div class='survey-question ng-scope' id='survey-question-1-2'><div class='survey-question-title' >";
						resultHtml+="<div class='survey-show-as-html ng-binding ng-scope' >"+indexs+"."+element.questionName+"</div>";
						resultHtml+="<span class='must-do ng-binding' ></span></div><div class='must-do ng-hide' ></div>";
						resultHtml+="<div class='survey-question-content ng-scope'><div class='survey-question-select ng-scope' >";
						resultHtml+="<select name='se' style='width: 200px'  class='ng-pristine ng-untouched ng-valid' onclick='change()'>";
						resultHtml+="<option selected='selected'  ></option>";
						resultHtml+="<option value='object:37' >"+"A."+element.select1+"</option>";
						resultHtml+="<option value='object:38' >"+"B."+element.select2+"</option>";
						resultHtml+="<option value='object:39' >"+"C."+element.select3+"</option></select></div></div></div>";
						
					}
					
					
				})
				
				
				
			   resultHtml+="<div class='survey-page-bottom' ><div  class='ng-scope'>";
			   resultHtml+="<div class='survey-submit-page' onclick='tijiao()' >提交</div>";
			   resultHtml+="<div class='survey-page-index'><span class='ng-binding'>1</span>/<span  class='ng-binding'>1</span>页</div></div></div>";
			   
			   
				$("#body").html(resultHtml);
			}
		})
		
		
		
		function change(){
			  var select=document.getElementsByTagName("select");
			  var label=document.getElementsByName("xz");
			  var ts1=document.getElementsByClassName("must-do ng");
			  var ts2=document.getElementsByClassName("must-do ng-hide");
			  for(var j=0;j<label.length;j++){
					ts1[j].innerHTML="";
			  }
			  for(var m=0;m<select.length;m++){
					ts2[m].innerHTML="";
			  }
		}
     
		
		
		  
		function tijiao() {
			var questionnaireId=$("#sp").html();
			var questionnaire=document.getElementsByClassName("survey-question-title");
			var type=$(".survey-question");
			var select=document.getElementsByTagName("select");
			
			var label=document.getElementsByName("xz");
			var allQuestion=new Array();
			var k=0;
			var m=0;
		    var ts1=document.getElementsByClassName("must-do ng");
			var ts2=document.getElementsByClassName("must-do ng-hide");
			var flag=true;
			
			for(var j=0;j<label.length;j++){
				if(label[j].value==null||label[j].value==""){
					ts1[j].innerHTML="请填写答案";
					flag=false;
				}
			}
			
			for(var z=0;z<select.length;z++){
				if(select[z].value==null||select[z].value==""){
					ts2[z].innerHTML="请填写答案";
					flag=false;
				}
			}
			
			
			if(flag){
			
			 for(var i=0;i<questionnaire.length;i++){
				
				 if(type.eq(i).attr("id")=="survey-question-1-1"){
					 var context=label[k].value;
					 allQuestion[i]=context;
					 k++;
				 }else{ 
					
					 var s=select[m].value
					 if(s=="object:37"){
						 allQuestion[i]="A";
					 }else if(s=="object:38"){
						 allQuestion[i]="B";
					 }else{
						 allQuestion[i]="C";
					 }
					 m++;
				 }
				 
				 
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
		    	
		    	location.href="/Survey/main/surveyList.shtml"; 
			}
			
	}
		
		
		
		
		</script>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div id="page">
			
			
			
			
			
			
			<div id="content-wrapper">
				
				
				<input type="hidden" id="project-platform" value="4">

				<div class="content common-task-content ng-scope" ng-app="survey">
					
					
					<div id="survey-navigation"></div>
					<div class="survey-self-tip-wrap ng-scope" ng-controller="SurveyTipController" ng-init="init({&quot;id&quot;:&quot;172364&quot;,&quot;pro_name&quot;:&quot;\u60c5\u65f6\u660e\u6708&quot;,&quot;status&quot;:&quot;1&quot;,&quot;test_content&quot;:&quot;\u6b22\u8fce\u53c2\u52a0\u8c03\u67e5\uff01\u7b54\u5377\u6570\u636e\u4ec5\u7528\u4e8e\u7edf\u8ba1\u5206\u6790\uff0c\u8bf7\u653e\u5fc3\u586b\u5199\u3002\u9898\u76ee\u9009\u9879\u65e0\u5bf9\u9519\u4e4b\u5206\uff0c\u6309\u7167\u5b9e\u9645\u60c5\u51b5\u9009\u62e9\u5373\u53ef\u3002\u611f\u8c22\u60a8\u7684\u5e2e\u52a9\uff01&quot;,&quot;publish_time&quot;:null,&quot;tester_count&quot;:&quot;0&quot;})">
						<div class="survey-self-tip">
							<img src="${pageContext.request.contextPath}/img/tip_icon.png">
							<span ng-bind="tip" class="ng-binding">问卷当前为答卷状态，填写答案会记录系统，请认真填答</span>
						</div>
					</div>
					
					
					<div class="survey-self-wrap">
						<div class="survey-theme-blue">
							<div class="survey-outer-wrap clearfix ng-scope" ng-class="{&#39;survey-vote-outer-wrap&#39;: type==1}" ng-controller="SurveyDetailController" ng-init="init({&quot;survey_id&quot;:172364,&quot;survey_name&quot;:&quot;\u60c5\u65f6\u660e\u6708&quot;,&quot;status&quot;:&quot;1&quot;,&quot;type&quot;:0,&quot;pages&quot;:[{&quot;index&quot;:1,&quot;list&quot;:[{&quot;survey_id&quot;:172364,&quot;content&quot;:&quot;\u5355\u9009\u9898&quot;,&quot;type_id&quot;:6,&quot;order&quot;:&quot;1&quot;,&quot;has_other&quot;:&quot;N&quot;,&quot;title_quote&quot;:&quot;N&quot;,&quot;required&quot;:&quot;Y&quot;,&quot;page&quot;:&quot;1&quot;,&quot;index&quot;:&quot;1&quot;,&quot;absolute_id&quot;:&quot;13&quot;,&quot;last_absolute_id&quot;:17,&quot;last_choice_absolute_id&quot;:{&quot;1&quot;:3,&quot;2&quot;:0,&quot;3&quot;:1,&quot;4&quot;:0,&quot;5&quot;:0,&quot;6&quot;:0,&quot;7&quot;:0,&quot;8&quot;:2,&quot;9&quot;:3,&quot;10&quot;:0,&quot;11&quot;:0,&quot;13&quot;:2,&quot;14&quot;:3,&quot;15&quot;:2,&quot;16&quot;:0,&quot;17&quot;:1},&quot;choice_random&quot;:null,&quot;choice_fixed&quot;:null,&quot;logic_hide&quot;:0,&quot;choice&quot;:[{&quot;order&quot;:1,&quot;choice_absolute_id&quot;:&quot;1&quot;,&quot;content&quot;:&quot;\u9009\u98791&quot;,&quot;is_other&quot;:&quot;N&quot;,&quot;id&quot;:&quot;1&quot;},{&quot;order&quot;:2,&quot;choice_absolute_id&quot;:&quot;2&quot;,&quot;content&quot;:&quot;\u9009\u98792&quot;,&quot;is_other&quot;:&quot;N&quot;,&quot;id&quot;:&quot;2&quot;}],&quot;choice_quote&quot;:&quot;0&quot;,&quot;value&quot;:null,&quot;vote_type_id&quot;:0,&quot;id&quot;:&quot;13&quot;},{&quot;survey_id&quot;:172364,&quot;content&quot;:&quot;\u9009\u62e9\u5217\u8868&quot;,&quot;type_id&quot;:7,&quot;order&quot;:&quot;2&quot;,&quot;has_other&quot;:&quot;N&quot;,&quot;title_quote&quot;:&quot;N&quot;,&quot;required&quot;:&quot;Y&quot;,&quot;page&quot;:&quot;1&quot;,&quot;index&quot;:&quot;2&quot;,&quot;absolute_id&quot;:&quot;14&quot;,&quot;last_absolute_id&quot;:17,&quot;last_choice_absolute_id&quot;:{&quot;1&quot;:3,&quot;2&quot;:0,&quot;3&quot;:1,&quot;4&quot;:0,&quot;5&quot;:0,&quot;6&quot;:0,&quot;7&quot;:0,&quot;8&quot;:2,&quot;9&quot;:3,&quot;10&quot;:0,&quot;11&quot;:0,&quot;13&quot;:2,&quot;14&quot;:3,&quot;15&quot;:2,&quot;16&quot;:0,&quot;17&quot;:1},&quot;choice_random&quot;:null,&quot;choice_fixed&quot;:null,&quot;logic_hide&quot;:0,&quot;choice&quot;:[{&quot;order&quot;:1,&quot;choice_absolute_id&quot;:&quot;1&quot;,&quot;content&quot;:&quot;\u9009\u98791&quot;,&quot;is_other&quot;:&quot;N&quot;,&quot;id&quot;:&quot;1&quot;},{&quot;order&quot;:2,&quot;choice_absolute_id&quot;:&quot;2&quot;,&quot;content&quot;:&quot;\u9009\u98792&quot;,&quot;is_other&quot;:&quot;N&quot;,&quot;id&quot;:&quot;2&quot;},{&quot;order&quot;:3,&quot;choice_absolute_id&quot;:&quot;3&quot;,&quot;content&quot;:&quot;\u9009\u98793&quot;,&quot;is_other&quot;:&quot;N&quot;,&quot;id&quot;:&quot;3&quot;}],&quot;choice_quote&quot;:&quot;0&quot;,&quot;value&quot;:null,&quot;vote_type_id&quot;:0,&quot;id&quot;:&quot;14&quot;},{&quot;survey_id&quot;:172364,&quot;content&quot;:&quot;\u591a\u9009\u9898&quot;,&quot;type_id&quot;:8,&quot;order&quot;:&quot;3&quot;,&quot;has_other&quot;:&quot;N&quot;,&quot;title_quote&quot;:&quot;N&quot;,&quot;required&quot;:&quot;Y&quot;,&quot;page&quot;:&quot;1&quot;,&quot;index&quot;:&quot;3&quot;,&quot;absolute_id&quot;:&quot;15&quot;,&quot;last_absolute_id&quot;:17,&quot;last_choice_absolute_id&quot;:{&quot;1&quot;:3,&quot;2&quot;:0,&quot;3&quot;:1,&quot;4&quot;:0,&quot;5&quot;:0,&quot;6&quot;:0,&quot;7&quot;:0,&quot;8&quot;:2,&quot;9&quot;:3,&quot;10&quot;:0,&quot;11&quot;:0,&quot;13&quot;:2,&quot;14&quot;:3,&quot;15&quot;:2,&quot;16&quot;:0,&quot;17&quot;:1},&quot;choice_random&quot;:null,&quot;choice_fixed&quot;:null,&quot;logic_hide&quot;:0,&quot;min&quot;:&quot;&quot;,&quot;max&quot;:&quot;&quot;,&quot;exclusive_options&quot;:&quot;&quot;,&quot;choice&quot;:[{&quot;order&quot;:1,&quot;choice_absolute_id&quot;:&quot;1&quot;,&quot;content&quot;:&quot;\u9009\u98791&quot;,&quot;is_other&quot;:&quot;N&quot;,&quot;id&quot;:&quot;1&quot;},{&quot;order&quot;:2,&quot;choice_absolute_id&quot;:&quot;2&quot;,&quot;content&quot;:&quot;\u9009\u98792&quot;,&quot;is_other&quot;:&quot;N&quot;,&quot;id&quot;:&quot;2&quot;}],&quot;choice_quote&quot;:&quot;0&quot;,&quot;value&quot;:[false,false],&quot;vote_type_id&quot;:0,&quot;id&quot;:&quot;15&quot;},{&quot;survey_id&quot;:172364,&quot;content&quot;:&quot;\u77e9\u9635\u5355\u9009\u9898&quot;,&quot;type_id&quot;:9,&quot;order&quot;:&quot;4&quot;,&quot;has_other&quot;:&quot;N&quot;,&quot;title_quote&quot;:&quot;N&quot;,&quot;required&quot;:&quot;Y&quot;,&quot;page&quot;:&quot;1&quot;,&quot;index&quot;:&quot;4&quot;,&quot;absolute_id&quot;:&quot;16&quot;,&quot;last_absolute_id&quot;:17,&quot;last_choice_absolute_id&quot;:{&quot;1&quot;:3,&quot;2&quot;:0,&quot;3&quot;:1,&quot;4&quot;:0,&quot;5&quot;:0,&quot;6&quot;:0,&quot;7&quot;:0,&quot;8&quot;:2,&quot;9&quot;:3,&quot;10&quot;:0,&quot;11&quot;:0,&quot;13&quot;:2,&quot;14&quot;:3,&quot;15&quot;:2,&quot;16&quot;:0,&quot;17&quot;:1},&quot;choice_random&quot;:null,&quot;choice_fixed&quot;:null,&quot;logic_hide&quot;:0,&quot;choice&quot;:[{&quot;order&quot;:1,&quot;choice_absolute_id&quot;:1,&quot;content&quot;:&quot;\u9009\u98791&quot;,&quot;is_other&quot;:&quot;N&quot;,&quot;id&quot;:1},{&quot;order&quot;:2,&quot;choice_absolute_id&quot;:2,&quot;content&quot;:&quot;\u9009\u98792&quot;,&quot;is_other&quot;:&quot;N&quot;,&quot;id&quot;:2}],&quot;radio_array_title&quot;:[{&quot;order&quot;:1,&quot;content&quot;:&quot;\u77e9\u9635\u884c1&quot;,&quot;other_content&quot;:[]},{&quot;order&quot;:2,&quot;content&quot;:&quot;\u77e9\u9635\u884c2&quot;,&quot;other_content&quot;:[]}],&quot;value&quot;:[null,null],&quot;vote_type_id&quot;:0,&quot;id&quot;:&quot;16&quot;}]}],&quot;from&quot;:&quot;eb11e358acaf7ade35c33432f68b499c&quot;,&quot;page_count&quot;:1,&quot;logic_condition&quot;:null,&quot;redirect_relation&quot;:null,&quot;description&quot;:&quot;\u6b22\u8fce\u53c2\u52a0\u8c03\u67e5\uff01\u7b54\u5377\u6570\u636e\u4ec5\u7528\u4e8e\u7edf\u8ba1\u5206\u6790\uff0c\u8bf7\u653e\u5fc3\u586b\u5199\u3002\u9898\u76ee\u9009\u9879\u65e0\u5bf9\u9519\u4e4b\u5206\uff0c\u6309\u7167\u5b9e\u9645\u60c5\u51b5\u9009\u62e9\u5373\u53ef\u3002\u611f\u8c22\u60a8\u7684\u5e2e\u52a9\uff01&quot;,&quot;scene&quot;:1,&quot;least_time_per_question&quot;:3,&quot;longest_time&quot;:0,&quot;platform&quot;:2,&quot;token&quot;:&quot;eb11e358acaf7ade35c33432f68b499c&quot;}, 0, {&quot;id&quot;:&quot;172364&quot;,&quot;pro_name&quot;:&quot;\u60c5\u65f6\u660e\u6708&quot;,&quot;status&quot;:&quot;1&quot;,&quot;test_content&quot;:&quot;\u6b22\u8fce\u53c2\u52a0\u8c03\u67e5\uff01\u7b54\u5377\u6570\u636e\u4ec5\u7528\u4e8e\u7edf\u8ba1\u5206\u6790\uff0c\u8bf7\u653e\u5fc3\u586b\u5199\u3002\u9898\u76ee\u9009\u9879\u65e0\u5bf9\u9519\u4e4b\u5206\uff0c\u6309\u7167\u5b9e\u9645\u60c5\u51b5\u9009\u62e9\u5373\u53ef\u3002\u611f\u8c22\u60a8\u7684\u5e2e\u52a9\uff01&quot;,&quot;publish_time&quot;:null,&quot;tester_count&quot;:&quot;0&quot;})">
								<a class="survey-paper-clip"></a>
								<!-- ngIf: type != 1 -->
								<div ng-if="type != 1" class="ng-scope">
									
									<!--<div class="survey-progress-bar ng-scope" ng-if="process.total &gt; 0">
										<div class="survey-progress-activebar" ng-style="{width: process.percent + &#39;%&#39;}" style="width: 0%;">
											
										</div>
									</div>-->
									<!-- end ngIf: process.total > 0 -->
								</div>
								<!-- end ngIf: type != 1 -->
								<div ng-switch="type">
									<!-- ngSwitchWhen: 1 -->
									<!-- ngSwitchDefault:  -->
									<div ng-switch-default="" class="ng-scope">
										<div class="survey-wrap">
											
											
											<div class="survey-title ng-binding" ng-bind="project.pro_name">情时明月</div>
											<div class="survey-desciption mt20">
												<div ng-bind-html="trustAsHtml(project.test_content)" class="ng-binding">欢迎参加调查！答卷数据仅用于统计分析，请放心填写。题目选项无对错之分，按照实际情况选择即可。感谢您的帮助！</div>
												<div>声明：问卷星不会以任何理由索要您的账号、密码、身份等敏感信息，请确认信息是否可靠，防止个人信息泄露</div>
											</div>
											
											
											
											<div class="survey-question-wrap">
												<!-- ngRepeat: page in pages -->
												
												
												
												<div id="body" class="survey-page ng-scope" ng-repeat="page in pages" ng-show="page.index==selectedPage">
												
												
												
												
													
													<!-- <div class="survey-question ng-scope" id="survey-question-1-1" >
														<div class="survey-question-title" >
														    <div class="survey-show-as-html ng-binding ng-scope">1. 单选题             <input type="text" name="xz" style="width:20px; height:20px;"> </div>
															<span class="must-do ng-binding"></span>
														</div>
														<div class="must-do ng-hide" >请按要求作答</div>
													
														<div class="survey-question-content ng-scope" >
															
															<div class="survey-question-radio ng-scope">
															
																<div class="survey-question-radio-choice ng-scope" >
																	<div class="radio-image"></div>
																	<label class="survey-show-as-html ng-binding">选项1</label>
																</div>
																
																<div class="survey-question-radio-choice ng-scope" >
																	<div   class="radio-image"></div>
																	<label class="survey-show-as-html ng-binding">选项2</label>
															    </div>
															</div>
														</div>
													</div>
												
												
													
													<div class="survey-question ng-scope" id="survey-question-1-2"  >
														<div class="survey-question-title" >
															
															<div class="survey-show-as-html ng-binding ng-scope" >2. 选择列表</div>
														
															<span class="must-do ng-binding" ></span>
														</div>
														<div class="must-do ng-hide" >请按要求作答</div>
														ngIf: question.type_id!=10 && question.content_show==1
														<div class="survey-question-content ng-scope">
															<div class="survey-question-select ng-scope" >
																<select style="width: 200px"  class="ng-pristine ng-untouched ng-valid">
																	<option selected="selected"></option>
																	<option value="object:37" label="选项1">选项1</option>
																	<option value="object:38" label="选项2">选项2</option>
																	<option value="object:39" label="选项3">选项3</option>
																</select>
															</div>
										                </div>
													
													</div>
													end ngRepeat: question in page.list

 -->




												<!-- <div class="survey-page-bottom" >
														
														<div  class="ng-scope">
															
															<div class="survey-submit-page" onclick="tijiao()" >提交</div>
															<div class="survey-page-index"><span class="ng-binding">1</span>/<span  class="ng-binding">1</span>页</div>
														</div>
													
												</div> -->
												
												
											</div>
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