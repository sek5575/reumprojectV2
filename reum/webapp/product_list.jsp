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
<script>
$(document).ready(function(){
	$("#array").change(function(){
		
		//var text = $("#array option:selected").text();
		var mode = $("#array option:selected").val();
		var sendData = {"mode":mode, "cateSeq":${param.cate_seq}};	
			 	console.log(sendData);
			 	
				$.ajax({ 
							url:"/productArrayServlet",
							type:"post",
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							data:JSON.stringify(sendData),
							success:function(gsonObj){
									console.log(gsonObj);
									var htmlStr = "";
									htmlStr += "<div  style='background-color:#f9f9f9'>";
						 			$.map(gsonObj, function(vv, idx){	
						        	htmlStr += "<li class='span3'>";
						        	htmlStr += "<div class='thumbnail'>";
						        	htmlStr += "<a href='/product?array="+$('#array').val()+"&product_seq="+vv.productSeq+"'><img src='/cdir/product/"+vv.productPicVO.productAttachSysname+"' style='width:240px; height:180px;'/></a>";
						        	htmlStr += "<div class='caption'>";
						        	htmlStr += "<h5>"+vv.productName+"</h5>";
						        	htmlStr += "<p> 지역 : <strong>"+vv.locName+"</strong></p>";
						        	htmlStr += "<p> 가격 :<strong>"+vv.productPrice+"</strong>원</p>";
						        	htmlStr += "<h4 style='text-align:center'>";
						        	htmlStr += "<a class='btn' href='/product?array="+$('#array').val()+"&product_seq="+vv.productSeq+"'><i class='icon-zoom-in'></i>보러가기</a>";  
						        	htmlStr += "</h4>";
						        	htmlStr += "</div>";
						        	htmlStr += "</div>";
						        	htmlStr += "</li>";

							  	});
							  	
							  	$("#thumbnails").empty();
							  	$("#thumbnails").html(htmlStr);
							  	
							  
							  	if(typeof(history.pushState) == 'function') {
							  		//현재 주소를 가져온다.
								  	var renewURL = location.href;
								  	
							  		//현재 주소 중 page 부분이 있다면 날려버린다.
							  		renewURL = renewURL.replace(/\?[\s\S]*$/g,'');
							  		//renewURL = renewURL.replace(/[.^?*[{\|]/g, '')
							  		
								  	renewURL += "?cate_seq=${param.cate_seq}&array="+$('#array').val();
									//페이지 갱신 실행!
								  	history.pushState(null, null, renewURL);
							  	}
							  	
							  	
							}
				}); //end of ajax
		
  	});
	
	$(".location").click(function(){
		var locname = $(this).attr("name"); 
		var sendData = {"locName":locname, "cateSeq":${param.cate_seq}};	
	 	console.log(sendData);
	 	
		$.ajax({ 
					url:"/productLocArrayServlet",
					type:"post",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data:JSON.stringify(sendData),
					success:function(gsonObj){
							console.log(gsonObj);
							var htmlStr = "";
							htmlStr += "<div  style='background-color:#f9f9f9'>";
				 			$.map(gsonObj, function(vv, idx){	
				        	htmlStr += "<li class='span3'>";
				        	htmlStr += "<div class='thumbnail'>";
				        	htmlStr += "<a href='/product?product_seq="+vv.productSeq+"&loc_name="+locname+"'><img src='/cdir/product/"+vv.productPicVO.productAttachSysname+"' style='width:240px; height:180px;/></a>";
				        	htmlStr += "<div class='caption'>";
				        	htmlStr += "<h5>"+vv.productName+"</h5>";
				        	htmlStr += "<p> 지역 : <strong>"+vv.locName+"</strong></p>";
				        	htmlStr += "<p> 가격 :<strong>"+vv.productPrice+"</strong>원</p>";
				        	htmlStr += "<h4 style='text-align:center'>";
				        	htmlStr += "<a class='btn' href='/product?product_seq="+vv.productSeq+"&loc_name="+locname+"'><i class='icon-zoom-in'></i>보러가기</a>";  
				        	htmlStr += "</h4>";
				        	htmlStr += "</div>";
				        	htmlStr += "</div>";
				        	htmlStr += "</li>";

					  	}); //http://localhost:8006/product?array=row&product_seq=104   http://localhost:8006/product?loc_name=%EA%B4%91%EC%A3%BC&product_seq=106
					  
					  	$("#thumbnails").empty();
					  	$("#thumbnails").html(htmlStr);
					  	
						if(typeof(history.pushState) == 'function') {
					  		//현재 주소를 가져온다.
						  	var renewURL = location.href;
						  	
					  		//현재 주소 중 page 부분이 있다면 날려버린다.
					  		renewURL = renewURL.replace(/\?[\s\S]*$/g,'');
					  		//renewURL = renewURL.replace(/[.^?*[{\|]/g, '')
					  		
						  	renewURL += "?cate_seq=${param.cate_seq}&loc_name="+locname;
							//페이지 갱신 실행!
						  	history.pushState(null, null, renewURL);
					  	}
					  
					  	
					  	
				}
		}); //end of ajax
	 });
	
	  $("#searchVal").keypress(function() {
	        var searchVal = $("#searchVal").val();
	        location.href = "/productSideServlet?product_name="+searchVal+"&cate_seq="+${param.cate_seq}+"&array="+$("#array option:selected").val();
	        
	  });
	  
	  $("#searchBtn").click(function() {
	        var searchVal = $("#searchVal").val();
	        location.href = "/productSideServlet?product_name="+searchVal+"&cate_seq="+${param.cate_seq}+"&array="+$("#array option:selected").val();
	        
	  }); 
	
	/* $(document).on('keydown', '#searchBtn', function() {
		alert("!!!");
		//alert(document.getElementById("#searchVal").value);
	}); */
	
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
<%@ include file="/include/sidebar.jsp" %>
<!-- sidebar Include CSS END-->


	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Products List</li>
    </ul>

    
    
	<h3> 상품 목록 <small class="pull-right"> </small></h3>	
	<hr class="soft"/>
	
	
	<ul class="nav nav-tabs" id="myTab">
	  <li class="active"><a href="#one" data-toggle="tab"><strong>일반상품</strong></a></li>
	  <li><a href="#two" data-toggle="tab"><strong>경매상품</strong></a></li>
	</ul>


<!-- 일반상품 리스트↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->




  <div class="tab-content">
  <div class="tab-pane active" id="one">
  <div class="row-fluid">
  </div>
  			
		 	 <ul class="breadcrumb">
				  <li><a href="#" class="active">전체</a> <span class="divider">/</span></li>
				  <c:forEach var="loc" varStatus="vs" items="${Location_LIST}">
				  
				  <li><span class="location" id="location${loc.locSeq}" name="${loc.locName}"><a>${loc.locName}</a></span><span class="divider">/</span></li>
				 
		          
		          </c:forEach>
		      </ul>
  		
  <div>
  
  <div class="control-group">
            <label class="control-label span3" for="select11"><strong>정렬</strong></label>
            <div class="controls">
            
            <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
              <select class="span3" id="array">
                <option value="row">낮은 가격순</option>
                <option value="high">높은 가격순</option>
                <option value="regdate">등록일자순</option>
              </select>
              
            </div>
          </div>
	  
  </div>
  <hr class="soft">

	<div class="tab-pane  active" id="blockView">
		<ul class="thumbnails" id="thumbnails">
		
			 											<c:set var="search_list" value= "${Search_LIST}"/>
			 											<c:set var="product_list" value= "${Product_LIST}"/>
										        		<c:choose>
										        		
										        		<c:when test="${search_list ne null}">
			<c:forEach var="vv" items="${Search_LIST}">
			<li class="span3">
			  <div class="thumbnail">
				<a href="/product?array=row&product_seq=${vv.productSeq}"><img src="/cdir/product/${vv.productPicVO.productAttachSysname}" style="width:240px; height:180px;"/></a>
				<div class="caption">
				  <h5>${vv.productName}</h5>
				   <p> 지역 : <strong>${vv.locName}</strong></p>
				  <p> 가격 : <strong>${vv.productPrice}</strong>원</p>
				   <h4 style="text-align:center">
				   <a class="btn" href="/product?array=row&product_seq=${vv.productSeq}"><i class="icon-zoom-in"></i>보러가기</a>  
				   </h4>
				</div>
			  </div>
			</li>
			</c:forEach>
										        		</c:when>
										        		
										        		<c:when test="${product_list ne null}">
			<c:forEach var="vv" items="${Product_LIST}">
			<li class="span3">
			  <div class="thumbnail">
				<a href="/product?array=row&product_seq=${vv.productSeq}"><img src="/cdir/product/${vv.productPicVO.productAttachSysname}" style="width:240px; height:180px;"/></a>
				<div class="caption">
				  <h5>${vv.productName}</h5>
				   <p> 지역 : <strong>${vv.locName}</strong></p>
				  <p> 가격 : <strong>${vv.productPrice}</strong>원</p>
				   <h4 style="text-align:center">
				   <a class="btn" href="/product?array=row&product_seq=${vv.productSeq}"><i class="icon-zoom-in"></i>보러가기</a>  
				   </h4>
				</div>
			  </div>
			</li>
			</c:forEach>
										        		</c:when>
									                	</c:choose>
			
			
			
			
			
		  </ul>
	</div>
	



			<div class="input-append span9 pull-right">
			
                <input class="input-append span2" size="44" type="text" id="searchVal">
                
                <button class="btn" type="button" id="searchBtn">검색</button>
                
                
               									 <c:choose>
										        <c:when test="${not empty sessionScope.SESS_ID}">
												 <button onclick="location.href='product_register.jsp'" class="btn btn-primary dropdown-toggle pull-right" data-toggle="dropdown">상품등록</button>
												</c:when>
												<c:otherwise>
														
									            </c:otherwise>
									            </c:choose>
               
              </div>
              

			<div class="pagination span6 pull-right" >
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
			
			

  </div>
<!-- 일반상품 리스트↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->




<!-- 경매상품 리스트↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
 
<div class="tab-pane" id="two">
  <div class="row-fluid"> 
  </div>
  
  
  
<div class="control-group">
            <label class="control-label span3" for="select12"><strong>정렬</strong></label>
            <div class="controls">
              <select class="span3" id="select12">
                <option>남은시간순</option>
                <option>입찰자순</option>
              </select>
            </div>
          </div>
  
    <hr class="soft">
  <div class="tab-pane  active" id="blockView">
		<ul class="thumbnails">
		
		
			<li class="span3">
			  <div class="thumbnail">
				<a href="auc_product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5><a href="auc_product_details.jsp">상품 이름</a></h5>
				  <p> 2018.12.26 15:42:11 </p>
				   <p> 입찰자 : <a href="auc_product_details.jsp"><strong>[ 3 ] </strong></a>명</p>
				  <p> 즉시구매가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				  <p> 현재입찰가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				   <h4 style="text-align:center">
				   <a class="btn" href="auc_product_details.jsp"><i class="icon-zoom-in"></i>보러가기</a>  
				   </h4>
				</div>
			  </div>
			</li>
			
			
			<li class="span3">
			  <div class="thumbnail">
				<a href="auc_product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>상품 이름</h5>
				  <p> 2018.12.26 15:42:11 </p>
				   <p> 입찰자 : <a href="auc_product_details.jsp"><strong>[ 3 ] </strong></a>명</p>
				  <p> 즉시구매가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				  <p> 현재입찰가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				   <h4 style="text-align:center">
				   <a class="btn" href="#"><i class="icon-zoom-in"></i>보러가기</a>  
				   </h4>
				</div>
			  </div>
			</li>
			
			
			<li class="span3">
			  <div class="thumbnail">
				<a href="auc_product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>상품 이름</h5>
				  <p> 2018.12.26 15:42:11 </p>
				   <p> 입찰자 : <a href="auc_product_details.jsp"><strong>[ 3 ] </strong></a>명</p>
				  <p> 즉시구매가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				  <p> 현재입찰가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				   <h4 style="text-align:center">
				   <a class="btn" href="#"><i class="icon-zoom-in"></i>보러가기</a>  
				   </h4>
				</div>
			  </div>
			</li>
			
			
			<li class="span3">
			  <div class="thumbnail">
				<a href="auc_product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>상품 이름</h5>
				  <p> 2018.12.26 15:42:11 </p>
				   <p> 입찰자 : <a href="auc_product_details.jsp"><strong>[ 3 ] </strong></a>명</p>
				  <p> 즉시구매가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				  <p> 현재입찰가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				   <h4 style="text-align:center">
				   <a class="btn" href="#"><i class="icon-zoom-in"></i>보러가기</a>  
				   </h4>
				</div>
			  </div>
			</li>
			
			
			<li class="span3">
			  <div class="thumbnail">
				<a href="auc_product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>상품 이름</h5>
				  <p> 2018.12.26 15:42:11 </p>
				   <p> 입찰자 : <a href="auc_product_details.jsp"><strong>[ 3 ] </strong></a>명</p>
				  <p> 즉시구매가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				  <p> 현재입찰가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				   <h4 style="text-align:center">
				   <a class="btn" href="#"><i class="icon-zoom-in"></i>보러가기</a>  
				   </h4>
				</div>
			  </div>
			</li>
			
			
			<li class="span3">
			  <div class="thumbnail">
				<a href="auc_product_details.jsp"><img src="themes/images/products/3.jpg" alt=""/></a>
				<div class="caption">
				  <h5>상품 이름</h5>
				  <p> 2018.12.26 15:42:11 </p>
				   <p> 입찰자 : <a href="auc_product_details.jsp"><strong>[ 3 ] </strong></a>명</p>
				  <p> 즉시구매가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				  <p> 현재입찰가 : <a href="auc_product_details.jsp"><strong>100,000 </strong></a>원</p>
				   <h4 style="text-align:center">
				   <a class="btn" href="#"><i class="icon-zoom-in"></i>보러가기</a>  
				   </h4>
				</div>
			  </div>
			</li>
			
			
		  </ul>
	</div>



<div class="input-append span9 pull-right">
                <input class="input-append span2" id="appendedInputButton2" size="44" type="text">
                <button class="btn" type="button">검색</button>
                <button class="btn btn-primary dropdown-toggle pull-right" data-toggle="dropdown">경매등록</button>
              </div>

			<div class="pagination span6 pull-right" >
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
	<hr class="soft"/>
  </div>
  <!-- 경매상품 리스트↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
  
						</div>
<br class="clr"/>
					<div class="tab-content">
				</div>
			</div><!--  -->
		</div><!-- 로우 -->
	</div><!-- 컨테이너 -->
</div><!-- 메인바디 -->




<!-- Footer Include CSS START-->
<%@ include file="/include/footer.jsp" %>
<!-- Footer Include CSS END-->

</body>
</html>