<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%

	String inputYear = request.getParameter("year");
	String inputMonth = request.getParameter("month");



	Calendar cal = Calendar.getInstance();
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	
	
	if(inputYear != null || inputMonth != null)
	{
		selectYear = Integer.parseInt(inputYear);
		selectMonth = Integer.parseInt(inputMonth);
	}
	
	
	if(selectMonth == 0) {
		selectYear = selectYear -1;
		selectMonth = 12;
	}
	else if(selectMonth == 13) {
		selectYear = selectYear + 1;
		selectMonth = 1;
	}
	
	
	
	// 달력 그리기
	
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if(selectYear % 4 == 0 && selectYear % 100 != 0 || selectYear % 400 == 0)
		months[1] = 29;
	
	String[] weekName = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	int nalsu = 0;
	
	nalsu = (selectYear-1) * 365 + (selectYear-1) / 4 - (selectYear-1) / 100 + (selectYear-1) / 400;
	
	for(int i = 0; i < selectMonth-1; i++) {
		nalsu += months[i];
	}
	nalsu++;
	
	
	int week = 0;
	week = nalsu % 7;
	

	// 마지막 날짜 변수 선언
	int lastDay = 0;
	lastDay = months[selectMonth - 1];

	// 달력을 그릴 문자열 변수 선언
	String calStr = "";

	calStr += "<table border='1'>";

	calStr += "<tr>";
	for (int i = 0; i < weekName.length; i++) {

		if (i == 0)
			calStr += "<th class='sun'>" + weekName[i] + "</th>";
		else if (i == 6)
			calStr += "<th class='sat'>" + weekName[i] + "</th>";
		else
			calStr += "<th>" + weekName[i] + "</th>";
	}
	calStr += "</tr>";

	calStr += "<tr>";
	for (int i = 1; i <= week; i++)
		calStr += "<td></td>";

	for (int i = 1; i <= lastDay; i++) {
		week++;
		
		calStr += "<td>" + i + "</td>";
	 
		if (week % 7 == 0)
			calStr += "</tr></tr>";
	}

	for (int i = 0; i <= week; i++, week++) {
		if (week % 7 == 0)
			break;

		calStr += "<td></td>";
	}

	if (week % 7 != 0)
		calStr += "</tr>";

	calStr += "</table>";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>

<style type="text/css">

	form {
		margin-left: 82px;
	}
	
	.yearMonth {
		border: 0px;
		width: 50px;
		text-align: right;
		font-size: 20px;
	}

</style>



<script type="text/javascript">
	function actionCalendar(num) {
		
		var yearStr = document.getElementById("year").value;
		var monthStr = document.getElementById("month").value;
		
		var year = Number(yearStr);
		var month = Number(monthStr);
		
		month = month + num;
		
		if(month == 0)
		{
			year = year + num;
			month = 12;
		}
		else if(month == 13)
		{
			year = year + num;
			month = 1;
		}
	
		
		document.getElementById("year").value = year;
		document.getElementById("month").value = month;

		
		document.form.submit();
	}

</script>

</head>
<body>

<!-- 
	○ 데이터 송수신 관련 실습07
	
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	     
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구현된다.
	   
	   - 년도 구성은 현재 년도 기준 이전 10년 이후 10년 으로 구성한다.
	   
	   - 월은 1월 부터 12월 까지로 구성한다.
	    
	    	    
	   - 페이지 레이아웃
	     ------------------------------------------------------------
	    
	              ◀ 2022년 10월 ▶
	        
	           [ 달력이 그려지는 위치 ] 
	     
	     ------------------------------------------------------------
	     
	   - 『◀ 이나 ▶』 클릭 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다. 
	  
	   - 사용자의 최초 요청 페이지는
	     ~/SendAndReceive07.jsp 로 한다.
-->

<div>
	<h1>데이터 송수신 관련 실습07</h1>
	<h2>달력 요청 및 응답2</h2>
	<hr>
</div>


<div>
	<form action="" method="post">
		<!-- <button onclick="actionCalendar(-1)">◀</button> -->
		<a href="SendAndReceive07_1.jsp?year=<%=selectYear %>&month=<%=selectMonth - 1%>">◀</a>
		<!-- 년도 월 -->
		<input class="yearMonth" type="text" id="year" name="year" value=<%=selectYear %>>년
		<input class="yearMonth" type="text" id="month" name="month" value=<%=selectMonth %>>월
		<!-- <button onclick="actionCalendar(+1)">▶</button> -->
		 <a href="SendAndReceive07_1.jsp?year=<%=selectYear %>&month=<%=selectMonth + 1%>">▶</a>
		<!--  a태그활용해서 링크로 처리해봐라.... -->
	</form>
</div>

<div>
	<%=calStr %>
</div>


</body>
</html>