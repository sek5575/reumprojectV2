<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	
<!-- Script Include CSS START-->
<%@ include file="/include/script.jsp" %>
<!-- Script Include CSS END-->

 <head>
 
<!-- Header Include CSS START-->
<%@ include file="/include/header.jsp" %>
<!-- Header Include CSS END-->

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
	
<div id="sidebar" class="span3">
		<div class="well well-small"><a id="myCart" href="product_summary.jsp"><h4>문의 / 건의 글쓰기 </h4> </a></div>
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
		
			<div class="accordion-group">
	  <div class="accordion-heading">
		<h4><a class="accordion-toggle collapsed" data-parent="#accordion2" href="protice.jsp">
		  공지사항
		</a></h4>
	  </div>
	</div>
		
	<div class="accordion-group">
	  <div class="accordion-heading">
		<h4><a class="accordion-toggle collapsed"  data-parent="#accordion2" href="qna.jsp">
		  Q&A
		</a></h4>
	  </div>
	</div>
				<div class="accordion-group">
	  <div class="accordion-heading">
		<h4><a class="accordion-toggle"  data-parent="#accordion2" href="faq.jsp">
		  FAQ
		</a></h4>
	  </div>
	</div>
		</ul>
		<br/>

	</div>

	<div class="span9" id="mainCol">
    <ul class="breadcrumb">
		<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">공지사항</li>
    </ul>
	<h2>자유게시판</h2>
	<hr class="soften"/>
    <div class="span9">
		<table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>글제목</th>
            <th>작성자</th>
            <th>지역</th>
            <th>작성일</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td>@mdo</td>
            <td>@mdo</td>
          </tr>
          <tr>
            <td>2</td>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
            <td>@mdo</td>
            <td>@mdo</td>
          </tr>
          <tr>
            <td>3</td>
            <td>Larry</td>
            <td>the Bird</td>
            <td>@twitter</td>
            <td>@mdo</td>
            <td>@mdo</td>
          </tr>
        </tbody>
      </table>
      </style>
	</div>
            <div class="pagination">
			<ul>
			<li><a href="#">&lsaquo;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">...</a></li>
			<li><a href="#">&rsaquo;</a></li>
			</ul>
			<form class="navbar-search pull-right" action="#">
            <input type="text" class="search-query span2" placeholder="Search"/>
          </form>
			
			</div>
			
  </div>
</div>
</div>


<!-- Footer Include CSS START-->
<%@ include file="/include/footer.jsp" %>
<!-- Footer Include CSS END-->
	



</body>
</html>