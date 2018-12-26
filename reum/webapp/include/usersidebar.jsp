<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page import="java.net.URLDecoder"%>
	<div id="sidebar" class="span3">
	
		<div class="well well-small"><a id="myCart" href="product_summary.jsp"><h4 style = "text-align:center;">마이페이지</h4> </a></div>
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
				
		<div class="accordion-group">
	  <div class="accordion-heading">
		<h4 style = "text-align:center;"><a class="accordion-toggle collapsed" data-parent="#accordion2" href="pwcheck.jsp">
		 개인정보수정</a></h4>
	  </div>
	</div>		
	
	<div class="accordion-group">
	  <div class="accordion-heading">
		<h4 style = "text-align:center;"><a class="accordion-toggle collapsed"  data-parent="#accordion2" href="product_summary.jsp">
		  거래내역조회
		</a></h4>
	  </div>
	</div>
	
	<div class="accordion-group">
	  <div class="accordion-heading">
		<h4 style = "text-align:center;"><a class="accordion-toggle"  data-parent="#accordion2" href="product_latestproduct.jsp">
		  최근 본 상품
		</a></h4>
	  </div>
	</div>
	
	<div class="accordion-group">
	  <div class="accordion-heading">
		<h4 style = "text-align:center;"><a class="accordion-toggle"  data-parent="#accordion2" href="product_shoppingcart.jsp">
		  장바구니
		</a></h4> 
	  </div>
	</div>
	
		</ul>
		<br/>	
		<c:forEach var="cookies" items="${cookie}"  varStatus="status">
                		<c:choose>
       					     <c:when test = "${cookies.key == 'JSESSIONID'}">
					         </c:when>
					         <c:otherwise>
					          <div class="thumbnail">
									<img width="150" src="cdir/product/${fn:split(URLDecoder.decode(cookies.value.value, 'UTF-8'),'++')[0]}" alt="Bootshop panasonoc New camera"/>
									<div class="caption">
									  <h5>${fn:split(URLDecoder.decode(cookies.value.value, 'UTF-8'),'++')[1]}</h5>
										<h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">${fn:split(URLDecoder.decode(cookies.value.value, 'UTF-8'),'++')[2]}원</a></h4>
									</div>
								  </div><br/>	 			              
		 								   
					         </c:otherwise>
				      </c:choose>
					</c:forEach>	
			<div class="thumbnail">
				<img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
				<div class="caption">
				  <h5>Payment Methods</h5>
				</div>
			  </div>
		</div>	
		
			
	
