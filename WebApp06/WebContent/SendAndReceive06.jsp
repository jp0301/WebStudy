<%@ page contentType="text/html; charset=UTF-8"%>

<%

	// 셀렉트박스로 선택한 년도 월
	String s_Year = request.getParameter("year");
	String s_Month = request.getParameter("month");
	
	
	//현재 년 월 일 가져오기
	String yearStr = String.format("%tY", java.util.Calendar.getInstance());
	String monthStr = String.format("%tm", java.util.Calendar.getInstance());
	String dayStr = String.format("%td", java.util.Calendar.getInstance());
	int c_year = Integer.parseInt(yearStr);
	int c_month = Integer.parseInt(monthStr);
	int c_day = Integer.parseInt(dayStr);
	

	
	// 최초 요청했을 때 현재 년도와 월을 설정시킨다.
	int basicYear = c_year;
	int basicMonth = c_month;
	
	if (s_Year != null || s_Month != null)
	{
		basicYear = Integer.parseInt(s_Year);
		basicMonth = Integer.parseInt(s_Month);
	}
	
	// ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	// 년 입력
	StringBuffer sb = new StringBuffer();
	for(int year = basicYear - 10; year <= basicYear + 10; year++)
	{
		if(s_Year == null && year == c_year)
			sb.append("<option value='" + year + "' selected='selected'>" + year + "</option>");
		else if(s_Year != null && Integer.parseInt(s_Year)==year)
			sb.append("<option value='" + year + "' selected='selected'>" + year + "</option>");
		else
			sb.append("<option value='" + year + "'>" + year + "</option>");
	}
	
	// ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	// 월 입력
	StringBuffer sb2 = new StringBuffer();
	for(int month = 1; month <= 12; month++)
	{
		if(s_Month == null && basicMonth == c_month)
			sb2.append("<option selected=\"selected\">" + month + "</option>");
		else if(s_Month != null && Integer.parseInt(s_Month)==month)
			sb2.append("<option selected=\"selected\">" + month + "</option>");
		else
			sb2.append("<option>" + month + "</option>");
	}
	
	// ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	
	// 날짜 계산
	
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if(basicYear % 4 == 0 && basicYear % 100 != 0 || basicYear%400 == 0)
		months[1] = 29; //2월
		
	String[] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 입력받은 년도 이전 년도까지의 날 수 계산
	
	int nalsu = 0;
		
	for(int i=0; i < basicYear; i++)
	{
		if((basicYear % 4 == 0 && basicYear % 100 != 0) || basicYear  % 400 == 0)
			nalsu += 366;
		
		else
			nalsu += 365;
	}
	// 입력한 월의 이전 월까지 계산
	for(int i=0; i<basicMonth-1; i++)
	{
		nalsu += months[i];
	}
	
	int week = nalsu % 7;
	int lastDay = months[basicMonth - 1];
	
	// ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
	
	// 달력 그리기
	
	String cal = "";
	
	cal += "<table border='1'>";

	cal += "<tr>";	
	for(int i=0; i<weekNames.length; i++)
	{
		cal += "<th>" + weekNames[i] + "</th>";		
	}
	cal += "</tr>";
	
	// 빈칸발생
	cal += "<tr>";
	for(int i=1; i<=week; i++)
		cal += "<td></td>";
	//날짜출력
	for(int i=1; i<=lastDay; i++)
	{
		week++;
		
		cal += "<td>" + i + "</td>";
		
		if(week%7==0)
			cal+="</tr></tr>";
	}
	
	for(int i=0; i<=week; i++, week++)
	{
		if(week%7==0)
			break;
		
		cal+= "<td></td>";
	}
	
	if(week%7 != 0)
		cal+= "</tr>";
	
	cal += "</table>";
	
	
%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function test_calender(obj) {
		obj.submit();
	}

</script>


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
		<form action="" method="get">
			<div>
				<select id="year" name="year" onchange="test_calender(this.form)">
					<%=sb %>
				</select>년 
				<select id="month" name="month" onchange="test_calender(this.form)">
					<%=sb2 %>
				</select>월
			</div>

		</form>

	</div>



	<div>
		<!-- 달력을 그리게 될 지점 -->
		<%=cal %>
	</div>


</body>
</html>