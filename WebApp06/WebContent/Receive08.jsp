<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 이전 페이지(Send08.jsp) 로부터 데이터 수신
	//-- gugudan
	
	String gugudanStr = request.getParameter("gugudan");

	int gugudan = Integer.parseInt(gugudanStr);
	
	String result = "";
	
	for(int i=1; i<=9; i++)
			result += String.format("%d * %d = %d<br>", gugudan, i , (gugudan * i));

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 
	○ 데이터 송수신 관련 실습08
	
	   - a 태그(링크 태그)에 대한 반복문 처리를 하는 JSP 페이지를 구성한다.
	   
	   - 구구단 리스트를 동적으로 구성하여
	     사용자의 선택에 따른 결과 페이지를 출력해주는 형태의 페이지로 구현한다.
	     
	   - submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	    	    
	   - 페이지 레이아웃
	     ------------------------------------------------------------
	    
	     구구단 선택
	     
	     1단
	     2단
	     3단
	     4단
	     
	      :
	      
	     8단
	     9단
	     
	     
	     ------------------------------------------------------------
	     
	   - 단 항목을 선택하여 클릭 시
	     해당 단(구구단)을 출력해주는 형태의 페이지로 구현한다.
	
	   - 사용자의 최초 요청 페이지는  ~/Send08.jsp 로 한다.
	   
-->

	<div>
		<h1>데이터 송수신 관련 실습 08</h1>
		<h2>구구단 처리</h2>
		<hr>
	</div>
	
	<div>
		<p>수신 데이터 : <%=gugudan %></p>
		<%=result %>
	</div>


</body>
</html>