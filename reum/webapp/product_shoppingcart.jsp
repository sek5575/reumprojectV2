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
	

	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active"> 마이페이지<span class="divider">/</span></li>
		<li class="active"> 장바구니</li>
		
    </ul>   
    
    <div class="span9">
 <ul class="nav nav-tabs" id="myTab">
  <li class="active"><a href="#one" data-toggle="tab">일반상품 장바구니</a></li>
  <li><a href="#two" data-toggle="tab">경매상품 장바구니</a></li>
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
                  <th width="20" style = "text-align:center;">#</th>
                  <th width="40" style = "text-align:center;">상품</th>
                  <th style = "text-align:center;">상품글 제목</th>
                  <th width="100" style = "text-align:center;">가격</th>
                  <th width="60" style = "text-align:center;">상태</th>
				  <th width="60" style = "text-align:center;">판매자평</th>
				  <th width="80" style = "text-align:center;">판매자</th>
				</tr>
              </thead>
              <tbody>
                <tr>
                <td><input type="checkbox" id="optionsCheckbox" value="option1"/></td>
                  <td> <img width="60" src="themes/images/products/4.jpg" alt=""/></td>
                  <td style = "text-align:center;">MASSA AST</td>
				  <td style = "text-align:center;">100,000</td>
                  <td style = "text-align:center;"><font color="red">판매완료</font></td>
                  <td style = "text-align:center;">2.7</td>
                  <td style = "text-align:center;">이민석</td>
                </tr>
                
				<tr>
				<td><input type="checkbox" id="optionsCheckbox" value="option1"/></td>
                  <td> <img width="60" src="themes/images/products/4.jpg" alt=""/></td>
                  <td style = "text-align:center;">민석아 제대로하자</td>
				  <td style = "text-align:center;">100,000</td>
                  <td style = "text-align:center;"><font color="green">판매중</font></td>
                  <td style = "text-align:center;">4.3</td>
                  <td style = "text-align:center;">송은규</td>
                </tr>
                
				<tr>
				<td><input type="checkbox" id="optionsCheckbox" value="option1" /></td>
                  <td> <img width="60" src="themes/images/products/4.jpg" alt=""/></td>
                  <td style = "text-align:center;">MASSA AST</td>
				  <td style = "text-align:center;">100,000</td>
                  <td style = "text-align:center;"><font color="green">판매중</font></td>
                  <td style = "text-align:center;">4.1</td>
                  <td style = "text-align:center;">장소희</td>
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




  <div class="tab-pane" id="two">
  <div class="row-fluid">
		<div class="span12" id="mainCol">
    		<div class="span12">
    		<hr class="soft"/>
				<table class="table table-bordered" >	
              <thead>
                <tr>
                  <th width="20" style = "text-align:center;">#</th>
                  <th width="40" style = "text-align:center;">상품</th>
                  <th style = "text-align:center;">상품글 제목</th>
                  <th width="100" style = "text-align:center;">현재 최고입찰가</th>
                  <th width="60" style = "text-align:center;">상태</th>
				  <th width="60" style = "text-align:center;">판매자평</th>
				  <th width="80" style = "text-align:center;">종료시간</th>
				</tr>
              </thead>
              <tbody>
                <tr>
                  <td><input type="checkbox" id="optionsCheckbox" value="option1"/></td>
                  <td> <img width="60" src="themes/images/products/4.jpg" alt=""/></td>
                  <td style = "text-align:center;"><a href="auc_product_details.jsp">MASSA AST</a></td>
				  <td style = "text-align:center;">100,000</td>
				  <td style = "text-align:center;"><font color="red">경매마감</font></td>
                  <td style = "text-align:center;">4.7</td>
                  <td style = "text-align:center;">2018.12.24 23:11:12</td>
                </tr>
                
				<tr>
				<td><input type="checkbox" id="optionsCheckbox" value="option1"/></td>
                  <td> <img width="60" src="themes/images/products/4.jpg" alt=""/></td>
                  <td style = "text-align:center;">민석아 제대로하자</td>
				  <td style = "text-align:center;">100,000</td>
				   <td style = "text-align:center;"><font color="green">경매중</font></td>
                  <td style = "text-align:center;">4.7</td>
                  <td style = "text-align:center;">2018.12.24<br>23:11:12</td>
                </tr>
                
				<tr>
				<td><input type="checkbox" id="optionsCheckbox" value="option1"/></td>
                  <td> <img width="60" src="themes/images/products/4.jpg" alt=""/></td>
                  <td style = "text-align:center;">MASSA AST</td>
				  <td style = "text-align:center;">100,000</td>
				   <td style = "text-align:center;"><font color="green">경매중</font></td>
                  <td style = "text-align:center;">4.7</td>
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