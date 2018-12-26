<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page import="java.net.URLDecoder"%>

<div id="sidebar" class="span3">
        <hr class="soft"/>
		&nbsp&nbsp&nbsp&nbsp  	
		<button class="btn btn-info"> <h4>일반 상품</h4></button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	
		<button class="btn btn-warning"> <h4>경매 상품</h4></button>		
		<hr class="soft"/>
		 
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
			<li class="subMenu"><a> 컴퓨터 PC / 부품</a> 
				<ul style="display:none">
				<li><a href="/productSideServlet?cate_seq=37&array=row"><i class="icon-chevron-right"></i>PC 본체</a></li>
				<li><a href="/productSideServlet?cate_seq=36&array=row"><i class="icon-chevron-right"></i>PC 세트</a></li>			
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>노트북 / 넷북</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>아이패드</a></li>				
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>서버PC</a></li>				
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>LCD 모니터</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>CRT 모니터</a></li>				
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>CPU / 메인보드</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>메모리 / 하드 / 그래픽카드</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>프린터 / 스캐너 / 복합기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>파워 / 케이스</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>키보드 / 마우스 / USB / 기타</a></li>				
				</ul>
			</li>
			<li class="subMenu"><a> 휴대폰 / 통신 </a>
			<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>스마트폰</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>전화기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>케이스</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>악세</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>											
			</ul>
			</li>
			<li class="subMenu"><a>유아 / 아동용품</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>아동의류</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>잡화</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>완구</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>유모차</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>위생용품</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>교육용품</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>										
			</ul>
			</li>
			<li class="subMenu"><a>자동차</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>삼성자동차</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>현대자동차</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기아자동차</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>쌍용자동차</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>GM대우</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>쉐보레 자동차</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>승합/화물차</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>오토바이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기아 / 수입차</a></li>														
			</ul>
			</li>
			<li class="subMenu"><a>자동차 부품</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>네비게이션</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>블랙박스 / 경보기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>카오디오 / AV</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>전조등 / 후미등</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>타이어 / 체인 / 휠</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>시트 / 매트 / 쿠션</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>사이드 / 백미러</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>전기 / 램프</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>배터리 / 오일</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>											
			</ul>
			</li>
			<li class="subMenu"><a>오토바이</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>스쿠터</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>3륜 오토바이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>4륜 오토바이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>혼다 오토바이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>야마하 오토바이</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>효성 오토바이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>대림 오토바이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>할리데이슨</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>BMW 오토바이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>스트키 오토바이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>가와사키 오토바이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타 오토바이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타 원동기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>헬멧 장갑</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타부품</a></li>			
			</ul>
			</li>
			<li class="subMenu"><a>생활가전</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>에어컨</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>선풍기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>세탁기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>냉장고</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>김치냉장고</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>밥솥</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>청소기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>식기세척기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>음식물처리기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>정수기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>온수기</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>비데</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>전자레인지 / 오븐</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>난로 / 히터 /난방</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>각종 가전 부품</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타가전</a></li>											
			</ul>
			</li>
			<li class="subMenu"><a>생활가구</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>침대</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>쇼파</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>장농</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>책상</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>의자</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>식탁</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>장식장</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>수납장</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>화장대</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>테이블</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>										
			</ul>
			</li>
			<li class="subMenu"><a>패션의류</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>(여)상의</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>(여)하의</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>(여)점퍼 / 자켓 / 코트</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>(여)정장 / 가죽 / 모피</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>(남)상의</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>(남)하의</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>(남)점퍼 / 자켓 / 코트</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>(남)정장 / 가죽 / 모피</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>													
			</ul>
			</li>
			<li class="subMenu"><a>패션잡화</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>모자</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>시계</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>가방</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>핸드백</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>지갑</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>벨트</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>(남)신발</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>(여)신발</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>안경 / 선글라스</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>											
			</ul>
			</li>
			<li class="subMenu"><a>디지털가전</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>TV</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>VCR</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>캠코더</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>홈시어터</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>프로젝터</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>전자사전</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>MP3 / 오디오</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>												
			</ul>
			</li>
			<li class="subMenu"><a>화장품 / 미용</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>스킨케어</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>메이크업</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>마스크 / 팩</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>바디용품</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>클린징</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>헤어 / 탈모</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>향수</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>남성화장품</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>
															
			</ul>
			</li>
			<li class="subMenu"><a>카메라</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>디카(일반)</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>디카(전문)</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>토이카메라</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>필름카메라</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>중형카메라</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>렌즈 / 컨버터 / 필터</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>삼각대 / 플래쉬</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>가방 / 배터리</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>악세기타</a></li>										
			</ul>
			</li>
			<li class="subMenu"><a>게임기 / 오락</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>PSP</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>PS2</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>PS3</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>닌텐도</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>닌텐도 wii</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>NDSL</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>XBOX</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>소프트웨어</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>												
			</ul>
			</li>
			<li class="subMenu"><a>피규어</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>밀리터리</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>애니메이션</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>영화</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>게임</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>스포츠</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>각종인형</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>													
			</ul>
			</li>
			<li class="subMenu"><a>사무용품</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>팩스 / 복사기 / 복합기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>진열장</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>칸막이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>칠판</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>책상 / 의자</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>금고 / 수납</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>히터</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>전기난로</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>연탄난로</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>											
			</ul>
			</li>
			<li class="subMenu"><a>스포츠 / 레저</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>헬스기구</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>골프용품</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>스키용품</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>낚시용품</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>등산용품</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>텐트용품</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>라켓 / 공</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>인라인 / 보드</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>자전거</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>축구 / 농구 /야구</a></li>		
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>									
			</ul>
			</li>
			<li class="subMenu"><a>귀금속 / 악세</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>목걸이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>귀걸이</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>펜던트</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>반지 / 커플링</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>팔찌</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>세트</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>악세사리</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타 악세</a></li>												
			</ul>
			</li>
			<li class="subMenu"><a>상품권 / 쿠폰</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>문화상품권</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>도서상품권</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>백화점상품권</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>주유상품권</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>모바일상품권</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>쿠폰</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>														
			</ul>
			</li>
			<li class="subMenu"><a>애완용품</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>애완용 집</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>애완용 장난감</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>애완용 기타용품</a></li>													
			</ul>
			</li>
			<li class="subMenu"><a>도서</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>만화</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>전집</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>소설</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>패션잡지</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>월간잡지</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>학습교육</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>												
			</ul>
			</li>
			<li class="subMenu"><a>악기</a>
				<ul style="display:none">
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>피아노</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>키보드 피아노</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>디지털악기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>관악기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>현악기</a></li>	
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>국악기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>타악기</a></li>
				<li><a href="products.jsp"><i class="icon-chevron-right"></i>기타</a></li>														
			</ul>
			</li>			
			
		</ul>
		<br/>
		
		<c:forEach var="cookies" items="${cookie}"  varStatus="status">
                		<c:choose>
       					     <c:when test = "${cookies.key == 'JSESSIONID'}">
					         </c:when>
					         <c:otherwise>
					          <div class="thumbnail">
									<img width="150" src="cdir/product/${fn:split(URLDecoder.decode(cookies.value.value, 'UTF-8'),'++')[0]}" alt="Bootshop panasonoc New camera"/>
									<div class="caption">
									  <h5>${fn:split(URLDecoder.decode(cookies.value.value, 'UTF-8'),'++')[1]}</h5>
										<h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">${fn:split(URLDecoder.decode(cookies.value.value, 'UTF-8'),'++')[2]}원</a></h4>
									</div>
								  </div><br/>	 			              
		 								   
					         </c:otherwise>
				      </c:choose>
					</c:forEach>	
		 
			
			<div class="thumbnail">
				<img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
				<div class="caption">
				  <h5>Payment Methods</h5>
				</div>
			  </div>
	</div>