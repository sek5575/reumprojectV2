<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>


$(document).ready(function(){	
	
	  $(".dropdown-item.has-icon.loginCheck").click(function(){
		  alert("회원만 이용가능합니다");
		  $(location).attr('href', "login.jsp");
		  
    });
});
</script>
<div id="welcomeLine" class="row">
	<div class="span6">
		<strong> ${sessionScope.SESS_NAME}</strong> 어서오세요 ~^^
	</div>
	<div class="span6">
		<div class="pull-right">
			<a href="protice.jsp"><span class="btn btn-mini">고객센터 </span></a> <a
				href="product_shoppingcart.jsp"><span
				class="btn btn-mini btn-primary"><i
					class="icon-shopping-cart icon-white"></i> 장바구니 </span> </a> <a>&nbsp</a>
			<ul class="nav pull-right">
				<li class="divider-vertical"></li>
				<li class="dropdown"><a href="#" class="btn btn-mini"
					data-toggle="dropdown"><i class="icon-user"></i>
						${sessionScope.SESS_NAME} <c:choose>
							<c:when test="${sessionScope.SESS_GUBUN == 'a'}">
		                		(관리자)
		                	</c:when>
							<c:when test="${sessionScope.SESS_GUBUN == 'u'}">
		                		(사용자)
		                	</c:when>
							<c:otherwise>
		                		(게스트) 
		                	</c:otherwise>
						</c:choose> <!-- 회원 구분 대신 등급을 사용할것 --> <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<c:choose>
							<c:when test="${sessionScope.SESS_GUBUN != null}">
								<li><a href="/login">Logout</a></li>
								<li class="divider"></li>
								<li><a href="product_summary.jsp"
									>마이페이지 홈</a></li>
								<li><a href="pwcheck.jsp"
									>회원정보변경</a></li>
								<li><a href="product_summary.jsp"
									>거래내역조회</a></li>
								<li><a href="product_latestproduct.jsp"
									>최근 본 상품</a></li>
								<li><a href=""
									>쪽지함<span
										class="badge badge-important">6</span></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="login.jsp">로그인</a></li>
								<li class="divider"></li>
								<li><a href="login.jsp"
									class="dropdown-item has-icon loginCheck">회원정보변경</a></li>
								<li><a href="product_latestproduct.jsp" 
									>최근 본 상품</a></li>
								<li><a href="login.jsp"
									class="dropdown-item has-icon loginCheck">거래내역조회</a></li>
								<li><a href="login.jsp"
									class="dropdown-item has-icon loginCheck">쪽지함<span
										class="badge badge-important">6</span></a></li>
							</c:otherwise>
						</c:choose>



					</ul></li>
			</ul>








		</div>
	</div>
</div>