<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	
<!-- Script Include CSS START-->
<%@ include file="/include/script.jsp" %>
<!-- Script Include CSS END-->

 <head>
 
<!-- Header Include CSS START-->
<%@ include file="/include/header.jsp" %>
<!-- Header Include CSS END-->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>
$(document).ready(function(){
	$("#cookieDelButton").click(function(){
		<c:forEach var="cookies" items="${cookie}">
			$.removeCookie('${cookies.key}');
		</c:forEach>	
		location.reload();
	});
});
</script>
</head>


<body>
<div id="header">
<div class="container">

<!-- topbar Include CSS START-->
<%@ include file="/include/topbar.jsp" %>
<!-- topbar Include CSS END-->

<!-- navbar Include CSS START-->
<%@ include file="/include/navbar.jsp" %>
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
		<li class="active"> 마이페이지</li><span class="divider">/</span>
		<li class="active"> 거래내역조회</li>
    </ul> 
       
    
    <div class="span9">
 <ul class="nav nav-tabs" id="myTab">
  <li class="active"><a href="#one" data-toggle="tab">최근 본 상품(일반)</a></li>
  <li><a href="#two" data-toggle="tab">최근 본 상품(경매)</a></li>
</ul>
	<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade active in" id="home">
    <div class="tab-content">
  
  
  
  
  <div class="tab-pane active" id="one">
  <div class="row-fluid">
	 <div class="span12">	
	<hr class="soft"/>
	
	<table class="table table-bordered">
              <thead>
                <tr>                  
                  <th width="100" style = "text-align:center;">상품</th>  
                  <th style = "text-align:center;">상품글 제목</th>
                  <th width="100" style = "text-align:center;">가격</th>     
				 
				</tr>
              </thead>
                       
              <tbody>                             
                  	<c:forEach var="cookies" items="${cookie}"  varStatus="status">
                		<c:choose>
       					     <c:when test = "${cookies.key == 'JSESSIONID'}">
					         </c:when>
					         <c:otherwise>
					            		<tr>
						                       <td> <img width="100" src="cdir/product/${fn:split(URLDecoder.decode(cookies.value.value, 'UTF-8'),'++')[0]}" alt=""/></td>
                 								   <td style = "text-align:center; vertical-align : middle;"><font size="3">${fn:split(URLDecoder.decode(cookies.value.value, 'UTF-8'),'++')[1]}</font></td>
											   <td style = "text-align:center; vertical-align : middle;"><font size="3">${fn:split(URLDecoder.decode(cookies.value.value, 'UTF-8'),'++')[2]}원</font></td>             
		 								</tr>	   
					         </c:otherwise>
				      </c:choose>
					</c:forEach>	
				</tbody>			
 
            </table>
       <div class="pagination">
        <ul>
          <li class="disabled"><a href="#">&laquo;</a></li>
          <li class="active"><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">&raquo;</a></li>
        </ul>
        <button id="cookieDelButton" class="btn btn-danger dropdown-toggle pull-right" data-toggle="dropdown">비우기</button>
      </div>
      
            <hr class="soft"/>			
			 <h3><a class="btn pull-right" href="products.jsp"><i class="icon-arrow-left"></i>상품목록으로 가기</a> </h3>
  </div>
  </div>
  </div>




  <div class="tab-pane" id="two">
  <div class="row-fluid">
		<div class="span12" id="mainCol">
    		<div class="span12">
    		<hr class="soft"/>
				<table class="table table-bordered" >	
              <thead>
                <tr>                  
                  <th width="60" style = "text-align:center;">상품</th>
                  <th style = "text-align:center;">상품글 제목</th>                 
				  <th width="60" style = "text-align:center;">판매자평</th>
				  <th width="80" style = "text-align:center;">종료시간</th>
				</tr>
              </thead>
              <tbody>
                <tr>                 
                  <td> <img width="60" src="themes/images/products/4.jpg" alt=""/></td>
                  <td style = "text-align:center;"><a href="auc_product_details.jsp">MASSA AST</a></td>
				  <td style = "text-align:center;">100,000</td>				 
                  <td style = "text-align:center;">2018.12.24 23:11:12</td>
                </tr>
                
				<tr>				
                  <td> <img width="60" src="themes/images/products/4.jpg" alt=""/></td>
                  <td style = "text-align:center;">민석아 제대로하자</td>
				  <td style = "text-align:center;">100,000</td>				 
                  <td style = "text-align:center;">2018.12.24<br>23:11:12</td>
                </tr>
                
				<tr>				
                  <td> <img width="60" src="themes/images/products/4.jpg" alt=""/></td>
                  <td style = "text-align:center;">MASSA AST</td>
				  <td style = "text-align:center;">100,000</td>			
                  <td style = "text-align:center;">2018.12.24<br>23:11:12</td>
                </tr>
				</tbody>
            </table>
		<div class="pagination"> 
        <ul>
          <li class="disabled"><a href="#">&laquo;</a></li>
          <li class="active"><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">&raquo;</a></li>
        </ul>
        <button class="btn btn-danger dropdown-toggle pull-right" data-toggle="dropdown">비우기</button>
      </div>
			<hr class="soft"/>
  <h3><a class="btn pull-right" href="products.jsp"><i class="icon-arrow-left"></i>상품목록으로 가기</a> </h3>
	
</div>
  		</div>
	 </div>
  </div>


  
</div>

        
              </div>
              	<hr class="soften"/>
						</div>
          			</div>
          				</div>
</div>
</div> 

          			
<!-- MainBody End ============================= -->

<!-- Footer Include CSS START-->
<%@ include file="/include/footer.jsp" %>
<!-- Footer Include CSS END-->

</body>
</html>