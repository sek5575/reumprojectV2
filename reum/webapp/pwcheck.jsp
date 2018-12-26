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
	<%@ include file="/include/usersidebar.jsp" %>
	<!-- sidebar Include CSS END-->

				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
						<li class="active">패스워드 확인</li>
					</ul>
					<h3>패스워드 확인</h3>
					<hr class="soft" />

					<div class="row">
						<div class="span4">
							<div class="well">
								<form method="POST" action="/pwcheck" class="needs-validation">
								<input type="hidden" name="mode" value="${param.mode}">
									<div class="control-group">										
										<label class="control-label" for="userpw"><h5>비밀번호
												확인</h5></label> <input class="span3" type="Password" id="userpw"
											name="userpw" placeholder="비밀번호를 입력하세요">
									</div>
							
							<div class="controls">
								<button type="submit" class="btn btn-primary dropdown-toggle">비밀번호
									확인</button>
								<button type="submit" class="btn block">
									<a href="forgetpass.jsp">ID/PW찾기</a>
								</button>								
								<br>
								</div>
								</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		




	<!-- Footer Include CSS START-->
	<%@ include file="/include/footer.jsp"%>
	<!-- Footer Include CSS END-->




</body>
</html>