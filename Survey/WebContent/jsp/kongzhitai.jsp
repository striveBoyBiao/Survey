
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">





<html class="expanded">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		
		<!-- <style type="text/css">
			@charset "UTF-8";
			[ng\:cloak],
			[ng-cloak],
			[data-ng-cloak],
			[x-ng-cloak],
			.ng-cloak,
			.x-ng-cloak,
			.ng-hide:not(.ng-hide-animate) {
				display: none !important;
			}
			
			ng\:form {
				display: block;
			}
			
			.ng-animate-shim {
				visibility: hidden;
			}
			
			.ng-anchor {
				position: absolute;
			}
		</style> -->

		
		<title>问卷星</title>
		
		
		<!-- <style>
			[ng\:cloak],
			[ng-cloak],
			[data-ng-cloak],
			[x-ng-cloak],
			.ng-cloak,
			.x-ng-cloak,
			.ng-hide {
				display: none !important;
			}
			
			ng\:form {
				display: block;
			}
			
			.ng-animate-start {
				clip: rect(0, auto, auto, 0);
				-ms-zoom: 1.0001;
			}
			
			.ng-animate-active {
				clip: rect(-1px, auto, auto, 0);
				-ms-zoom: 1;
			}
		</style> -->
		
 		<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
		<link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aio.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/kongzhitai.js" ></script>
		<script>

			$("document").ready(function(){
				$("#sy").attr("class","nav-link ");
				$("#wj").attr("class","nav-link ");
				$("#ks").attr("class","nav-link ");
				$("#gl").attr("class","nav-link active");
			})	
		</script>
	
		<style type="text/css">
		
		   #search{
		      margin-left: 7px;
		      margin-top: 7px
		   
		   
		   }
		
		</style>
		
		
		
		
	</head>

	<body>
		
		<jsp:include page="header.jsp"></jsp:include>
		
		
		<div id="page">
			
			
			
			
			<div id="content-wrapper">
				<input type="hidden" id="project-platform" value="4">

				<div id="bce-main" ng-app="survey" class="ng-scope">
					<div class="main">
						<ul class="bce-sidebar" id="bce-sidebar">
							<li class="bce-menu-header">
								问卷调研
							</li>
							<li class="bce-menu-item bce-sidebar-qss-list-instance active">
								<a class="bce-menu-list-item" href="${pageContext.request.contextPath}/main/console.shtml">问卷列表</a>
							</li>
							<li class="bce-menu-item bce-sidebar-qss-template-instance ">
								<a class="bce-menu-list-item" href="${pageContext.request.contextPath}/console/createSurvey.shtml">创建问卷</a>
							</li>
						</ul>
						<div ng-controller="SurveyManagement" class="survey-manage-wrap content ng-scope">
							<p class="bce-breadcrumb">
								<a href="#"><span>问卷调研</span></a>
								<span class="divider">/</span>
								<span class="active">问卷列表</span>
							</p>
							<div class="survey-manage-content main-content-wrap" ng-hide="emptyList">
								<h2>问卷列表 <span class="survey-manage-content-tip"></span></h2>
								<div class="bce-task-list-head">
									<a class="bce-create-task-btn" style="text-decoration: none" href="${pageContext.request.contextPath}/console/createSurvey.shtml" target="_blank">
										<div class="bce-common-normal-btn">
											<span class="bce-normal-btn-plus-tag">+</span>创建问卷
										</div>
									</a>
									<div class="bce-status-select-wrap">
										<div class="bce-status-select" ng-click="expandSelect()">
											<span ng-bind="statusAry[statusFilter]" class="ng-binding" onclick="change()" id="bind">全部状态</span>
											<div class="bce-status-select-arrow" ng-class="expandSelectClass"></div>
										</div>
										<ul ng-show="isExpanded" class="ng-hide" id="guding">
											
											<li ng-repeat="(k,v) in statusMap" ng-bind="statusAry[v]" ng-click="statusChanged(v)" class="ng-binding ng-scope" onclick="change1()">全部状态</li>
											<li ng-repeat="(k,v) in statusMap" ng-bind="statusAry[v]" ng-click="statusChanged(v)" class="ng-binding ng-scope" onclick="change2()">发布中</li>
										
											<li ng-repeat="(k,v) in statusMap" ng-bind="statusAry[v]" ng-click="statusChanged(v)" class="ng-binding ng-scope" onclick="change3()">已完成</li>
											
										</ul>
										
										
										
										
									</div>
									<input type="text" id="mh" class="bce-task-status-filter ng-pristine ng-untouched ng-valid" placeholder="输入标题搜索" ng-model="nameFilter" style="width:160px;">
									<div class="bce-task-filter-search" >
									  <span id="search" class="glyphicon glyphicon-search" aria-hidden="true" onclick="mohuSearch()"></span>
									</div>
								</div>
								<div class="survey-manage-list clearfix">
								
									<div class="survey-manage-table-warp">
										<table class="survey-manage-table">
											<tbody id="body">
											
										
												
												
												
											</tbody>
										</table>
									</div>




									<div class="mtc-pagination"  >
									
										<ul class="mtc-pagination-wrap">
											<!-- <li ng-class="prevPageDisabled()" class="disabled">
												<a class="pagination-nav-btn" href="http://mtc.baidu.com/survey/home/manageSurvey?from=header" ng-click="setPage(0)">&lt;&lt;</a>
											</li>
											<li ng-class="prevPageDisabled()" class="disabled">
												<a class="pagination-nav-btn" href="http://mtc.baidu.com/survey/home/manageSurvey?from=header" ng-click="prevPage()">&lt;</a>
											</li>
											ngRepeat: n in pages
											<li ng-repeat="n in pages" ng-class="{active: n == currentPage}" ng-click="setPage(n)" class="ng-scope active">
												<a href="http://mtc.baidu.com/survey/home/manageSurvey?from=header" ng-bind="1" class="ng-binding">1</a>
											</li>
											end ngRepeat: n in pages
											<li ng-class="nextPageDisabled()" class="disabled">
												<a class="pagination-nav-btn" href="http://mtc.baidu.com/survey/home/manageSurvey?from=header" ng-click="nextPage()">&gt;</a>
											</li>
											<li ng-class="nextPageDisabled()" class="disabled">
												<a class="pagination-nav-btn last-pagination-nav-btn" href="http://mtc.baidu.com/survey/home/manageSurvey?from=header" ng-click="setPage(pageCount()-1)">&gt;&gt;</a>
											</li> -->
											
										</ul>
										
										<div style="width: 300px; float:right;" id="footer"></div>
									</div> 
									
									
									
									
								</div>
							</div>
							<!-- ngIf: emptyList -->
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