<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html class="expanded">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>问卷星-题目设计</title>
		

		 <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/question.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aio.css" />
		<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.fileupload.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/edit.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.limitTextarea.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/survey_edit.js"></script>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/shejitimu.js"></script>
		
	</head>
	
	

	<body>
		 <jsp:include page="header.jsp"></jsp:include> 
	
	
		<div id="page">
			
			
			
			
			
			
			
			
			<div id="content-wrapper">
				<input type="hidden" id="project-platform" value="4">

				<div id="bce-main">
					<div class="main" style="position: relative">
						<div class="content common-task-content">
							<p class="bce-breadcrumb">
								<a href="#"><span>问卷调研</span></a>
								<span class="divider">/</span>
								<span class="active">编辑问卷</span>
							</p>
							
							<div class="edit-survey-wrap" id="edit-survey-wrap">
								<div class="edit-survey-content">
									<div class="navigation after-clear" id="navigation">
										<div class="navigation-feedback-wrap">
											<div class="navigation-feedback"><img src="${pageContext.request.contextPath}/img/feedback_icon.png">
												<a>请说出您的期待，我们为您设计</a>
											</div>
										</div>

										<ul class="survey-nav">
											<li class="active">
												<div class="survey-nav-icon"></div>
												<div class="survey-nav-name">设计问卷</div>
												<div class="survey-nav-line"></div>
											</li>
											<li>
												<div class="survey-nav-icon"></div>
												<div class="survey-nav-name"></div>
												<div class="survey-nav-line"></div>
											</li>
											<li>
												<div class="survey-nav-icon"></div>
												<div class="survey-nav-name"></div>

											</li>
										</ul>
									</div>
								</div>
							</div>

							<script type="text/javascript">
								var templateType = {
									"id": "0",
									"name": "\u4e00\u822c\u95ee\u5377",
									"detail": {
										"filter": {
											"freeCollection": [20],
											"isFilterRule": 1,
											"scene": {
												"1": 1,
												"2": 1
											}
										},
										"name": "\u95ee\u5377",
										"url": {
											"edit": "home\/edit"
										},
										"steps": [{
											"name": "\u8bbe\u8ba1\u95ee\u5377",
											"link": "home\/edit"
										}, {
											"name": "\u6536\u96c6\u8bbe\u7f6e",
											"link": ""
										}, {
											"name": "\u5b8c\u6210\u652f\u4ed8",
											"link": ""
										}]
									},
									"display": "0",
									"status": "0",
									"created": "2016-04-08 00:00:00",
									"updated": "2016-05-18 19:49:23"
								};
								var common_question = [{
									"question_id": "1",
									"question_order": "1",
									"question_name": "\u60a8\u7684\u6027\u522b",
									"question_content": {
										"content": "\u60a8\u7684\u6027\u522b",
										"type_id": "6",
										"has_other": "N",
										"required": "Y",
										"choice": [{
											"order": "1",
											"content": "\u7537",
											"is_other": "N"
										}, {
											"order": "2",
											"content": "\u5973",
											"is_other": "N"
										}]
									}
								}, {
									"question_id": "2",
									"question_order": "2",
									"question_name": "\u60a8\u7684\u5e74\u9f84",
									"question_content": {
										"content": "\u60a8\u7684\u5e74\u9f84",
										"type_id": "6",
										"has_other": "Y",
										"required": "Y",
										"choice": [{
											"order": "1",
											"content": "15\u53ca\u4ee5\u4e0b",
											"is_other": "N"
										}, {
											"order": "2",
											"content": "16-23",
											"is_other": "N"
										}, {
											"order": "3",
											"content": "24-30",
											"is_other": "N"
										}, {
											"order": "4",
											"content": "31-40",
											"is_other": "N"
										}, {
											"order": "5",
											"content": "41\u53ca\u4ee5\u4e0a",
											"is_other": "N"
										}, {
											"order": "6",
											"content": "\u5176\u4ed6",
											"is_other": "Y"
										}]
									}
								}, {
									"question_id": "3",
									"question_order": "3",
									"question_name": "\u60a8\u7684\u804c\u4e1a",
									"question_content": {
										"content": "\u60a8\u7684\u804c\u4e1a",
										"type_id": "7",
										"has_other": "Y",
										"required": "Y",
										"choice": [{
											"order": "1",
											"content": "\u5728\u6821\u5b66\u751f",
											"is_other": "N"
										}, {
											"order": "2",
											"content": "\u653f\u5e9c\/\u673a\u5173\u5e72\u90e8\/\u516c\u52a1\u5458",
											"is_other": "N"
										}, {
											"order": "3",
											"content": "\u4f01\u4e1a\u7ba1\u7406\u8005\uff08\u5305\u62ec\u57fa\u5c42\u53ca\u4e2d\u9ad8\u5c42\u7ba1\u7406\u8005\uff09",
											"is_other": "N"
										}, {
											"order": "4",
											"content": "\u666e\u901a\u804c\u5458\uff08\u529e\u516c\u5ba4\/\u5199\u5b57\u697c\u5de5\u4f5c\u4eba\u5458\uff09",
											"is_other": "N"
										}, {
											"order": "5",
											"content": "\u4e13\u4e1a\u4eba\u5458\uff08\u5982\u533b\u751f\/\u5f8b\u5e08\/\u6587\u4f53\/\u8bb0\u8005\/\u8001\u5e08\u7b49\uff09",
											"is_other": "N"
										}, {
											"order": "6",
											"content": "\u666e\u901a\u5de5\u4eba\uff08\u5982\u5de5\u5382\u5de5\u4eba\/\u4f53\u529b\u52b3\u52a8\u8005\u7b49\uff09",
											"is_other": "N"
										}, {
											"order": "7",
											"content": "\u5546\u4e1a\u670d\u52a1\u4e1a\u804c\u5de5\uff08\u5982\u9500\u552e\u4eba\u5458\/\u5546\u5e97\u804c\u5458\/\u670d\u52a1\u5458\u7b49\uff09",
											"is_other": "N"
										}, {
											"order": "8",
											"content": "\u4e2a\u4f53\u7ecf\u8425\u8005\/\u627f\u5305\u5546",
											"is_other": "N"
										}, {
											"order": "9",
											"content": "\u81ea\u7531\u804c\u4e1a\u8005",
											"is_other": "N"
										}, {
											"order": "10",
											"content": "\u519c\u6797\u7267\u6e14\u52b3\u52a8\u8005",
											"is_other": "N"
										}, {
											"order": "11",
											"content": "\u9000\u4f11",
											"is_other": "N"
										}, {
											"order": "12",
											"content": "\u6682\u65e0\u804c\u4e1a",
											"is_other": "N"
										}, {
											"order": "13",
											"content": "\u5176\u4ed6",
											"is_other": "Y"
										}]
									}
								}, {
									"question_id": "4",
									"question_order": "4",
									"question_name": "\u5de5\u4f5c\u5e74\u9650",
									"question_content": {
										"content": "\u5de5\u4f5c\u5e74\u9650",
										"type_id": "6",
										"has_other": "Y",
										"required": "Y",
										"choice": [{
											"order": "1",
											"content": "1\u5e74\u53ca\u4ee5\u4e0b",
											"is_other": "N"
										}, {
											"order": "2",
											"content": "2-3\u5e74",
											"is_other": "N"
										}, {
											"order": "3",
											"content": "4-5\u5e74",
											"is_other": "N"
										}, {
											"order": "4",
											"content": "6-9\u5e74",
											"is_other": "N"
										}, {
											"order": "5",
											"content": "10\u5e74\u53ca\u4ee5\u4e0a",
											"is_other": "N"
										}]
									}
								}, {
									"question_id": "5",
									"question_order": "5",
									"question_name": "\u6559\u80b2\u7a0b\u5ea6",
									"question_content": {
										"content": "\u6559\u80b2\u7a0b\u5ea6",
										"type_id": "6",
										"has_other": "Y",
										"required": "Y",
										"choice": [{
											"order": "1",
											"content": "\u521d\u4e2d\u53ca\u4ee5\u4e0b",
											"is_other": "N"
										}, {
											"order": "2",
											"content": "\u9ad8\u4e2d",
											"is_other": "N"
										}, {
											"order": "3",
											"content": "\u5927\u4e13",
											"is_other": "N"
										}, {
											"order": "4",
											"content": "\u672c\u79d1",
											"is_other": "N"
										}, {
											"order": "5",
											"content": "\u7855\u58eb\u53ca\u4ee5\u4e0a",
											"is_other": "N"
										}]
									}
								}, {
									"question_id": "6",
									"question_order": "6",
									"question_name": "\u4e2a\u4eba\u6708\u6536\u5165",
									"question_content": {
										"content": "\u4e2a\u4eba\u6708\u6536\u5165",
										"type_id": "6",
										"has_other": "Y",
										"required": "Y",
										"choice": [{
											"order": "1",
											"content": "\u5728\u6821\u5b66\u751f\uff0c\u6ca1\u6709\u6536\u5165",
											"is_other": "N"
										}, {
											"order": "2",
											"content": "2000\u5143\u53ca\u4ee5\u4e0b",
											"is_other": "N"
										}, {
											"order": "3",
											"content": "2001-3000\u5143",
											"is_other": "N"
										}, {
											"order": "4",
											"content": "3001-5000\u5143",
											"is_other": "N"
										}, {
											"order": "5",
											"content": "5001-8000\u5143",
											"is_other": "N"
										}, {
											"order": "6",
											"content": "8001-12000\u5143",
											"is_other": "N"
										}, {
											"order": "7",
											"content": "12001-20000\u5143",
											"is_other": "N"
										}, {
											"order": "8",
											"content": "20000\u5143\u4ee5\u4e0a",
											"is_other": "N"
										}, {
											"order": "9",
											"content": "\u4e0d\u65b9\u4fbf\u900f\u9732",
											"is_other": "N"
										}]
									}
								}, {
									"question_id": "7",
									"question_order": "7",
									"question_name": "\u5a5a\u59fb\u72b6\u51b5",
									"question_content": {
										"content": "\u5a5a\u59fb\u72b6\u51b5",
										"type_id": "6",
										"has_other": "N",
										"required": "Y",
										"choice": [{
											"order": "1",
											"content": "\u5df2\u5a5a",
											"is_other": "N"
										}, {
											"order": "2",
											"content": "\u672a\u5a5a",
											"is_other": "N"
										}, {
											"order": "3",
											"content": "\u5176\u4ed6",
											"is_other": "N"
										}]
									}
								}, {
									"question_id": "8",
									"question_order": "8",
									"question_name": "\u5355\u9009\u9898",
									"question_content": {
										"content": "\u5355\u9009\u9898",
										"type_id": "6",
										"has_other": "N",
										"required": "Y",
										"choice": [{
											"order": "1",
											"content": "\u9009\u98791 ",
											"is_other": "N"
										}, {
											"order": "2",
											"content": "\u9009\u98792 ",
											"is_other": "N"
										}]
									}
								}];
								var survey_init = {
									"survey_id": 172364,
									"status": "0",
									"survey_name": "\u60c5\u65f6\u660e\u6708",
									"test_content": "\u6b22\u8fce\u53c2\u52a0\u8c03\u67e5\uff01\u7b54\u5377\u6570\u636e\u4ec5\u7528\u4e8e\u7edf\u8ba1\u5206\u6790\uff0c\u8bf7\u653e\u5fc3\u586b\u5199\u3002\u9898\u76ee\u9009\u9879\u65e0\u5bf9\u9519\u4e4b\u5206\uff0c\u6309\u7167\u5b9e\u9645\u60c5\u51b5\u9009\u62e9\u5373\u53ef\u3002\u611f\u8c22\u60a8\u7684\u5e2e\u52a9\uff01",
									"content": [],
									"quota_info": [],
									"redirect_relation": null,
									"logic_condition": null,
									"adm_user_id": "0",
									"passport_user_id": "0",
									"customer_id": "507672",
									"channel": "mtc",
									"unit_price": "1",
									"total_price": "0",
									"collection_target": "0",
									"scene": "1",
									"ip_filter": 0,
									"is_trial": false,
									"is_expansion": false,
									"tag_image_show": "0",
									"spss_show": "0",
									"type": 0,
									"type_questions": [],
									"filter_user": 0,
									"choice_random": 0,
									"project_background": "",
									"productline_id": "0",
									"other_productline": "",
									"copy_survey_id": 0,
									"filter_rules": [],
									"filter_user_type": 0,
									"surveyUrl": {
										"mobile": "http:\/\/test.baidu.com\/qss\/ade3\/172364.html",
										"pc": "http:\/\/test.baidu.com\/qss\/ade3\/172364.html"
									},
									"user_attribute_config": {
										"interest": {
											"title": "\u5174\u8da3\u5173\u6ce8",
											"items": ["\u4e0d\u9650", "\u4e2a\u62a4\u7f8e\u5bb9", "\u4f53\u80b2\u5065\u8eab", "\u7f51\u7edc\u8d2d\u7269", "\u533b\u7597\u5065\u5eb7", "\u5bb6\u7535\u6570\u7801", "\u5efa\u6750\u5bb6\u5c45", "\u5f71\u89c6\u97f3\u4e50", "\u65c5\u6e38\u51fa\u884c", "\u91d1\u878d\u8d22\u7ecf", "\u9910\u996e\u7f8e\u98df"],
											"value": "\u4e0d\u9650",
											"weight": 50
										}
									},
									"is_share": "1",
									"telephone_filter": "0",
									"mutex_info": {},
									"sample_id": 0,
									"least_time_per_question": 3
								};
								var absolute_id, choice_absolute_id;
								var surveyTitle = '';
								if(survey_init && survey_init.survey_name) {
									surveyTitle = survey_init.survey_name;
								}
								if(survey_init && survey_init.content[0] && survey_init.content[0].last_absolute_id) {
									absolute_id = survey_init.content[0].last_absolute_id;
								} else {
									absolute_id = 0;
								}
								if(survey_init && survey_init.content[0] && survey_init.content[0].last_choice_absolute_id) {
									choice_absolute_id = survey_init.content[0].last_choice_absolute_id;
								} else {
									choice_absolute_id = {};
								}
								var logic_condition;
								if(survey_init && survey_init.logic_condition) {
									logic_condition = survey_init.logic_condition
								} else {
									logic_condition = {};
								}
								var redirect_relation;
								if(survey_init && survey_init.redirect_relation) {
									redirect_relation = survey_init.redirect_relation
								} else {
									redirect_relation = {};
								}
								var quotaInfo;
								if(survey_init && survey_init.quota_info) {
									quotaInfo = survey_init.quota_info
								} else {
									quotaInfo = [];
								}

								var updateStatus = 0;
								var previewFrom = "eb11e358acaf7ade35c33432f68b499c";
							</script>
							
							
							
							
							

						<!-- <div class="survey-hide edit-img" contenteditable="false">
								<ul>
									<li class="upload-element-img">
										<form class="upload-form" enctype="multipart/form-data" action="#" method="post">
											<input type="file" class="upload-img" name="upload_img" title="图片" onchange="edit.uploadImg()">
											<div class="visibility-btn" title="图片"></div>
										</form>
									</li>
									
									<li class="handle-element handle-child-element" title="操作" onclick="edit.handleChildElement()"></li>
									<li class="handle-element remove-child-element" title="删除" onclick="edit.removeChildElement()"></li>
									<li class="handle-element up-child-element" title="上移" onclick="edit.upChildElement()"></li>
									<li class="handle-element down-child-element" title="下移" onclick="edit.downChildElement()"></li>
								</ul>
							</div> -->



						<!-- 	<div class="survey-hide time-save survey-dialog" style="top: 500px; left: 674.5px; display: none;">已实时保存</div> 
 -->
							<div class="edit-survey-wrap">
								<div class="edit-survey-content">
									
									<div class="navigation after-clear">
										<div class="handle-survey after-clear">
											<input type="button" class="common-button survey-button preview-survey" value="预览问卷" >
										</div>
									</div>
									
									<div id="edit-survey-content">
										
										<div class="rows1">
											<div class="sur-sidebar" style="top: 0px;">
												<div class="select-question">
													<div class="classify-title select-question-title">题型选择</div>
													<ul>
														<li class="module ui-draggable" name="radio" style="background-position: 0px -4px;" onclick="change()">单选题</li>
														<li class="module ui-draggable" name="select" style="background-position: 0px -40px;" onclick="change()">下拉选择题</li>
														
														
														<!-- <li class="module ui-draggable" name="checkbox" style="background-position: 0px -76px;">多选题</li>
														<li class="module ui-draggable" name="input" style="background-position: 0px -112px;">单行填空题</li>
														<li class="module ui-draggable" name="multi-input" style="background-position: 0px -148px;">多行填空题</li>
														<li class="module ui-draggable" name="radio-matrix" style="background-position: 0px -184px;">矩阵单选题</li>
														<li class="module ui-draggable" name="checkbox-matrix" style="background-position: 0px -368px;">矩阵多选题</li> -->
														<!-- <li class="module ui-draggable radio-img" name="radio-img">图片单选</li> -->
													<!-- <li class="module ui-draggable checkbox-img" name="checkbox-img">图片多选</li>
														<li class="module ui-draggable" name="desc" style="background-position: 0px -222px;">描述说明</li>
														<li class="module ui-draggable" name="page" style="background-position: 0px -328px;">分页符</li>  -->
														
														
													</ul>
												</div>
												
												
												<!-- <div class="common-questions">
													<div class="classify-title common-questions-title">常规问题</div>
													<ul style="display: none;">
														<li class="ui-draggable common_question" index="0">您的性别</li>
														<li class="ui-draggable common_question" index="1">您的年龄</li>
														<li class="ui-draggable common_question" index="2">您的职业</li>
														<li class="ui-draggable common_question" index="3">工作年限</li>
														<li class="ui-draggable common_question" index="4">教育程度</li>
														<li class="ui-draggable common_question" index="5">个人月收入</li>
														<li class="ui-draggable common_question" index="6">婚姻状况</li>
														<li class="ui-draggable common_question" index="7">单选题</li>
													</ul>
												</div>  -->
											</div>
										</div>
										
										
										
										
										
										
										<div class="rows2">
											
											
											<div class="survey-title">
												<div class="title-content edit-area" id="surveyTitle" contenteditable="true" tabindex="1" style="background: rgb(255, 255, 255);">${title}</div>
												<div class="error-tips error"></div>
											</div>
											
											
											<!-- <div class="survey-desc">
												<div class="position-relative" style="width:100%">
													<div class="desc-content edit-area" contenteditable="true" style="background: rgb(255, 255, 255);">欢迎参加调查！答卷数据仅用于统计分析，请放心填写。题目选项无对错之分，按照实际情况选择即可。感谢您的帮助！</div>
													<div class="error-tips"></div>
												</div>
											</div>  -->
											
											
											<div id="question-box" class="ui-sortable">
											
											
<!-- 
												 <div class="topic-type-content topic-type-question after-clear">
													
													<div class="question-title" type="7" name="select-question">
													    <span class="required">*</span>
													    <span class="question-id" order="1" page="1" index="1" absolute_id="1"
													          question-required="Y" has_other="N" title-quote="N" choice-quote="0">Q1</span>
														<div class="position-relative">
															<div class="qs-content edit-area edit-title" tabindex="0" 
															     contenteditable="true" style="background: rgb(255, 255, 255);">选择列表</div>
														</div>
													</div>
													<select class="question-choice" style="  padding: 0;margin: 15px 0 20px 35px;">
														<option class="choice" has_other="N" choice_absolute_id="1">选项1</option>
														<option class="choice" has_other="N" choice_absolute_id="2">选项2</option>
														<option class="choice" has_other="N" choice_absolute_id="3">选项3</option>
													</select>
													<span class="edit-select" style="  width: 60%;display: inline-block;line-height: 30px;" onclick="edit.editSelect(this)">编辑选项</span>
													
												</div>  -->




											<!--  <div
												class="topic-type-content topic-type-question after-clear">
												<div class="question-title" type="6" name="radio-question">
													<span class="required">*</span>
													<span class="question-id" order="2" page="1" index="2" absolute_id="2"
														question-required="Y" has_other="N" title-quote="N" choice-quote="0">Q2</span>
													<div class="position-relative">
														<div class="qs-content edit-area edit-title" tabindex="0"
															contenteditable="true" content-default="1"
															style="background: rgb(255, 255, 255); border: none;">单选题</div>
													</div>
												</div>
												<ul class="question-choice">
													<li class="choice" has_other="N" choice_absolute_id="1"><input
														type="radio" name="radio">
														<div class="position-relative">
														
															<div class="edit-area edit-child-element"
																contenteditable="true" content-default="1"
																style="display: inline-block; background: rgb(255, 255, 255); border: none;">选项1
															</div>
														</div>
														<div class="option-tips"></div>
													</li>
														
														
													<li class="choice" has_other="N" choice_absolute_id="2"><input
														type="radio" name="radio">
														<div class="position-relative">
															<div class="edit-area edit-child-element"
																contenteditable="true" content-default="1"
																style="display: inline-block; background: rgb(255, 255, 255); border: none;">选项2
															</div>
														</div>
														<div class="option-tips"></div>
													</li>
												</ul>


											</div> -->











										</div>
											
											
											<div id="survey-tail">
												<ul>
													<li>
														<div id="page-tail">页码:1/1</div>
													</li>
													<li style="height: 40px;">
														<div id="survey-op" class="after-clear">
															<div class="preview-survey dib">
																<input type="button" id="timuyulan" class="common-button survey-button preview-survey" value="创建问卷" onclick="previewSurvey()">
															</div>
															<!--<div class="larger-outstanding-button op-next dib">下一步</div>-->
															
															
										
															
															
														</div>
													</li>
												</ul>
											</div>
											
											
										</div>
									</div>
								</div>
							</div>

							<div class="attach-layer attach-left" style="top: 259px; width: 362.5px; height: 895px; left: 0px;"></div>
							<div class="attach-layer attach-right" style="top: 259px; right: 0px; width: 196.5px; height: 895px;"></div>

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
	
		
		
		
		
		
		<script>
			var page_uuid = "33994FE3-94E5-C36D-2F5A-DDB8550251D2";
			var CA = {
				isLogin: true,
				baseUrl: "http:\/\/mtc.baidu.com\/",
				urlPrefix: "",
				baseUrlModule: "http:\/\/mtc.baidu.com\/survey\/",
				baseUrlJS: "http:\/\/mtc.baidu.com\/static\/home\/" + 'js/',
				baseUrlCSS: "http:\/\/mtc.baidu.com\/static\/home\/" + 'css/',
				baseUrlImg: "http:\/\/mtc.baidu.com\/static\/home\/" + 'img/',
				yiiCsrfToken: "779df781e5f1d37102a9c106c1b5bd78565bda4e"
			};
			var createTaskData = {
				projectDesc: "",
				defaultDesc: ""
			};

			var reportData = {
				screenShots: "{}"
			};
		</script>

		
		
	</body>

</html>