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
	
	//jQuery 지원 : 첨부파일 미리보기 ---------------------
	$("#userPname").on("change", myFilePreviewFunc);
	//$("#pname").change(function(){
	function myFilePreviewFunc(e) {
			$("#preview").empty();
			var files = e.target.files;  			//[object FileList]
			//FileList into an array 
			//var fileArr = Array.prototype.slice.call(files);			
			var fileArr = Array.from(files); //[object File],[object File],[object File]
				
			if(fileArr.length > 3) {  //files.length
					alert("이미지 첨부는 최대 3개만 가능합니다.");
					$("#userPname").val("");
					return false;
			}
			
			var fileSize = 0;
			fileArr.forEach(function(f) {
					fileSize += f.size;
			});
			if(fileSize > 10*1024*1024) {
					alert("이미지 첨부는 최대 10MB만 가능합니다.");
					$("#userPname").val("");
					return false;
			}
			
			fileArr.forEach(function(f) {
					if(!f.type.match("image.*")) {
							alert("이미지 첨부만 가능합니다.");
							$("#userPname").val("");
							return false;
					} 
					
					var reader = new FileReader();
					var htmlStr = "";
					reader.onload = function(e) {
							htmlStr += "<img src='"+e.target.result+"' style='height:150px;width:150px;'> ";
							$("#preview").append(htmlStr);
							//alert(htmlStr)
					}
					//reader.onload = function(e) { 
					//	$("#prev-img").attr("src", e.target.result); 
					//} 
					reader.readAsDataURL(f); 
			}); //end of forEach
	}
 $("#regButton").click(function(){
		  	var id =$("#userId").val();
			  var pw =$("#userPw").val();
			  var pw2 =$("#userPw2").val();
			  var agree = $("[id='agree']:checked").val();
			  if(id == "") {
				  	alert("아이디를 입력하세요")
		    		$("#userId").focus();
		    		return false;
			  } else if(pw == "") {
				  	alert("비밀번호를 입력하세요")
		    		$("#userPw").focus();
		    		return false;
			  } else if(pw != pw2) {
		    		alert("비밀번호가 다릅니다.")
		    		$("#userPw").focus();
		    		return false;
	    	} else if(agree != 'y'){
		    		alert("약관 동의 체크하세요.")
		    		$("#agree").focus();
		    		return false;
	    	}
	    	$("#regForm").submit();
	  });
});    
</script>
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
						<li class="active">Registration</li>
					</ul>
					<h3>회원가입</h3>
					<div class="well">
						<form id="regForm" method="POST" action="/register" class="form-horizontal">
							<h4>
								회원 정보
								입력&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<sup>*</sup>&nbsp&nbsp필수 입력
							</h4>

							<div class="control-group">
								<label class="control-label" for="userId"> 아이디 <sup>*</sup></label>
								<div class="controls">
									<input type="text" id="userId" name="userId" placeholder="아이디 ">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="userName">이름 <sup>*</sup></label>
								<div class="controls">
									<input type="text" id="userName" name="userName" placeholder="이름 ">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="userEmail">이메일 <sup>*</sup></label>
								<div class="controls">
									<input type="text" width="400" id="userEmail" name="userEmail"
										placeholder="abc123@google.com">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="userPw">비밀번호 <sup>*</sup></label>
								<div class="controls">
									<input type="password"  id="userPw" name="userPw" placeholder="비밀번호">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="userPw2">비밀번호
									확인 <sup>*</sup>
								</label>
								<div class="controls">
									<input type="password"  id="userPw2" name="userPw2"
										placeholder="비밀번호 확인">
								</div>
							</div>
							
							<div class="control-group">
							<label class="control-label" for="userPname">프로필 사진<sup>*</sup></label>
							<div class="controls">		                    
		                    <input id="userPname" type="file"  name="userPname"> <!--  multiple -->
		                    <div class="invalid-feedback">
		                    		사진 등록은 필수 입니다.
		                    </div>
		                  </div>
		                  <div class="control-group">
		                  <div class="controls" id="preview" >
		                   		<!-- <img id="prev-img" style="height:100px;width:100px;"> -->
		                  </div>
									</div>

							<div class="alert alert-block alert-error fade in">
								<button type="button" class="close" data-dismiss="alert">×</button>
								<strong>개인정보 입력 오류</strong> 개인정보 입력 여부를 다시 한번 확인해주세요. Ex)아이디 중복
								여부, 비밀번호 확인 여부
							</div>

							<h4>주소 입력</h4>
							<div class="control-group">
								<label class="control-label" for="userPhone">핸드폰번호<sup>*</sup></label>
								<div class="controls">
									<input type="text"  id="userPhone" name="userPhone" placeholder="핸드폰번호" /> <span></span>
								</div>
							</div>

								<div class="control-group-group">										
								<div id="postcodify" class="controls">									
								</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="userPost">우편번호<sup>*</sup></label>
									<div class="controls">
										<input type="text"  id="userPost" name="userPost" placeholder="우편번호" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="userAddress">도로명주소<sup>*</sup></label>
									<div class="controls">
										<input type="text"  id="userAddress" name="userAddress" placeholder="주소" /> <span></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="userDetailAddress">상세주소<sup>*</sup></label>
									<div class="controls">
										<input type="text"  id="userDetailAddress" name="userDetailAddress" placeholder="상세주소" /> <span></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="userAddress2">지번주소<sup>*</sup></label>
									<div class="controls">
										<input type="text"  id="userAddress2" name="userAddress2" placeholder="지번주소" /> <span></span>
									</div>

								</div>

								<div class="control-group">
									<label class="control-label" for="location">지역 카테고리 설정<sup>*</sup></label>
									<div class="controls">
										<select id="location">
											<option value="">선택</option>
											<option value="1">서울</option>
											<option value="2">광주</option>
											<option value="3">대구</option>
											<option value="4">대전</option>
											<option value="5">부산</option>
											<option value="6">울산</option>
											<option value="7">인천</option>
											<option value="8">제주도</option>
											<option value="9">울릉도</option>
											<option value="10">독도</option>
										</select>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="dealplace">거래 장소 <sup>*</sup></label>									 
									<div class="controls">
										<input type="text"  id="dealplace" name="dealplace"
											placeholder="직거래장소명을 입력하세요" /> <a href="http://maps.google.com/" target="_blank">Google Map</a> 
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="userLat">위도 <sup></sup></label>									 
									<div class="controls">
										<input type="text"  id="userLat" readonly name="userLat" 
											placeholder="" /> 
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="userLat">경도 <sup></sup></label>									 
									<div class="controls">
										<input type="text"  id="userLng" readonly name="userLng" 
											placeholder="" /> 
									</div>
								</div>
                      			
							
                   			 </div>
								 <div class="control-group">								 
                    			<div class="controls">
                     			 <input type="checkbox" name="agree" class="custom-control-input" id="agree" value="y">&nbsp&nbsp&nbsp 위 약관에 동의합니다.                    			
                    			</div>
                  				</div>



								<div class="control-group">
									<div class="controls">
										<input type="hidden" name="email_create" value="1"> 
										<input type="hidden" name="is_new_customer" value="1"> 
										<input id="regButton" class="btn btn-large btn-success" type="submit" value="회원가입" />
										
										<input type="hidden" name="email_create" value="1"> 
										<input type="hidden" name="is_new_customer" value="1"> 
										<input class="btn btn-large btn-danger" type="submit" value="취소" />
									</div>
								</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>


	<!-- Footer Include CSS START-->
	<%@ include file="/include/footer.jsp"%>
	<!-- Footer Include CSS END-->
	<script src="http://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>


	<script type="text/javascript">
    $(function() { 
    	$("#postcodify").postcodify({
        insertPostcode5 : "#userPost",
        insertAddress : "#userAddress",
        insertDetails : "#userDetailAddress",
        insertExtraInfo : "",
        insertJibeonAddress : "#userAddress2",
        insertEnglishAddress : "",
        hideOldAddresses : false,
        forceDisplayPostcode5 : true,
        focusKeyword : false,
        afterSelect : function() {
            $("#postcodify").find(".postcodify_search_result,.postcodify_search_status").remove();
        }, 
        onReady: function() {
            $("#guide_content div.section input.keyword").each(function() {
                $(this).width($(this).parents("div.section").width() - 130);
            });
        }
    }); 
  });
</script>
<script src="http://maps.google.com/maps/api/js?key=AIzaSyBehiOZQ0fZHaDwK0pRQfl-XzpDkR4rVQk&libraries=places&callback=initAutocomplete" async defer></script>
  <script src="/modules/gmaps.js"></script>
  <script>
  //https://fatc.club/2017/06/05/1949
  //https://developers.google.com/maps/documentation/javascript/examples/geocoding-simple?hl=ko
  var placename = document.getElementById('dealplace');
  var autocompleteResult;
  function initAutocomplete() {
	    // type : address ,establishment, geocode
	    autocompleteResult = 
	    	new google.maps.places.Autocomplete(
	    			placename, 
	    			{types: ['establishment']}		
	    	);
    	
    	autocompleteResult.addListener(
    			'place_changed', 
    			function() {
	    				var choicePlace = autocompleteResult.getPlace();
	    				var latVal = choicePlace.geometry.location.lat();
	    				var lngVal = choicePlace.geometry.location.lng();
	    	      
	    				//-----------입력폼에 위도/경도 값 셋팅
	    				document.getElementById("userLat").value = latVal;
	    	      document.getElementById("userLng").value = lngVal;
	    	      
	    	      //$("#lat").val(latVal);
	    	      
	    	      //-----------우측 영역에 선택장소 지도 그리기 --------------
	    	      var locate = {lat:latVal, lng:lngVal};
	    	  	  //div 태그에 맵 그리기	
	    	      var resultMap = new google.maps.Map(
	    	         document.getElementById('simple-map'), 
	    	         {zoom: 18, center: locate}
	    	      );
	    	      //marker, center locate 표시하기
	    	    	var marker = new google.maps.Marker(
	    	    		  {position:locate , map:resultMap}
	    	    	);
	    	     
	    	      
    			}
    	);
  }


</body>
</html>