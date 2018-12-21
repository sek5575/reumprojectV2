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
<%@ include file="/include/sidebar.jsp" %>
<!-- sidebar Include CSS END-->


	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Products Name</li>
    </ul>
	<h3> Products Name <small class="pull-right"> 40 products are available </small></h3>	
	<hr class="soft"/>
	<p>
		Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - that is why our goods are so popular and we have a great number of faithful customers all over the country.
	</p>
	<hr class="soft"/>
	<form class="form-horizontal span6">
		<div class="control-group">
		  <label class="control-label alignL">Sort By </label>
			<select>
              <option>Priduct name A - Z</option>
              <option>Priduct name Z - A</option>
              <option>Priduct Stoke</option>
              <option>Price Lowest first</option>
            </select>
		</div>
		
		
	  </form>
	  
<div id="myTab" class="pull-right">
 <!-- <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a> -->
 <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
</div>
<br class="clr"/>
<div class="tab-content">
	<!-- <div class="tab-pane" id="listView">
	
	
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/3.jpg" alt=""/>
			</div>
			
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
			
			<div class="span3 alignR">
			
			<form class="form-horizontal qtyFrm">
			<h3> $140.00</h3>
			<label class="checkbox">
				<input type="checkbox">  Adds product to compair
			</label><br/>
			
			  <a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
			  <a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
			
				</form>
			</div>
				
		</div>
		
		
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/1.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
			<form class="form-horizontal qtyFrm">
				<h3> $140.00</h3>
				<label class="checkbox">
				<input type="checkbox">  Adds product to compair
				</label><br/>
				
				<a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
				<a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				
			</form>
			</div>
		</div>
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/3.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
			<form class="form-horizontal qtyFrm">
				<h3> $140.00</h3>
				<label class="checkbox">
					<input type="checkbox">  Adds product to compair
				</label><br/>
				
				  <a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
				  <a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				
			</form>
			</div>
		</div>
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/3.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
				<form class="form-horizontal qtyFrm">
				<h3> $140.00</h3>
				<label class="checkbox">
				<input type="checkbox">  Adds product to compair
				</label><br/>
				
				<a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
				<a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				
				</form>
			</div>
		</div>
	
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/3.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
				<form class="form-horizontal qtyFrm">
				<h3> $140.00</h3>
				<label class="checkbox">
				<input type="checkbox">  Adds product to compair
				</label><br/>
				<a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
				<a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				</form>
			</div>
		</div>
		<hr class="soft"/>
		<div class="row">	  
			<div class="span2">
				<img src="themes/images/products/3.jpg" alt=""/>
			</div>
			<div class="span4">
				<h3>New | Available</h3>				
				<hr class="soft"/>
				<h5>Product Name </h5>
				<p>
				Nowadays the lingerie industry is one of the most successful business spheres.We always stay in touch with the latest fashion tendencies - 
				that is why our goods are so popular..
				</p>
				<a class="btn btn-small pull-right" href="product_details.jsp">View Details</a>
				<br class="clr"/>
			</div>
			<div class="span3 alignR">
				<form class="form-horizontal qtyFrm">
				<h3> $140.00</h3>
				<label class="checkbox">
				<input type="checkbox">  Adds product to compair
				</label><br/>
				
				<a href="product_details.jsp" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a>
				<a href="product_details.jsp" class="btn btn-large"><i class="icon-zoom-in"></i></a>
				
				</form>
			</div>
		</div>
		<hr class="soft"/>
	</div> -->

	<div class="tab-pane  active" id="blockView">
		<ul class="thumbnails">
		
		<c:forEach var="vv" items="${Product_LIST}">
			<li class="span3">
			  <div class="thumbnail">
				<a href="/product?product_seq=${vv.productSeq}"><img src="/cdir/product/${vv.productPicVO.productAttachSysname}" alt=""/></a>
				<div class="caption">
				  <h5>${vv.productName}</h5>
				  <p> 
					
				  </p>
				   <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">${vv.productPrice}원</a></h4>
				</div>
			  </div>
			</li>
			
		</c:forEach>
		
		  </ul>
	<hr class="soft"/>
	</div>
</div>
												<c:choose>
										        <c:when test="${not empty sessionScope.SESS_ID}">
												<a href="product_register.jsp" class="btn btn-large pull-right">상품 등록하기</a>
												</c:when>
												<c:otherwise>
														
									            </c:otherwise>
									            </c:choose>
	
	
	
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
			</div>
			<br class="clr"/>
</div>
</div>
</div>
</div>

<!-- Footer Include CSS START-->
<%@ include file="/include/footer.jsp" %>
<!-- Footer Include CSS END-->

</body>
</html>