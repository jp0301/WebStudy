<%@ page contentType="text/html; charset=UTF-8"%>

<%
	
	

	String yearStr = String.format("%tY", java.util.Calendar.getInstance());
	String monthStr = String.format("%tm", java.util.Calendar.getInstance());

	int year = Integer.parseInt(yearStr);
	int month = Integer.parseInt(monthStr);

	
	
	
	
	

	String yearlist = "<option>" + year + "</option>";
	yearlist += "<option>" + month + "</option>";

	
	
	request.getParameterValues(name)
%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">




</head>

<body>

	<!-- 
	○ 데이터 송수신 관련 실습06
	
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	     
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구현된다.
	   
	   - 년도 구성은 현재 년도 기준 이전 10년 이후 10년 으로 구성한다.
	   
	   - 월은 1월 부터 12월 까지로 구성한다.
	    
	    	    
	   - 페이지 레이아웃
	     ------------------------------------------------------------
	    
	     [ 2022 ▼ ] 년 [ 10 ▼ ] 월
	        └2012 ~ 2032년 └1~12가 들어있음
	        
	     [ 달력이 그려지는 위치 ] 
	     
	     [ 2012 ▼ ] 년 [ 10 ▼ ] 월
	        └2002 ~ 2022년 └1~12가 들어있음
	     
	     ------------------------------------------------------------
	     
	   - 원하는 년과 월을 선택 시
	   
	     『』 
	        
	     와 같은 내용을 출력하는 JSP 페이지를 작성한다.
	     (Receive05.jsp)
	  
	   - 사용자의 최초 요청 페이지는
	     ~/SendAndReceive06.jsp 로 한다.
	     
-->

	<div>
		<h1>데이터 송수신 관련 실습 06</h1>
		<h2>달력 요청 및 응답</h2>
		<hr>
	</div>

	<div>
		<%=year %>
		<%=month %>
	</div>

	<div>
		<form action="SendAndReceive06.jsp" method="post">
			<div>
				<select id="year" name="year">
				</select>년 
				<select id="month" name="month">

				</select>월
			</div>

		</form>

	</div>



	<div>
		<!-- 달력을 그리게 될 지점 -->
	</div>


</body>
</html>