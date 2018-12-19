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
<script>
$(document).ready(function(){
	//댓글 입력버튼 이벤트
	$("#replybtn").click(function(){
		  		var userSeq = ${sessionScope.SESS_SEQ};
		  		var sendData = {"productReplyContent":$("#content_reply").val(), "productSeq":${Product_VO.productSeq}, "userSeq":userSeq};	
			 	console.log(sendData);
									
				  $.ajax({ 
							url:"/productReplyServlet",
							type:"post",
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							data:JSON.stringify(sendData),
							success:function(gsonObj){
									console.log(gsonObj);
									var htmlStr = "";
									htmlStr += "<div  style='background-color:#f9f9f9'>";
						 			$.map(gsonObj, function(vv, idx){			 				
						        	htmlStr += "<ul style='list-style:none;'>";
						        	htmlStr += "<li style='height:6px'></li>";
						        	htmlStr += "<li>";
						        	htmlStr += "<img src='https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png' width='32' height='32' alt='프로필' onerror='this.onerror=''; this.src=\"'https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png'\">";
						        	htmlStr += "&nbsp; &nbsp; <font style='color: #666;word-wrap: break-word;'><b>"+vv.userId+"</b></font>";
						        	htmlStr += "<font color='#f9f9f9'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </font>";
						        	htmlStr += "<font style='color: #666;word-wrap: break-word;'>"+vv.productReplyRegdate+"</font>";
						        	htmlStr += "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;";
						        	htmlStr += "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;";
						        	htmlStr += "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"; 
						        			if(vv.sessionId == vv.userId){
								        		htmlStr += "<font color='#666'><span name='"+vv.productReplySeq+"^^^"+vv.productReplyContent+"' class='replyEdit'>수정</span> | <a href='#' onClick=''>삭제</a></font>";
								        	}
								    htmlStr += "</li>";
								    htmlStr += "<li>";
								    htmlStr += "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;";
								    htmlStr += "<span id='reply_input_span"+vv.productReplySeq+"'>"+vv.productReplyContent+"</span>";
								    htmlStr += "</li>";
								    htmlStr += "</ul>";
								    htmlStr += "<li style='list-style:none;'>&nbsp; &nbsp; <img src='/themes/images/dot_line.png' ></li>";

							  	});
						 			htmlStr += "</div>";
							  	
							  	//div는 남겨두고 기존 댓글 내용만 지우기
							  	$("#reply_list").empty();
							  	$("#reply_list").html(htmlStr);
							  	$("#replybtn").val(""); //왜 안비워지지?
							}
				}); //end of ajax 
  	});
		
		//수정버튼 활성화
		$(document).on("click",".replyEdit",function(){ //글쓰기 버튼 --> 눌렀을 때 기존의 있는 내용을 불러오고 text로 활성화 된다.
			var names = $(this).attr("name");
			var arr = names.split("^^^");
			//alert(arr[0] +","+arr[1]);
			//입력된 글이 들어와야한다..!!!
			var htmlStr = "<input type='text' style='border: none;  background-color: #FFFFFF;  font-size:12px; font-color:#666; word-wrap: break-word; width:600px;' name='' id='updateContent' value='"+arr[1]+"'> ";	
			htmlStr += "<span onClick=\"replyEditSubmit('"+arr[0]+"','"+$("#updateContent").data()+"')\" class='replyEditSubmit' name=''><img  src='https://cafe.pstatic.net/cafe4/ico-btn-write.gif' width='10' height='10' alt=''>글쓰기</span>";
			
			$("#reply_input_span"+arr[0]).empty();
			$("#reply_input_span"+arr[0]).html(htmlStr);
		});
		
});


function replyEditSubmit(seq, reply){
	//ajax
	alert(seq +","+reply);
	var sendData = {"productReplyContent":reply, "productReplySeq":seq};	
	console.log(sendData);
	$("#reply_input_span"+seq).empty();
	var htmlStr = "";
	
	 $.ajax({ 
			url:"/productReplyUpdateServlet",
			type:"post",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data:JSON.stringify(sendData),
			success:function(gsonObj){
					console.log(gsonObj);
		 			$.map(gsonObj, function(vv, idx){	
		        	htmlStr += "<li>";
		        	htmlStr += "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"; 
		        	htmlStr += "<span id='reply_input_span"+vv.productReplySeq+"'>"+vv.productReplyContent+"</span>";
		        	htmlStr += "</li>";
			  	});
			}
	}); //end of ajax 
	
	$("#reply_input_span"+seq).html(htmlStr);
}

</script>
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
				<%@ include file="/include/sidebar.jsp"%>
				<!-- sidebar Include CSS END-->

				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
						<li><a href="products.jsp">Products</a> <span class="divider">/</span></li>
						<li class="active">product Details</li>
					</ul>
					<div class="row">
						<!-- ====================== 사진 입력폼  =============================== -->
						<div id="gallery" class="span3">
							<a href="themes/images/products/large/f1.jpg"
								title='${Product_VO.productName}'> <img
								src="/cdir/product/${Product_VO.productPicVO.productAttachSysname}"
								style="width: 100%"
								alt='${Product_VO.productPicVO.productAttachSysname}' />
							</a>



						</div>
						<div class="span6">
							<h3>${Product_VO.productName}</h3>
							<small> 뭔가 버리기 아까운거 같아 뭐라도 쓰자</small>
							<hr class="soft" />
							<form class="form-horizontal qtyFrm">
								<div class="control-group">
									<label class="control-label"><span>${Product_VO.productPrice}원</span></label>
									<div class="controls">
										<input type="text" class="span1" value='${Product_VO.locName}'
											readOnly />
										<button type="submit"
											class="btn btn-large btn-primary pull-right">
											구매하기 <i class=" icon-shopping-cart"></i>
										</button>
									</div>
								</div>
							</form>

							<hr class="soft" />
							<button class="btn btn-success dropdown-toggle"
								data-toggle="dropdown">쪽지 하기</button>
							<span class="badge badge-info pull-right"><h4>판매자평점:
									8</h4></span>


							<hr class="soft clr" />

							<br class="clr" /> <a href="#" name="detail"></a>
						</div>

						<div class="span9">
							<ul class="nav nav-tabs" id="myTab">
								<li class="active"><a href="#one" data-toggle="tab">1.
										상품정보</a></li>
								<li><a href="#two" data-toggle="tab">2. 상품댓글</a></li>
								<li><a data-toggle="tab" href="#three">3. 판매자평</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade active in" id="home">

									<div class="tab-content">
										<div class="tab-pane active" id="one">
											<div class="row-fluid">
												<div class="span12">
													<h4>상품 상세정보</h4>
													<!-- 상품 상세 사진 ========================================================================== -->
													<ul class="thumbnails">
														<c:forEach var="pic" items="${Product_PIC.pvolist}">
															<li class="span3"><img
																src="/cdir/product/${pic.productAttachSysname}" alt="">
															</li>
														</c:forEach>
													</ul>

													<!-- 상품 상세 설명 ========================================================================== -->
													<p>${Product_PIC.productDescription}</p>
												</div>
											</div>
										</div>


										<div class="tab-pane" id="two">
											<div class="row-fluid">
												<div class="span13">

													<!-- =============================== 상품 댓글 부분 ajax으로 login만들면 구현 =============================================  -->
													<div class="span11">
														
															<div class="span12 pull-right">
											
											
											
											<!-- 댈글 DIV -->				
											<div id="reply_list">
											 
											 
											 
											 <div  style="background-color:#f9f9f9">
											 <c:forEach var="reply" varStatus="vs" items="${Product_REPLY}">
											 <ul style="list-style:none;">
										       
										       <li style="height:6px"></li>
										       <li>
										        	<img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png" width="32" height="32" alt="프로필" onerror="this.onerror=''; this.src='https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png'">
										        	&nbsp; &nbsp; <font style="color: #666;word-wrap: break-word;"><b>${reply.userId}</b></font> 
										        	<font color="#f9f9f9">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </font>
										        	<font style="color: #666;word-wrap: break-word;">${reply.productReplyRegdate}</font>
										        	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
										        	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
										        	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
										        	 <c:set var="userID" value= "${reply.userId}"/>
										        		<c:choose>
										        		<c:when test="${sessionScope.SESS_ID eq userID}">
										        		<font color="#666"><span name="${reply.productReplySeq}^^^${reply.productReplyContent}" class="replyEdit">수정</span> | <a href="#" onClick="">삭제</a></font>
										        		</c:when>
									                	</c:choose>
										        </li>
										        <li>
										        		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
										        		<span id="reply_input_span${reply.productReplySeq}">${reply.productReplyContent}</span>
									                	
									            </li>
											   </ul>
										       <li style="list-style:none;">&nbsp; &nbsp; <img src="/themes/images/dot_line.png" ></li>
										     </c:forEach>
											 
											   </div>
											 
										     </div>
										    
										   
												
										    	 <c:choose>
										        <c:when test="${not empty sessionScope.SESS_ID}">
												<!--  댓글입력폼 -->
									             &nbsp; <input type='text' style='border: none;  background-color: #dddddd;  font-size:12px; font-color:#666; word-wrap: break-word; width:630px;height:70px;' name='content_reply' id='content_reply'>   
									             <span id="replybtn"><img src="/themes/images/dot_submit_button.png"></span>
									             <!--  댓글입력폼 -->
												</c:when>
									            </c:choose>
									            
									             
									            
															</div>
														
													</div>
												</div>
											</div>
										</div>
													
								

										<div class="tab-pane" id="three">
											<div class="row-fluid">
												<div class="span11" id="mainCol">
													<div class="span12">
														<table class="table">
															<thead>
																<tr>
																	<th>평점</th>
																	<th width="400">글내용</th>
																	<th>작성자</th>
																	<th>작성일</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="eval" items="${Product_EVAL}">
																	<tr>
																		<td>${eval.userevalScore}</td>
																		<td>${eval.userevalContent}</td>
																		<td>${eval.userId}</td>
																		<td>${eval.userevalRegdate}</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
														</style>
													</div>


												</div>
											</div>
										</div>
										
										
										<button type="button" class="btn pull-right"
											onclick="location.href='products.jsp'">뒤로가기</button>
										
										<c:set var="sellerID" value= "${Seller_ID.userId}"/>
										       	<c:choose>
										       	<c:when test="${sessionScope.SESS_ID eq sellerID}">
												<button type="button" class="btn btn-primary pull-right"
												onclick="location.href='/productDeleteServlet?product_seq=${Product_VO.productSeq}'">삭제하기</button>
												
												<button type="button" class="btn btn-primary pull-right"
												onclick="location.href='/productModifyEntryServlet?product_seq=${Product_VO.productSeq}'">수정하기</button>
									           	</c:when>
												<c:otherwise>
									          	</c:otherwise>
								               	</c:choose>

									</div>
									<!-- 상품 상세 사진========================================================================== -->

								</div>
								<hr class="soften" />


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- MainBody End ============================= -->

	<!-- Footer Include CSS START-->
	<%@ include file="/include/footer.jsp"%>
	<!-- Footer Include CSS END-->


</body>
</html>