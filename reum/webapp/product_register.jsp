<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<!-- Script Include CSS START-->
<%@ include file="/include/script.jsp"%>
<!-- Script Include CSS END-->

<head>
<script>
$(document).ready(function(){

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
	
	//크롤링 목록에서 버튼 클릭 시 새창으로 상세보기  //ajax(비동기)에서  버튼 이벤트를 작동시키기위한 .on문법
	$(document).on("click","#cateMedium",function(){
		var www = cateSelect("cateMedium");
		console.log(www);
		cate2(www);
	});


//jQuery 지원 : 첨부파일 미리보기 ---------------------
$("#mainPic").on("change", myFilePreviewFunc1); //동적바인딩 버튼 추가 할때마다 동적으로 할당된것은 이것으로 해야 버튼이 먹는다
$("#addtionalPic").on("change", myFilePreviewFunc2); //동적바인딩 버튼 추가 할때마다 동적으로 할당된것은 이것으로 해야 버튼이 먹는다
//$("#pname").change(function(){
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
						<li class="active">product register</li>
					</ul>
						<hr class="soft"/>
					
					<form method="post" action="/productInsertServlet" enctype="multipart/form-data">
					
					<!-- 여기  value= seq값으로 -->
					<input type="hidden" class="input-small" value="12" id="productSeq" name="productSeq">
					
					<div class="row">
						<!-- ====================== 메인사진 등록  =============================== -->
						<div id="gallery" class="span3">
							<h5>메인 등록 사진</h5>
							<input id="mainPic" name="mainPic" type="file" class="form-control">
							<div class="invalid-feedback">사진 등록은 필수 입니다.</div>
							<div id="prev-img-div1" class="form-group col-6"></div>
						</div>
	<div class="span6">
	<!-- ====================== 상품명  =============================== -->
		<input type="text" class="input-xlarge" id="productName" name="productName"
			placeholder="상품명을 입력하세요">
		<hr class="soft" />
		<div class="form-horizontal">
			<div class="controls">							
	<!-- ====================== 상품가격  =============================== -->
				
	<!-- ====================== 지역카테  =============================== -->
				
				<select class="pull-right" id="locSeq" name="locSeq"> <!-- 이름 안맞으면 안들어간다.. -->
					<option value="1">서울</option>
					<option value="2">광주</option>
					<option value="3">대구</option>
					<option value="4">대전</option>
				</select>
				
				
				
				
				
			</div>
		</div>

		
		
		
<span><input type="number" class="input-small" id="productPrice" name="productPrice">원</span>




		<br class="clr" /> <a href="#" name="detail"></a>
	</div>

<div>


<div class="controls pull-right">
<hr class="soft" />

              <select class="span2 cateSeq" id="cateSeq">
                <option value="1">식품</option>
                <option value="2">가구</option>
                <option value="3">가전</option>
                <option value="4">디지털</option>
              </select>
              
              
              <div class="catediv">
              <!-- <select class="span2 catediv" id="catediv">
                
              </select> -->
              
              </div>
              
             <div class="catediv1">
              <!-- <select class="span2 catediv1" id="catediv1">
                
              </select> -->
              </div>
              
            </div>




<hr class="soft" />
</div>










<br class="clr" />
						<div class="span9">
						<hr class="soft" />
							<ul class="nav nav-tabs" id="myTab">
								<li class="active"><a href="#one" data-toggle="tab">1.
										상품정보</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade active in" id="home">

									<div class="tab-content">
										<div class="tab-pane active" id="one">
											<div class="row-fluid">
												<div class="span12">
													<h4>상품 상세정보</h4>
									<!-- ====================== 상품상세정보  =============================== -->
													<textarea class="input-xxlarge" id="productDescription" name="productDescription"
														style="width: 855px; height: 200px"></textarea>
												</div>
											</div>
										</div>
									</div>

								</div>
								<hr class="soften" />

								<div class="tab-content">

									<div class="row-fluid">
										<div class="span12">
											<h5>추가 등록 사진</h5>
									<!-- ====================== 추가 등록 사진  =============================== -->
											<input id="addtionalPic" type="file" Multiple class="form-control"
												name="addtionalPic">
											<div id="prev-img-div2" class="form-group col-6"></div>
										</div>
									</div>

									


								</div>

							</div>
						</div>
						<button class="btn pull-right" onclick="location.href='products.jsp'">취소</button>
						<button class="btn btn-primary pull-right" id="registerBt">등록</button>
					</div>
					</form>

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