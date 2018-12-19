<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<!-- Script Include CSS START-->
<%@ include file="/include/script.jsp"%>
<!-- Script Include CSS END-->

<head>

<script>
$(document).ready(function(){

	$("#registerBt").click(function(){
		 $("#regForm").attr("action" , "/productModifyServlet");
		 $("#regForm").attr("method" , "post");  //post
	  	 $("#regForm").submit(); 
	});
	

	
	function cate1(catenum){
	  	  $.ajax({
					url:"/productCateServlet",
					type:"post",
					data:"cate="+catenum,
					resultType:"application/json; charset=UTF-8",
					success:function(resObj){
							console.log(resObj);	
							var htmlStr = "";
							htmlStr += "<select class='pull-right custom' id='cateMedium' name='cateMedium'>";
						  	$.map(resObj, function(vv, idx){
		                    htmlStr += "<option value='"+vv.cateSeq+"'>"+vv.cateName+"</option>";
						  	});	
						  	htmlStr += "</select>";
						  	console.log(htmlStr);
						  	$(".catediv").html(htmlStr);
						  	
						  /* 	$.map(resObj, function(vv, idx){
						  		if(vv.cateSeq>5 && vv.cateSeq<34){
						  			$(".catediv").html(htmlStr);	
						  		}else{
						  			$(".catediv1").html(htmlStr);	
						  		}
						  		
						  	}); */					  	  	
					 	}
				});
	  	 }
		
		function cate2(catenum){
		  	  $.ajax({
						url:"/productCateServlet",
						type:"post",
						data:"cate="+catenum,
						resultType:"application/json; charset=UTF-8",
						success:function(resObj){
								console.log(resObj);	
								var htmlStr = "";
								htmlStr += "<select class='pull-right custom' id='cateSeq' name='cateSeq'>";
							  	$.map(resObj, function(vv, idx){
			                    htmlStr += "<option value='"+vv.cateSeq+"'>"+vv.cateName+"</option>";
							  	});	
							  	htmlStr += "</select>";
							  	console.log(htmlStr);
							  	$(".catediv1").html(htmlStr);
							  	 	
						 	}
					});
		  	 }
		
		
		function cateSelect(id){ /* 정상적으로 값 넘어오고 */
		    var cs = document.getElementById(id);
		     
		    // select element에서 선택된 option의 value가 저장된다.
		    var cateValue = cs.options[cs.selectedIndex].value;
		    console.log(cateValue);
		    return cateValue;
		}
		
		$("#cateSeq").click(function(){
			var sss = cateSelect("cateSeq");
			cate1(sss);
	    });
		
		 //ajax(비동기)에서  버튼 이벤트를 작동시키기위한 .on문법
		$(document).on("click","#cateMedium",function(){
			var www = cateSelect("cateMedium");
			console.log(www);
			cate2(www);
		});
	
	

//jQuery 지원 : 첨부파일 미리보기 ---------------------
$("#mainPic").on("change", myFilePreviewFunc1); //동적바인딩 버튼 추가 할때마다 동적으로 할당된것은 이것으로 해야 버튼이 먹는다
$("#addtionalPic").on("change", myFilePreviewFunc2); //동적바인딩 버튼 추가 할때마다 동적으로 할당된것은 이것으로 해야 버튼이 먹는다

function myFilePreviewFunc1(e) {
		$("#prev-img-div1").empty();  // 내용만 지워라   remove() --> div태그를 없앤다.
		var files = e.target.files;  			//[object FileList]가 전체로 들어온다
		//FileList into an array 
		//var fileArr = Array.prototype.slice.call(files);			
		var fileArr = Array.from(files); //[object File],[object File],[object File]
			
		/* if(fileArr.length > 3) {  //files.length
				alert("이미지 첨부는 최대 3개만 가능합니다.");
				$("#pname").val("");
				return false;
		} */
		
		var fileSize = 0;
		fileArr.forEach(function(f) {   //fileArr forEach를 이렇게 돌리네
				fileSize += f.size;
		});
		if(fileSize > 10*1024*1024) {
				alert("이미지 첨부는 최대 10MB만 가능합니다.");
				$("#mainPic").val("");
				return false;
		}
		
		
		
		fileArr.forEach(function (f) {
			if(!f.type.match("image.*")) {
					alert("이미지 첨부만 가능합니다.");
					$("#mainPic").val("");
				
					return false;
			} 
			
			var reader = new FileReader();
			var htmlStr = "";
			reader.onload = function(e) {
					htmlStr += "<img src='"+e.target.result+"' style='height:200px;width:200px;'> ";
					$("#prev-img-div1").append(htmlStr);
			
					//alert(htmlStr)
			}
			reader.readAsDataURL(f);  //htmlStr 읽기위한
		});
	
		//<input id="pname" type="file" class="form-control" name="pname" multiple> multiple추가만 하면된다.
}

function myFilePreviewFunc2(e) {
	
	$("#prev-img-div2").empty();  // 내용만 지워라   remove() --> div태그를 없앤다.
	var files = e.target.files;  			//[object FileList]가 전체로 들어온다
	//FileList into an array 
	//var fileArr = Array.prototype.slice.call(files);			
	var fileArr = Array.from(files); //[object File],[object File],[object File]
		
	/* if(fileArr.length > 3) {  //files.length
			alert("이미지 첨부는 최대 3개만 가능합니다.");
			$("#pname").val("");
			return false;
	} */
	
	var fileSize = 0;
	fileArr.forEach(function(f) {   //fileArr forEach를 이렇게 돌리네
			fileSize += f.size;
	});
	if(fileSize > 10*1024*1024) {
			alert("이미지 첨부는 최대 10MB만 가능합니다.");
		
			$("#addtionalPic").val("");
			return false;
	}
	
	
	
	fileArr.forEach(function (f) {
		if(!f.type.match("image.*")) {
				alert("이미지 첨부만 가능합니다.");
			
				$("#addtionalPic").val("");
				return false;
		} 
		
		var reader = new FileReader();
		var htmlStr = "";
		reader.onload = function(e) {
				htmlStr += "<img src='"+e.target.result+"' style='height:150px;width:150px;'> ";
		
				$("#prev-img-div2").append(htmlStr);
				//alert(htmlStr)
		}
		reader.readAsDataURL(f);  //htmlStr 읽기위한
	});	
	//<input id="pname" type="file" class="form-control" name="pname" multiple> multiple추가만 하면된다.
}
		
		
		
		
		/* $("#saveButton").click(function() {	            
			$("#registerBt").submit();

			
			
			// cos api에서 모든 exception을 다 걸러 주기 때문에 jquery에서 조건으로 진입못하게 막아준다.
			 if ($("#pname").val() != "") {
				var ext = $('#pname').val().split('.').pop().toLowerCase();
				if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
					alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
					return false;
				}
			}

		}); */
		
	/* $("#cateSeq").click(function(){
		var sss = cateSelect("cateSeq");
		cate1(sss);
	}); */
		
	
});



</script>

<!-- Header Include CSS START-->
<%@ include file="/include/header.jsp"%>
<!-- Header Include CSS END-->

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
	<form id="regForm" enctype="multipart/form-data">
	
	
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
					
					<input type="hidden" id="productSeq" name="productSeq" value="${Product_VO.productSeq}">
					
					<!-- 어떻게 원래 사진이랑 아닌거랑 구분을 하지?? -->

					<div class="row">
						<!-- ====================== 사진 입력폼  =============================== -->
						<div id="gallery" class="span3">
							<input id="mainPic" name="mainPic" type="file" class="form-control">
							<div class="invalid-feedback">사진 등록은 필수 입니다.</div>
							
						</div>
						<div id="gallery" class="span3">
							<div id="prev-img-div1" class="form-group col-6">
							<div class="thumbnails">			 
								<!-- 대표사진 1개  -->
							 	<div class="span3" id="oldMain" name="oldMain">
									<img src="/cdir/product/${Product_VO.productPicVO.productAttachSysname}"
									width="150" height="150" 
									alt='${Product_VO.productPicVO.productAttachSysname}' />
								</div>
							</div>
	<input type="hidden" name="old_mainpname" value="${Product_VO.productPicVO.productAttachPname}"><!-- 값이 안들어지? -->
	<input type="hidden" name="old_mainsysname" value="${Product_VO.productPicVO.productAttachSysname}">
							
							</div>
						</div>
						

	
						</div>
						<div class="span6">
							<input type="text" id="productName" name="productName" value="${Product_VO.productName}">
							<hr class="soft" />
							
								<div class="control-group">
								<input type="number" class="control-label" id="productPrice" name="productPrice" value="${Product_VO.productPrice}">원

									<div class="controls">
										<select class="pull-right" id="locSeq" name="locSeq">
											<option value="1">서울</option>
											<option value="2">광주</option>
											<option value="3">대구</option>
											<option value="4">대전</option>
										</select>
										
										<select class="pull-right" id="cateSeq" name="cateSeq">
											<option value="1">식품</option>
											<option value="2">가구</option>
											<option value="3">가전</option>
											<option value="4">디지털</option>
										</select>
										
										</select>
									<div class="catediv">
										
									</div>
									
									
									<div class="catediv1">
									</div>

									</div>
								</div>
							

							<hr class="soft" />
		
							<hr class="soft clr" />

							<br class="clr" /> <a href="#" name="detail"></a>
						</div>

						<div class="span9">
							<ul class="nav nav-tabs" id="myTab">
								<li class="active"><a href="#one" data-toggle="tab">1.상품정보</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade active in" id="home">

									<div class="tab-content">
										<div class="tab-pane active" id="one">
											<div class="row-fluid">
												<div class="span12">
													<h4>상품 상세정보</h4>
													<!-- 상품 상세 사진 ========================================================================== -->
													<div class="row-fluid">
															<div class="span12">
																<h5>추가 등록 사진</h5>
														<!-- ====================== 추가 등록 사진  =============================== -->
																<input id="addtionalPic" type="file" Multiple class="form-control"
																	name="addtionalPic">

																<div id="prev-img-div2" class="form-group col-6">
${Product_PIC.pvolist.size()}
<input type="hidden"  name="subimgcnt" value="${Product_PIC.pvolist.size()}">



																	<!-- <ul class="thumbnails"> -->
																		<c:forEach var="pic" varStatus="vs" items="${Product_PIC.pvolist}">
	<input type="hidden" name="old_nonmain_${vs.index}" value="${pic.productAttachSeq}#_#${pic.productAttachSysname}#_#${pic.productAttachPname}">
																			<div class="span3" id="oldAttach" name="oldAttach"><img
																				src="/cdir/product/${pic.productAttachSysname}" alt="">
																			</div>
																		</c:forEach>
																	<!-- </ul> -->
																</div>
																
															</div>
													</div>

													<!-- 상품 상세 설명 ========================================================================== -->
													
													<textarea class="input-xxlarge" id="productDescription" name="productDescription"
														style="width: 800px; height: 200px">${Product_PIC.productDescription}</textarea>
												</div>
											</div>
										</div>

										
										


									</div>
								</div>
								<hr class="soften" />


							</div>
						</div>
					</div>
					<button class="btn pull-right" id="return"> <a href="products.jsp">취소</a></button>
					<button class="btn btn-primary pull-right" id="registerBt">확인</button>
					
					
					
					
				</div>
			</div>
		</div>
		</form>
	</div>
	<!-- MainBody End ============================= -->

	<!-- Footer Include CSS START-->
	<%@ include file="/include/footer.jsp"%>
	<!-- Footer Include CSS END-->


</body>
</html>