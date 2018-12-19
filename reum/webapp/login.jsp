<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<!-- Script Include CSS START-->
<%@ include file="/include/script.jsp"%>
<!-- Script Include CSS END-->

<head>

<!-- Header Include CSS START-->
<%@ include file="/include/header.jsp"%>
<!-- Header Include CSS END-->

</head>

<body>
	<div id="header">
		<div class="container">


			<!-- topbar Include CSS START-->
			<%@ include file="/include/topbar.jsp"%>
			<!-- topbar Include CSS END-->

			<!-- navbar Include CSS START-->
			<%@ include file="/include/navbar.jsp"%>
			<!-- navbar Include CSS END-->

		</div>
	</div>
	<div id="mainBody">
		<div class="container">
			<div class="row">

				<!-- sidebar Include CSS START-->
				<%@ include file="/include/sidebar.jsp"%>
				<!-- sidebar Include CSS END-->

				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
						<li class="active">Login</li>
					</ul>
					<h3>Login</h3>
					<hr class="soft" />

					<div class="row">
						<div class="span4">
							<div class="well">
								<form method="POST" action="/login" class="needs-validation" >
									<div class="control-group">
										<label class="control-label" for="inputEmail1"><h5>아이디</h5></label>
										<div class="controls">
											<input class="span3" type="text" id="userid" name="userid"
												placeholder="아이디를 입력하세요" value="aaa"><br> <label
												class="control-label" for="inputEmail1"><h5>비밀번호</h5></label>
											<input class="span3" type="Password" id="userpw" name="userpw"
												placeholder="비밀번호를 입력하세요" value="111">
										</div>
									</div>
									<div class="controls">
										<button  type="submit" class="btn btn-primary dropdown-toggle">로그인</button>								
									
										<button class="btn block">
											<a href="register.jsp">회원가입</a>
										</button>
										<button type="submit" class="btn block">
											<a href="forgetpass.jsp">ID/PW찾기</a>
										</button>
										<h5>회원이 아니라면 회원가입버튼을 눌러주세요!</h5>
										<br>
								</form>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>


	<!-- Footer Include CSS START-->
	<%@ include file="/include/footer.jsp"%>
	<!-- Footer Include CSS END-->


	<!-- MainBody End ============================= -->
</body>
</html>