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
		<h4><a class="accordion-toggle collapsed" data-parent="#accordion2" href="qna.jsp">
		  Q&A
		</a></h4>
	  </div>
	</div>
				<div class="accordion-group">
	  <div class="accordion-heading">
		<h4><a class="accordion-toggle" data-parent="#accordion2" href="faq.jsp">
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
		<li class="active">Q&A</li>
    </ul>
	<h2>Q&A</h2>
	<hr class="soften"/>
	
<table class="table table-bordered">
              <thead>
                <tr>
                  <th>번호</th>
                  <th width="500">제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회수</th>
				</tr>
              </thead>
              <tbody>
                <tr>
                  <td width="35"> 1 </td>
                  <td><a href="index.jsp">글 제목 입력란 입니다</a></td>
                  <td>USER ID</td>
                  <td>2018.10.10</td>
                  <td>100</td>
                </tr>
                
                <tr>
                  <td width="35"> 2 </td>
                  <td>글 제목 입력란 입니다</td>
                  <td>USER ID</td>
                  <td>2018.10.10</td>
                  <td>100</td>
                </tr>
                
                <tr>
                  <td width="35"> 3 </td>
                  <td>글 제목 입력란 입니다</td>
                  <td>USER ID</td>
                  <td>2018.10.10</td>
                  <td>100</td>
                </tr>

				</tbody>
            </table>
            
  </div>
</div>
</div>


<!-- Footer Include CSS START-->
<%@ include file="/include/footer.jsp" %>
<!-- Footer Include CSS END-->
	

</body>
</html>