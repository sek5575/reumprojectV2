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
	
	<!-- sidebar Include CSS START-->
<%@ include file="/include/usersidebar.jsp" %>
<!-- sidebar Include CSS END-->

	<div class="span9" id="mainCol">
    <ul class="breadcrumb">
		<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">공지사항</li>
    </ul>
	<h2>리움 공지사항</h2>
	<hr class="soften"/>
	
<table class="table table-bordered">
              <thead>
                <tr>
                  <th>번호</th>
                  <th width="600">제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회수</th>
				</tr>
              </thead>
              <tbody>
                <tr>
                  <td width="35"> 1 </td>
                  <td>공지사항입니다.</td>
                  <td>관리자</td>
                  <td>2018.10.10</td>
                  <td>100</td>
                </tr>
                
                <tr>
                  <td width="35"> 2 </td>
                  <td>공지사항 입니다.</td>
                  <td>관리자</td>
                  <td>2018.10.10</td>
                  <td>100</td>
                </tr>
                
                <tr>
                  <td width="35"> 3 </td>
                  <td>공지사항입니다.</td>
                  <td>관리자</td>
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