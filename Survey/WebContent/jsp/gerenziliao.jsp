<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html lang="zh-CN">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>问卷星调查网 - 个人资料</title>
		<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css"  rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/profile.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/province_city_cascade.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/profile.js"></script>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.Jcrop.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ui.widget.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/load-image.all.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.iframe-transport.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.fileupload.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.fileupload-process.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.fileupload-image.js"></script>
		
		
		
		
		
		
		

	</head>

	<body>
		
		
		
	<script type="text/javascript">
		
		      
		$.ajax({
			url:"/Survey/main/queryUserMessage.shtml"   ,
			type:"post"   ,
			dataType:"json" ,
			data:{
					
			},
			success:function(data){
				
				$(".nk").html(data.userNickName);
				$("#front_user_nick").val(data.userNickName);
				$("#front_user_tel").val(data.userPhone)
				
				if(data.sex=="1"){
					$("#front_user_userProfile_sex_0").attr("checked","checked");
				}else{
					$("#front_user_userProfile_sex_1").attr("checked","checked");
				}
				
				$("#front_user_userProfile_birthday_year").val(data.year)
				$("#front_user_userProfile_birthday_month").val(data.month)
				$("#front_user_userProfile_birthday_day").val(data.day)
			/* 	$("#province").val(data.province); */
				
			/* 	var city=$("#tmp").find("option[value='"+data.city+"']").html();  */
				
			/* 	$("#city").html(data.city); */
				
				$("#front_user_userProfile_income").val(data.userSalary);
				$("#front_user_userProfile_profession").val(data.occupation);
				$("#front_user_userProfile_industry_code").val(data.industry);
				$("#front_user_userProfile_work_section_code").val(data.department);
				$("#front_user_userProfile_education").val(data.education);
				$("#front_user_userProfile_personalDes").val(data.signature);
				$("#front_user_userProfile_favMusic").val(data.likeMusic);
				$("#front_user_userProfile_monthlyWish").val(data.wish);
				
			}
		})
		
		
		 
		
		function baocun(){
			
			
			
		 var    userNickName=$("#front_user_nick").val();
		 var 	userPhone=$("#front_user_tel").val()
		 
		
		 var sex=$('input:radio[name="front_user[userProfile][sex]"]:checked').val();
		 
		 var 	year=$("#front_user_userProfile_birthday_year").val()
		 var 	month=$("#front_user_userProfile_birthday_month").val()
		 var 	day=$("#front_user_userProfile_birthday_day").val()
		/*  var 	province=$("#province").val();
		 var 	city=$("#city").val(); */
		 var 	userSalary=$("#front_user_userProfile_income").val();
		 var 	occupation=$("#front_user_userProfile_profession").val();
		 var 	industry=$("#front_user_userProfile_industry_code").val();
		 var 	department=$("#front_user_userProfile_work_section_code").val();
		 var 	education=$("#front_user_userProfile_education").val();
		 var 	signature=$("#front_user_userProfile_personalDes").val();
		 var 	likeMusic=$("#front_user_userProfile_favMusic").val();
		 var 	wish=$("#front_user_userProfile_monthlyWish").val();
			
			var allUser=new Array();
			var user=new Object();  
			 
			user.userNickName=userNickName;
			user.userPhone=userPhone;
			user.sex=sex;
			user.year=year;
			user.month=month;
			user.day=day;
			/* user.province=province;
			user.city=city; */
			user.userSalary=userSalary;
			user.occupation=occupation;
			user.industry=industry;
			user.department=department;
			user.education=education;
			user.signature=signature;
			user.likeMusic=likeMusic;
			user.wish=wish;
			allUser[0]=user;
			
			
			$.ajax({
				url:"/Survey/main/saveUserMessage.shtml"   ,
				type:"post"   ,
				dataType:"json" ,
				async: false ,
				data:{
					"allUser":JSON.stringify(allUser)	
				},
				success:function(data){
					
					location.href="/Survey/main/personalData.shtml";
					
				}
				
			})

			
			
		
			
		}
		
		
		
	
		
		
		
	</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<jsp:include page="header.jsp"></jsp:include>
		
		
		
		
		<div class="mainWrap container-full">
			<div class="container">
				<div class="main-personal clearfix">
					<div class="row">
						<div class="col-xs-12 col-sm-10 col-sm-offset-1">



							<div class="main-personal-left rp-personal-nav">
								<h1 class="pull-left hidden-xs hidden-sm">个人中心</h1>
								<ul class="rp-clearfix pull-right">
									<div class="row">
										<li class="active">
											<a href="${pageContext.request.contextPath}/main/personalData.shtml"><i class="fa fa-user" aria-hidden="true"></i>个人资料</a>
										</li>
										
										<li class="">
											<a href="${pageContext.request.contextPath}/main/surveyHistory.shtml"><i class="fa fa-clock-o" aria-hidden="true"></i>问卷历史</a>
										</li>
									
										<li class="">
											<a href="${pageContext.request.contextPath}/main/accountSet.shtml"><i class="fa fa-cog" aria-hidden="true"></i>账户设置</a>
										</li>
									</div>
								</ul>
							</div>
							
							
							
							
							<div class="main-personal-right rp-main-personal-right panel">
								<div class="main-personal-profile">
									<div class="profile-base">
										<h5>基本信息</h5>
										<hr>
										<div class="con clearfix row">
											
											
											<div class="face col-xs-12 col-sm-3 text-right">
												<div class="face-wapper">
													<img id="avatar" src="${pageContext.request.contextPath}/img/40" alt="头像" width="90" height="90">

													<form class="hidden-xs" action="#" method="post" enctype="multipart/form-data" id="uploadForm">
														<label class="set required" for="front_user_icon_icon">设置头像</label>
														<input type="file" id="profile_attachment" name="front_user_icon[icon]" required="required">
														<input type="hidden" id="x" name="front_user_icon[x]">
														<input type="hidden" id="y" name="front_user_icon[y]">
														<input type="hidden" id="w" name="front_user_icon[w]">
														<input type="hidden" id="h" name="front_user_icon[h]">
														<input type="hidden" id="front_user_icon__token" name="front_user_icon[_token]" value="40880849c7ebf26af628d1a7e9420bc9e609ec32">

														<p class="errorInfo"></p>
													</form>
												</div>
											</div>
											
											
											<ul class="form text col-xs-12 col-sm-9">
												<li class="nk">似雨☆若离</li>
												<li class="hide rp-phone">
													<label for="">昵称：</label>
													<span >似雨☆若离</span></li>
												<li>
													<label for="">登录账号：</label>
													<span></span>
												</li>
												<!--<li>
													<label for="">当前积分：</label>
													<span><strong id="points" name="points">15</strong></span>
												</li>-->
											</ul>
										</div>

										<div class="picCut">
											<div class="imageInfo left"></div>
											<div class="resDiv left">
												<div class="resImg">
													<p class="resizeimage"></p>
												</div>
												<div class="resizeSubmit">
													<input type="button" value="上传图片" name="resize" class="resBtn"><br>
													<input type="button" value="取消上传" name="cancel" class="cancelBtn">
												</div>
											</div>
										</div>
										
									</div>
									<hr>
									
									
									
									
									<div class="profile-detail">
										<h5>详细信息<small>&nbsp;&nbsp;您的个人信息将完全保密，请放心填写</small></h5>

										<form action="#" method="post" id="profileForm" name="profileForm">
											<ul class="con">
												<li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label for="front_user_nick" class="required">昵称：</label></div>
													<div class="col-xs-12 col-sm-9">
														<input type="text" id="front_user_nick" name="front_user[nick]" required="required" value="似雨☆若离">
														<div class="text-left"></div>
													</div>
												</li>

												<li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label for="front_user_tel" class="required">手机号码：</label></div>
													<div class="col-xs-12 col-sm-9">
														<input type="text" id="front_user_tel" name="front_user[tel]" required="required">
														<div class="text-left"></div>
													</div>
												</li>

												<li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label class="required">性别：</label></div>
													<div class="col-xs-12 col-sm-9">
														<span>
															<div id="front_user_userProfile_sex">
																<input type="radio" id="front_user_userProfile_sex_0" name="front_user[userProfile][sex]" required="required" value="1" checked="checked">
																	<label for="front_user_userProfile_sex_0" class="required">男</label>
																<input type="radio" id="front_user_userProfile_sex_1" name="front_user[userProfile][sex]" required="required" value="2">
																	<label for="front_user_userProfile_sex_1" class="required">女</label>
															</div>
														</span>
														<div class="text-left"></div>
													</div>
												</li>

												<li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label class="required">生日：</label></div>
													<div class="col-xs-12 col-sm-9">
														<div id="front_user_userProfile_birthday" class="laydate-icon">
															<select id="front_user_userProfile_birthday_year" name="front_user[userProfile][birthday][year]" required="required">
																<option value="">年</option>
																<option value="2011">2011</option>
																<option value="2010">2010</option>
																<option value="2009">2009</option>
																<option value="2008" selected="selected">2008</option>
																<option value="2007">2007</option>
																<option value="2006">2006</option>
																<option value="2005">2005</option>
																<option value="2004">2004</option>
																<option value="2003">2003</option>
																<option value="2002">2002</option>
																<option value="2001">2001</option>
																<option value="2000">2000</option>
																<option value="1999">1999</option>
																<option value="1998">1998</option>
																<option value="1997">1997</option>
																<option value="1996">1996</option>
																<option value="1995">1995</option>
																<option value="1994">1994</option>
																<option value="1993">1993</option>
																<option value="1992">1992</option>
																<option value="1991">1991</option>
																<option value="1990">1990</option>
																<option value="1989">1989</option>
																<option value="1988">1988</option>
																<option value="1987">1987</option>
																<option value="1986">1986</option>
																<option value="1985">1985</option>
																<option value="1984">1984</option>
																<option value="1983">1983</option>
																<option value="1982">1982</option>
																<option value="1981">1981</option>
																<option value="1980">1980</option>
																<option value="1979">1979</option>
																<option value="1978">1978</option>
																<option value="1977">1977</option>
																<option value="1976">1976</option>
																<option value="1975">1975</option>
																<option value="1974">1974</option>
																<option value="1973">1973</option>
																<option value="1972">1972</option>
																<option value="1971">1971</option>
																<option value="1970">1970</option>
																<option value="1969">1969</option>
																<option value="1968">1968</option>
																<option value="1967">1967</option>
																<option value="1966">1966</option>
																<option value="1965">1965</option>
																<option value="1964">1964</option>
																<option value="1963">1963</option>
																<option value="1962">1962</option>
																<option value="1961">1961</option>
																<option value="1960">1960</option>
																<option value="1959">1959</option>
																<option value="1958">1958</option>
																<option value="1957">1957</option>
																<option value="1956">1956</option>
																<option value="1955">1955</option>
																<option value="1954">1954</option>
																<option value="1953">1953</option>
																<option value="1952">1952</option>
																<option value="1951">1951</option>
																<option value="1950">1950</option>
																<option value="1949">1949</option>
																<option value="1948">1948</option>
																<option value="1947">1947</option>
																<option value="1946">1946</option>
																<option value="1945">1945</option>
																<option value="1944">1944</option>
																<option value="1943">1943</option>
																<option value="1942">1942</option>
																<option value="1941">1941</option>
																<option value="1940">1940</option>
																<option value="1939">1939</option>
																<option value="1938">1938</option>
																<option value="1937">1937</option>
																<option value="1936">1936</option>
																<option value="1935">1935</option>
																<option value="1934">1934</option>
																<option value="1933">1933</option>
																<option value="1932">1932</option>
																<option value="1931">1931</option>
																<option value="1930">1930</option>
																<option value="1929">1929</option>
																<option value="1928">1928</option>
																<option value="1927">1927</option>
																<option value="1926">1926</option>
																<option value="1925">1925</option>
																<option value="1924">1924</option>
																<option value="1923">1923</option>
																<option value="1922">1922</option>
																<option value="1921">1921</option>
																<option value="1920">1920</option>
																<option value="1919">1919</option>
																<option value="1918">1918</option>
																<option value="1917">1917</option>
																<option value="1916">1916</option>
															</select>/
															<select id="front_user_userProfile_birthday_month" name="front_user[userProfile][birthday][month]" required="required">
																<option value="">月</option>
																<option value="1">01</option>
																<option value="2">02</option>
																<option value="3">03</option>
																<option value="4">04</option>
																<option value="5">05</option>
																<option value="6">06</option>
																<option value="7">07</option>
																<option value="8">08</option>
																<option value="9" selected="selected">09</option>
																<option value="10">10</option>
																<option value="11">11</option>
																<option value="12">12</option>
															</select>/
															<select id="front_user_userProfile_birthday_day" name="front_user[userProfile][birthday][day]" required="required">
																<option value="">日</option>
																<option value="1">01</option>
																<option value="2">02</option>
																<option value="3">03</option>
																<option value="4">04</option>
																<option value="5">05</option>
																<option value="6">06</option>
																<option value="7">07</option>
																<option value="8">08</option>
																<option value="9">09</option>
																<option value="10">10</option>
																<option value="11">11</option>
																<option value="12">12</option>
																<option value="13" selected="selected">13</option>
																<option value="14">14</option>
																<option value="15">15</option>
																<option value="16">16</option>
																<option value="17">17</option>
																<option value="18">18</option>
																<option value="19">19</option>
																<option value="20">20</option>
																<option value="21">21</option>
																<option value="22">22</option>
																<option value="23">23</option>
																<option value="24">24</option>
																<option value="25">25</option>
																<option value="26">26</option>
																<option value="27">27</option>
																<option value="28">28</option>
																<option value="29">29</option>
																<option value="30">30</option>
																<option value="31">31</option>
															</select>
														</div>
														<div class="text-left"></div>
													</div>
												</li>

												<!-- <li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label>居住地：</label></div>
													<div class="col-xs-12 col-sm-9">
													<div class="regProvince">
														<select id="province"
															name="front_user[userProfile][province]">
															<option value="">省</option>
															<option value="1">直辖市</option>
															<option value="2">河北省</option>
															<option value="3">山西省</option>
															<option value="4">内蒙古自治区</option>
															<option value="5">辽宁省</option>
															<option value="6">吉林省</option>
															<option value="7">黑龙江省</option>
															<option value="8" selected="selected">江苏省</option>
															<option value="9">浙江省</option>
															<option value="10">安徽省</option>
															<option value="11">福建省</option>
															<option value="12">江西省</option>
															<option value="13">山东省</option>
															<option value="14">河南省</option>
															<option value="15">湖北省</option>
															<option value="16">湖南省</option>
															<option value="17">广东省</option>
															<option value="18">广西壮族自治区</option>
															<option value="19">海南省</option>
															<option value="20">四川省</option>
															<option value="21">贵州省</option>
															<option value="22">云南省</option>
															<option value="23">西藏自治区</option>
															<option value="24">陕西省</option>
															<option value="25">甘肃省</option>
															<option value="26">青海省</option>
															<option value="27">宁夏回族自治区</option>
															<option value="28">新疆维吾尔自治区</option>
															<option value="29">香港特别行政区</option>
															<option value="30">澳门特别行政区</option>
															<option value="31">台湾省</option>
															<option value="32">其他</option>
														</select>
													</div>

													<div class="regCity">
														<select id="city" name="front_user[userProfile][city]">

															<option data-province="8" value="75">南京市</option>
															<option data-province="8" value="76" selected="selected">无锡市</option>
															<option data-province="8" value="77">徐州市</option>
															<option data-province="8" value="78">常州市</option>
															<option data-province="8" value="79">苏州市</option>
															<option data-province="8" value="80">南通市</option>
															<option data-province="8" value="81">连云港市</option>
															<option data-province="8" value="82">淮安市</option>
															<option data-province="8" value="83">盐城市</option>
															<option data-province="8" value="84">扬州市</option>
															<option data-province="8" value="85">镇江市</option>
															<option data-province="8" value="86">泰州市</option>
															<option data-province="8" value="87">宿迁市</option>

														</select>
													</div>

													<span id="tmp" style="display: none; position: absolute;">
													    <option data-province="" value="">市</option>
														<option data-province="1" value="2">上海市</option>
														<option data-province="1" value="1">北京市</option>
														<option data-province="1" value="3">天津市</option>
														<option data-province="1" value="4">重庆市</option>
														<option data-province="2" value="15">衡水市</option>
														<option data-province="2" value="5">石家庄市</option>
														<option data-province="2" value="6">唐山市</option>
														<option data-province="2" value="7">秦皇岛市</option>
														<option data-province="2" value="8">邯郸市</option>
														<option data-province="2" value="9">邢台市</option>
														<option data-province="2" value="10">保定市</option>
														<option data-province="2" value="11">张家口市</option>
														<option data-province="2" value="12">承德市</option>
														<option data-province="2" value="13">沧州市</option>
														<option data-province="2" value="14">廊坊市</option>
														<option data-province="3" value="16">太原市</option>
														<option data-province="3" value="17">大同市</option>
														<option data-province="3" value="18">阳泉市</option>
														<option data-province="3" value="19">长治市</option>
														<option data-province="3" value="20">晋城市</option>
														<option data-province="3" value="21">朔州市</option>
														<option data-province="3" value="22">晋中市</option>
														<option data-province="3" value="23">运城市</option>
														<option data-province="3" value="24">忻州市</option>
														<option data-province="3" value="25">临汾市</option>
														<option data-province="3" value="26">吕梁市</option>
														<option data-province="4" value="27">呼和浩特市</option>
														<option data-province="4" value="28">包头市</option>
														<option data-province="4" value="29">乌海市</option>
														<option data-province="4" value="30">赤峰市</option>
														<option data-province="4" value="31">通辽市</option>
														<option data-province="4" value="32">鄂尔多斯市</option>
														<option data-province="4" value="33">呼伦贝尔市</option>
														<option data-province="4" value="35">乌兰察布市</option>
														<option data-province="4" value="36">兴安盟</option>
														<option data-province="4" value="37">锡林郭勒盟</option>
														<option data-province="4" value="38">阿拉善盟</option>
														<option data-province="5" value="39">沈阳市</option>
														<option data-province="5" value="40">大连市</option>
														<option data-province="5" value="41">鞍山市</option>
														<option data-province="5" value="42">抚顺市</option>
														<option data-province="5" value="43">本溪市</option>
														<option data-province="5" value="44">丹东市</option>
														<option data-province="5" value="45">锦州市</option>
														<option data-province="5" value="46">营口市</option>
														<option data-province="5" value="47">阜新市</option>
														<option data-province="5" value="48">辽阳市</option>
														<option data-province="5" value="49">盘锦市</option>
														<option data-province="5" value="50">铁岭市</option>
														<option data-province="5" value="51">朝阳市</option>
														<option data-province="5" value="52">葫芦岛市</option>
														<option data-province="6" value="53">长春市</option>
														<option data-province="6" value="54">吉林市</option>
														<option data-province="6" value="55">四平市</option>
														<option data-province="6" value="56">辽源市</option>
														<option data-province="6" value="57">通化市</option>
														<option data-province="6" value="58">白山市</option>
														<option data-province="6" value="59">松原市</option>
														<option data-province="6" value="60">白城市</option>
														<option data-province="6" value="61">延边朝鲜族自治州</option>
														<option data-province="7" value="62">哈尔滨市</option>
														<option data-province="7" value="63">齐齐哈尔市</option>
														<option data-province="7" value="64">鸡西市</option>
														<option data-province="7" value="65">鹤岗市</option>
														<option data-province="7" value="66">双鸭山市</option>
														<option data-province="7" value="67">大庆市</option>
														<option data-province="7" value="68">伊春市</option>
														<option data-province="7" value="69">佳木斯市</option>
														<option data-province="7" value="70">七台河市</option>
														<option data-province="7" value="71">牡丹江市</option>
														<option data-province="7" value="72">黑河市</option>
														<option data-province="7" value="73">绥化市</option>
														<option data-province="7" value="74">大兴安岭地区</option>
														<option data-province="9" value="88">杭州市</option>
														<option data-province="9" value="89">宁波市</option>
														<option data-province="9" value="90">温州市</option>
														<option data-province="9" value="91">嘉兴市</option>
														<option data-province="9" value="92">湖州市</option>
														<option data-province="9" value="93">绍兴市</option>
														<option data-province="9" value="94">金华市</option>
														<option data-province="9" value="95">衢州市</option>
														<option data-province="9" value="96">舟山市</option>
														<option data-province="9" value="97">台州市</option>
														<option data-province="9" value="98">丽水市</option>
														<option data-province="10" value="99">合肥市</option>
														<option data-province="10" value="100">芜湖市</option>
														<option data-province="10" value="101">蚌埠市</option>
														<option data-province="10" value="102">淮南市</option>
														<option data-province="10" value="103">马鞍山市</option>
														<option data-province="10" value="104">淮北市</option>
														<option data-province="10" value="105">铜陵市</option>
														<option data-province="10" value="106">安庆市</option>
														<option data-province="10" value="107">黄山市</option>
														<option data-province="10" value="108">滁州市</option>
														<option data-province="10" value="109">阜阳市</option>
														<option data-province="10" value="110">宿州市</option>
														<option data-province="10" value="111">巢湖市</option>
														<option data-province="10" value="112">六安市</option>
														<option data-province="10" value="113">亳州市</option>
														<option data-province="10" value="114">池州市</option>
														<option data-province="10" value="115">宣城市</option>
														<option data-province="11" value="116">福州市</option>
														<option data-province="11" value="117">厦门市</option>
														<option data-province="11" value="118">莆田市</option>
														<option data-province="11" value="119">三明市</option>
														<option data-province="11" value="120">泉州市</option>
														<option data-province="11" value="121">漳州市</option>
														<option data-province="11" value="122">南平市</option>
														<option data-province="11" value="123">龙岩市</option>
														<option data-province="11" value="124">宁德市</option>
														<option data-province="12" value="125">南昌市</option>
														<option data-province="12" value="126">景德镇市</option>
														<option data-province="12" value="127">萍乡市</option>
														<option data-province="12" value="128">九江市</option>
														<option data-province="12" value="129">新余市</option>
														<option data-province="12" value="130">鹰潭市</option>
														<option data-province="12" value="131">赣州市</option>
														<option data-province="12" value="132">吉安市</option>
														<option data-province="12" value="133">宜春市</option>
														<option data-province="12" value="134">抚州市</option>
														<option data-province="12" value="135">上饶市</option>
														<option data-province="13" value="136">济南市</option>
														<option data-province="13" value="137">青岛市</option>
														<option data-province="13" value="138">淄博市</option>
														<option data-province="13" value="139">枣庄市</option>
														<option data-province="13" value="140">东营市</option>
														<option data-province="13" value="141">烟台市</option>
														<option data-province="13" value="142">潍坊市</option>
														<option data-province="13" value="143">济宁市</option>
														<option data-province="13" value="144">泰安市</option>
														<option data-province="13" value="145">威海市</option>
														<option data-province="13" value="146">日照市</option>
														<option data-province="13" value="147">莱芜市</option>
														<option data-province="13" value="148">临沂市</option>
														<option data-province="13" value="149">德州市</option>
														<option data-province="13" value="150">聊城市</option>
														<option data-province="13" value="151">滨州市</option>
														<option data-province="13" value="152">菏泽市</option>
														<option data-province="14" value="153">郑州市</option>
														<option data-province="14" value="154">开封市</option>
														<option data-province="14" value="155">洛阳市</option>
														<option data-province="14" value="156">平顶山市</option>
														<option data-province="14" value="157">安阳市</option>
														<option data-province="14" value="158">鹤壁市</option>
														<option data-province="14" value="159">新乡市</option>
														<option data-province="14" value="160">焦作市</option>
														<option data-province="14" value="161">濮阳市</option>
														<option data-province="14" value="162">许昌市</option>
														<option data-province="14" value="163">漯河市</option>
														<option data-province="14" value="164">三门峡市</option>
														<option data-province="14" value="165">南阳市</option>
														<option data-province="14" value="166">商丘市</option>
														<option data-province="14" value="167">信阳市</option>
														<option data-province="14" value="168">周口市</option>
														<option data-province="14" value="169">驻马店市</option>
														<option data-province="15" value="170">武汉市</option>
														<option data-province="15" value="171">黄石市</option>
														<option data-province="15" value="172">十堰市</option>
														<option data-province="15" value="173">宜昌市</option>
														<option data-province="15" value="174">襄阳市</option>
														<option data-province="15" value="175">鄂州市</option>
														<option data-province="15" value="176">荆门市</option>
														<option data-province="15" value="177">孝感市</option>
														<option data-province="15" value="178">荆州市</option>
														<option data-province="15" value="179">黄冈市</option>
														<option data-province="15" value="180">咸宁市</option>
														<option data-province="15" value="181">随州市</option>
														<option data-province="15" value="182">恩施土家族苗族自治州</option>
														<option data-province="15" value="183">其他省直辖行政单位</option>
														<option data-province="16" value="184">长沙市</option>
														<option data-province="16" value="185">株洲市</option>
														<option data-province="16" value="186">湘潭市</option>
														<option data-province="16" value="187">衡阳市</option>
														<option data-province="16" value="188">邵阳市</option>
														<option data-province="16" value="189">岳阳市</option>
														<option data-province="16" value="190">常德市</option>
														<option data-province="16" value="191">张家界市</option>
														<option data-province="16" value="192">益阳市</option>
														<option data-province="16" value="193">郴州市</option>
														<option data-province="16" value="194">永州市</option>
														<option data-province="16" value="195">怀化市</option>
														<option data-province="16" value="196">娄底市</option>
														<option data-province="16" value="197">湘西土家族苗族自治州</option>
														<option data-province="17" value="198">广州市</option>
														<option data-province="17" value="199">韶关市</option>
														<option data-province="17" value="200">深圳市</option>
														<option data-province="17" value="201">珠海市</option>
														<option data-province="17" value="202">汕头市</option>
														<option data-province="17" value="203">佛山市</option>
														<option data-province="17" value="204">江门市</option>
														<option data-province="17" value="205">湛江市</option>
														<option data-province="17" value="206">茂名市</option>
														<option data-province="17" value="207">肇庆市</option>
														<option data-province="17" value="208">惠州市</option>
														<option data-province="17" value="209">梅州市</option>
														<option data-province="17" value="210">汕尾市</option>
														<option data-province="17" value="211">河源市</option>
														<option data-province="17" value="212">阳江市</option>
														<option data-province="17" value="213">清远市</option>
														<option data-province="17" value="214">东莞市</option>
														<option data-province="17" value="215">中山市</option>
														<option data-province="17" value="216">潮州市</option>
														<option data-province="17" value="217">揭阳市</option>
														<option data-province="17" value="218">云浮市</option>
														<option data-province="18" value="219">南宁市</option>
														<option data-province="18" value="220">柳州市</option>
														<option data-province="18" value="221">桂林市</option>
														<option data-province="18" value="222">梧州市</option>
														<option data-province="18" value="223">北海市</option>
														<option data-province="18" value="224">防城港市</option>
														<option data-province="18" value="225">钦州市</option>
														<option data-province="18" value="226">贵港市</option>
														<option data-province="18" value="227">玉林市</option>
														<option data-province="18" value="228">百色市</option>
														<option data-province="18" value="229">贺州市</option>
														<option data-province="18" value="230">河池市</option>
														<option data-province="18" value="231">来宾市</option>
														<option data-province="18" value="232">崇左市</option>
														<option data-province="19" value="233">海口市</option>
														<option data-province="19" value="234">三亚市</option>
														<option data-province="19" value="235">其他省直辖县级行政单位</option>
														<option data-province="20" value="236">成都市</option>
														<option data-province="20" value="237">自贡市</option>
														<option data-province="20" value="238">攀枝花市</option>
														<option data-province="20" value="239">泸州市</option>
														<option data-province="20" value="240">德阳市</option>
														<option data-province="20" value="241">绵阳市</option>
														<option data-province="20" value="242">广元市</option>
														<option data-province="20" value="243">遂宁市</option>
														<option data-province="20" value="244">内江市</option>
														<option data-province="20" value="245">乐山市</option>
														<option data-province="20" value="246">南充市</option>
														<option data-province="20" value="247">眉山市</option>
														<option data-province="20" value="248">宜宾市</option>
														<option data-province="20" value="249">广安市</option>
														<option data-province="20" value="250">达州市</option>
														<option data-province="20" value="251">雅安市</option>
														<option data-province="20" value="252">巴中市</option>
														<option data-province="20" value="253">资阳市</option>
														<option data-province="20" value="254">阿坝藏族羌族自治州</option>
														<option data-province="20" value="255">甘孜藏族自治州</option>
														<option data-province="20" value="256">凉山彝族自治州</option>
														<option data-province="21" value="257">贵阳市</option>
														<option data-province="21" value="258">六盘水市</option>
														<option data-province="21" value="259">遵义市</option>
														<option data-province="21" value="260">安顺市</option>
														<option data-province="21" value="261">铜仁地区</option>
														<option data-province="21" value="262">黔西南布依族苗族自治州</option>
														<option data-province="21" value="263">毕节地区</option>
														<option data-province="21" value="264">黔东南苗族侗族自治州</option>
														<option data-province="21" value="265">黔南布依族苗族自治州</option>
														<option data-province="22" value="266">昆明市</option>
														<option data-province="22" value="267">曲靖市</option>
														<option data-province="22" value="268">玉溪市</option>
														<option data-province="22" value="269">保山市</option>
														<option data-province="22" value="270">昭通市</option>
														<option data-province="22" value="271">丽江市</option>
														<option data-province="22" value="272">思茅市</option>
														<option data-province="22" value="273">临沧市</option>
														<option data-province="22" value="274">楚雄彝族自治州</option>
														<option data-province="22" value="275">红河哈尼族彝族自治州</option>
														<option data-province="22" value="276">文山壮族苗族自治州</option>
														<option data-province="22" value="277">西双版纳傣族自治州</option>
														<option data-province="22" value="278">大理白族自治州</option>
														<option data-province="22" value="279">德宏傣族景颇族自治州</option>
														<option data-province="22" value="280">怒江傈僳族自治州</option>
														<option data-province="22" value="281">迪庆藏族自治州</option>
														<option data-province="23" value="282">拉萨市</option>
														<option data-province="23" value="283">昌都地区</option>
														<option data-province="23" value="284">山南地区</option>
														<option data-province="23" value="285">日喀则地区</option>
														<option data-province="23" value="286">那曲地区</option>
														<option data-province="23" value="287">阿里地区</option>
														<option data-province="23" value="288">林芝地区</option>
														<option data-province="24" value="289">西安市</option>
														<option data-province="24" value="290">铜川市</option>
														<option data-province="24" value="291">宝鸡市</option>
														<option data-province="24" value="292">咸阳市</option>
														<option data-province="24" value="293">渭南市</option>
														<option data-province="24" value="294">延安市</option>
														<option data-province="24" value="295">汉中市</option>
														<option data-province="24" value="296">榆林市</option>
														<option data-province="24" value="297">安康市</option>
														<option data-province="24" value="298">商洛市</option>
														<option data-province="25" value="299">兰州市</option>
														<option data-province="25" value="300">嘉峪关市</option>
														<option data-province="25" value="301">金昌市</option>
														<option data-province="25" value="302">白银市</option>
														<option data-province="25" value="303">天水市</option>
														<option data-province="25" value="304">武威市</option>
														<option data-province="25" value="305">张掖市</option>
														<option data-province="25" value="306">平凉市</option>
														<option data-province="25" value="307">酒泉市</option>
														<option data-province="25" value="308">庆阳市</option>
														<option data-province="25" value="309">定西市</option>
														<option data-province="25" value="310">陇南市</option>
														<option data-province="25" value="311">临夏回族自治州</option>
														<option data-province="25" value="312">甘南藏族自治州</option>
														<option data-province="26" value="313">西宁市</option>
														<option data-province="26" value="314">海东地区</option>
														<option data-province="26" value="315">海北藏族自治州</option>
														<option data-province="26" value="316">黄南藏族自治州</option>
														<option data-province="26" value="317">海南藏族自治州</option>
														<option data-province="26" value="318">果洛藏族自治州</option>
														<option data-province="26" value="319">玉树藏族自治州</option>
														<option data-province="26" value="320">海西蒙古族藏族自治州</option>
														<option data-province="27" value="321">银川市</option>
														<option data-province="27" value="322">石嘴山市</option>
														<option data-province="27" value="323">吴忠市</option>
														<option data-province="27" value="324">固原市</option>
														<option data-province="27" value="325">中卫市</option>
														<option data-province="28" value="326">乌鲁木齐市</option>
														<option data-province="28" value="327">克拉玛依市</option>
														<option data-province="28" value="328">吐鲁番地区</option>
														<option data-province="28" value="329">哈密地区</option>
														<option data-province="28" value="330">昌吉回族自治州</option>
														<option data-province="28" value="331">博尔塔拉蒙古自治州</option>
														<option data-province="28" value="332">巴音郭楞蒙古自治州</option>
														<option data-province="28" value="333">阿克苏地区</option>
														<option data-province="28" value="334">克孜勒苏柯尔克孜自治州</option>
														<option data-province="28" value="335">喀什地区</option>
														<option data-province="28" value="336">和田地区</option>
														<option data-province="28" value="337">伊犁哈萨克自治州</option>
														<option data-province="28" value="338">塔城地区</option>
														<option data-province="28" value="339">阿勒泰地区</option>
														<option data-province="28" value="340">其他省直辖行政单位</option>
														<option data-province="4" value="34">巴彦淖尔市</option>
														<option data-province="29" value="341">香港</option>
														<option data-province="30" value="342">澳门</option>
														<option data-province="31" value="343">台北市</option>
														<option data-province="31" value="344">高雄市</option>
														<option data-province="31" value="345">基隆市</option>
														<option data-province="31" value="346">台中市</option>
														<option data-province="31" value="347">台南市</option>
														<option data-province="31" value="348">新竹市</option>
														<option data-province="31" value="349">嘉义市</option>
														<option data-province="31" value="350">县</option>
														<option data-province="32" value="351">其他</option></span>
												</div>

											</li> -->

												<li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label for="front_user_userProfile_income">月收入：</label></div>
													<div class="col-xs-12 col-sm-9">
														<select id="front_user_userProfile_income" name="front_user[userProfile][income]">
															<option value="">请选择收入</option>
															<option value="100">1000元以下</option>
															<option value="101">1000-1999元</option>
															<option value="102">2000-2999元</option>
															<option value="103">3000-3999元</option>
															<option value="104">4000-4999元</option>
															<option value="105">5000-5999元</option>
															<option value="106">6000-6999元</option>
															<option value="107">7000-7999元</option>
															<option value="108">8000-8999元</option>
															<option value="109">9000-9999元</option>
															<option value="110">10000-11999元</option>
															<option value="111">12000-13999元</option>
															<option value="112">14000-15999元</option>
															<option value="113">16000-17999元</option>
															<option value="114">18000-19999元</option>
															<option value="115">20000-23999元</option>
															<option value="116">24000-27999元</option>
															<option value="117">28000-31999元</option>
															<option value="118">32000-35999元</option>
															<option value="119">36000元以上</option>
														</select>
													</div>
												</li>

												<li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label for="front_user_userProfile_profession">职业：</label></div>
													<div class="pronCon col-xs-12 col-sm-9">
														<select id="front_user_userProfile_profession" name="front_user[userProfile][profession]">
															<option value="">请选择职业</option>
															<option value="1">公务员</option>
															<option value="2">经营管理者</option>
															<option value="3">公司职员（一般事务）</option>
															<option value="4">公司职员（技术人员）</option>
															<option value="5">公司职员（律师，医生等专业人士）</option>
															<option value="6">公司职员（其他）</option>
															<option value="7">军人</option>
															<option value="8">个体户</option>
															<option value="9">家庭主妇</option>
															<option value="10">打工者</option>
															<option value="11">学生</option>
															<option value="12">待业</option>
															<option value="99">其他</option>
														</select>
														<select id="front_user_userProfile_industry_code" name="front_user[userProfile][industry_code]">
															<option value="">请选择行业</option>
															<option value="1">农业/水产</option>
															<option value="2">金融（银行/证券/保险）</option>
															<option value="3">计算机/IT/数据输入</option>
															<option value="4">电子技术/半导体/集成电路</option>
															<option value="5">会计/审计</option>
															<option value="6">贸易/进出口</option>
															<option value="7">房地产</option>
															<option value="8">印刷/出版</option>
															<option value="9">咨询</option>
															<option value="10">人力资源</option>
															<option value="11">美容</option>
															<option value="12">娱乐/休闲/体育</option>
															<option value="13">建筑业</option>
															<option value="14">教育</option>
															<option value="15">工业</option>
															<option value="16">政府机关</option>
															<option value="17">医疗/保健</option>
															<option value="18">法律</option>
															<option value="19">制造业</option>
															<option value="20">销售/市场</option>
															<option value="21">媒体/广告/互联网</option>
															<option value="22">制药</option>
															<option value="23">批发/零售</option>
															<option value="24">供电/供水/煤气/供热</option>
															<option value="25">保安</option>
															<option value="26">电话/通信</option>
															<option value="27">运输/物流</option>
															<option value="28">采掘/矿产</option>
															<option value="29">酒店/旅游代理</option>
															<option value="30">餐饮服务</option>
															<option value="99">其他</option>
														</select>
														<select id="front_user_userProfile_work_section_code" name="front_user[userProfile][work_section_code]" required="required">
															<option value="" selected="selected">请选择部门</option>
															<option value="1">总务/人事/管理</option>
															<option value="2">会计/财务</option>
															<option value="3">销售</option>
															<option value="4">公关/宣传</option>
															<option value="5">调研/市场</option>
															<option value="6">规划</option>
															<option value="7">设计</option>
															<option value="8">信息系统管理</option>
															<option value="9">IT开发</option>
															<option value="10">技术开发</option>
															<option value="11">生产/制造</option>
															<option value="12">劳务保障</option>
															<option value="13">客户服务</option>
															<option value="14">经营</option>
															<option value="15">法律</option>
															<option value="16">医疗</option>
															<option value="99">其他</option>
														</select>
													</div>
												</li>

												<li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label for="front_user_userProfile_education" class="required">教育程度：</label></div>
													<div class="col-xs-12 col-sm-9">
														<select id="front_user_userProfile_education" name="front_user[userProfile][education]" required="required">
															<option value="" selected="selected">请选择</option>
															<option value="1">高中以下</option>
															<option value="2">高中毕业</option>
															<option value="3">大专毕业</option>
															<option value="4">大学本科毕业</option>
															<option value="5">研究生，博士毕业</option>
														</select>
													</div>
												</li>

												<!-- <li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label class="required">兴趣爱好：</label></div>
													<div class="col-xs-12 col-sm-9">
														<div id="front_user_userProfile_hobby">
															<input type="checkbox" id="front_user_userProfile_hobby_0" name="front_user[userProfile][hobby][]" value="1">
																<label for="front_user_userProfile_hobby_0">上网</label>
															<input type="checkbox" id="front_user_userProfile_hobby_1" name="front_user[userProfile][hobby][]" value="2">
																<label for="front_user_userProfile_hobby_1">音乐</label>
															<input type="checkbox" id="front_user_userProfile_hobby_2" name="front_user[userProfile][hobby][]" value="3">
																<label for="front_user_userProfile_hobby_2">旅游</label>
															<input type="checkbox" id="front_user_userProfile_hobby_3" name="front_user[userProfile][hobby][]" value="4">
																<label for="front_user_userProfile_hobby_3">购物</label>
															<input type="checkbox" id="front_user_userProfile_hobby_4" name="front_user[userProfile][hobby][]" value="5">
																<label for="front_user_userProfile_hobby_4">运动</label>
															<input type="checkbox" id="front_user_userProfile_hobby_5" name="front_user[userProfile][hobby][]" value="6">
																<label for="front_user_userProfile_hobby_5">看书</label>
															<input type="checkbox" id="front_user_userProfile_hobby_6" name="front_user[userProfile][hobby][]" value="7">
																<label for="front_user_userProfile_hobby_6">游戏</label>
															<input type="checkbox" id="front_user_userProfile_hobby_7" name="front_user[userProfile][hobby][]" value="8">
																<label for="front_user_userProfile_hobby_7">娱乐</label>
															<input type="checkbox" id="front_user_userProfile_hobby_8" name="front_user[userProfile][hobby][]" value="9">
																<label for="front_user_userProfile_hobby_8">影视</label>
															<input type="checkbox" id="front_user_userProfile_hobby_9" name="front_user[userProfile][hobby][]" value="10">
																<label for="front_user_userProfile_hobby_9">动漫</label>
															<input type="checkbox" id="front_user_userProfile_hobby_10" name="front_user[userProfile][hobby][]" value="11">
																<label for="front_user_userProfile_hobby_10">时尚</label>
															<input type="checkbox" id="front_user_userProfile_hobby_11" name="front_user[userProfile][hobby][]" value="12">
																<label for="front_user_userProfile_hobby_11">艺术</label>
														</div>
													</div>
												</li> -->

												<li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label for="front_user_userProfile_personalDes">个性签名：</label></div>
													<div class="col-xs-12 col-sm-9">
														<textarea id="front_user_userProfile_personalDes" name="front_user[userProfile][personalDes]" rows="6" cols="50"></textarea>

													</div>
												</li>

												<li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label for="front_user_userProfile_favMusic">喜欢的音乐：</label></div>
													<div class="col-xs-12 col-sm-9">
														<input type="text" id="front_user_userProfile_favMusic" name="front_user[userProfile][favMusic]">
														<div class="text-left"></div>
													</div>
												</li>

												<li class="row">
													<div class="col-xs-12 col-sm-3 text-right"><label for="front_user_userProfile_monthlyWish">本月心愿：</label></div>
													<div class="col-xs-12 col-sm-9">
														<input type="text" id="front_user_userProfile_monthlyWish" name="front_user[userProfile][monthlyWish]">
														<div class="text-left"></div>
													</div>
												</li>
												<li class="row">
													<div class="col-xs-12 col-sm-3"></div>
													<div class="col-xs-12 col-sm-9">
														<input type="hidden" id="front_user__token" name="front_user[_token]" value="ecc0c145f286e82dba244b5cc6427ad69ae2ed5a">

														<div class="btn"><span id="profile_save" onclick="baocun()">保存</span></div>
													</div>
												</li>
											</ul>
										</form>
									</div>
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