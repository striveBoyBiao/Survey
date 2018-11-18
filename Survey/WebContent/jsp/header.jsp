<%@page import="java.lang.annotation.Target"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


 

<nav id="top-header" class="navbar-default" role="navigation" style="background-color:#CCC">
			<div class="container header-nav-con clearfix">
				<div class="row">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed hidden-sm hidden-md hidden-lg" data-toggle="collapse" data-target="#navbar-ex1-collapse">
              <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> 
            </button>
						<a href="#" title="问卷星调查网logo">

							<img class="logo img-responsive" src="${pageContext.request.contextPath}/img/logo.gif" alt="问卷星调查网logo">

						</a>
						<p class="navTit hidden-sm hidden-md hidden-lg">
							首页
						</p>
						<i class="fa fa-user-o" aria-hidden="true"></i>

					</div>
					<div class="collapse navbar-collapse" id="navbar-ex1-collapse">
						<ul class="nav navbar-nav navbar-right">
						
						
							<li class="nav-item"><i class="fa fa-home hidden-sm hidden-md hidden-lg" aria-hidden="true"></i>
								<a href="${pageContext.request.contextPath}/main/main.shtml" title="首页" class="nav-link " id="sy" >首页</a><i class="fa fa-chevron-right pull-right hidden-sm hidden-md hidden-lg" aria-hidden="true"></i></li>
							<hr class="hidden-sm hidden-md hidden-lg">

							<li class="nav-item">
								<i class="fa fa-file-text-o hidden-sm hidden-md hidden-lg" aria-hidden="true"></i>
								<a href="${pageContext.request.contextPath}/main/surveyList.shtml" title="问卷列表" class="nav-link"  id="wj" >问卷列表</a>
								<i class="fa fa-chevron-right pull-right hidden-sm hidden-md hidden-lg" aria-hidden="true"></i>
							</li>
							<hr class="hidden-sm hidden-md hidden-lg">

							<li class="nav-item"><i class="fa fa-list hidden-sm hidden-md hidden-lg" aria-hidden="true"></i>
								<a href="${pageContext.request.contextPath}/main/quickResponse.shtml" title="快速问答" class="nav-link" id="ks" >快速问答</a><i class="fa fa-chevron-right pull-right hidden-sm hidden-md hidden-lg" aria-hidden="true"></i></li>

							<hr class="hidden-sm hidden-md hidden-lg">
                        
                      <c:if test="${sessionScope.user==null}">
                         <script>
                            location.href="/Survey/entry.shtml";
                        </script>
                      </c:if> 
          
                        
                            
                      <c:if test='${sessionScope.user.userType=="管理员"}'> 
                        
							<li class="nav-item"><i class="fa fa-question hidden-sm hidden-md hidden-lg" aria-hidden="true"></i>
								<a href="${pageContext.request.contextPath}/main/console.shtml" title="管理控制台" class="nav-link" id="gl" >管理控制台</a><i class="fa fa-chevron-right pull-right hidden-sm hidden-md hidden-lg" aria-hidden="true"></i></li>
							<hr class="hidden-sm hidden-md hidden-lg">
                      </c:if> 


							<li class="nav-item hidden-sm hidden-md hidden-lg"><i class="fa fa-user hidden-sm hidden-md hidden-lg" aria-hidden="true"></i>
								<a href="#" title="个人中心" class="nav-link" >个人中心</a><i class="fa fa-chevron-right pull-right hidden-sm hidden-md hidden-lg" aria-hidden="true"></i></li>
							<hr class="hidden-sm hidden-md hidden-lg">

							<li class="dropdown nav-item hidden-xs">
								<i class="fa fa-user-o" aria-hidden="true">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"></a></i>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心<span class="caret hidden-xs hidden-sm"></span></a>
								<ul class="dropdown-menu" >
									<li>
										<a href="${pageContext.request.contextPath}/main/personalData.shtml" >个人资料</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/main/accountSet.shtml" >账户设置</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/main/surveyHistory.shtml" >问卷历史</a>
									</li>

									<li>
										<a href="${pageContext.request.contextPath}/entry.shtml" class="exit" >退出</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
		
</html>