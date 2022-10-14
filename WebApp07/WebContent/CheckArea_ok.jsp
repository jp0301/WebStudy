<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/*
	String name = request.getParameter("name");
	String memo = request.getParameter("memo");	
	String memo2 = memo.replace("\r\n","<br>");

	String[] idolArr = request.getParameterValues("checkGroup"); 
	String idolStr = "";
	int count = 0;
	if(idolArr.length != 0)
	{
		for(int i=0; i<idolArr.length; i++)
		{
			idolStr += idolArr[i] + " ";
			
			count++;
			if(count % 3 == 0)
			{
				idolStr += "<br>";
			}
		}
	}
	else
	{
		idolStr = "이상형 선택 없음";	
	} 
	*/
	
	
	// 이전 페이지(CheckArea.jsp)로부터 데이터 수신
	
	// 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	
	
	//이름 데이터 수신
	String name = request.getParameter("name");
	
	// check~!!
	//메모 데이터 수신
	String memo = request.getParameter("memo");
	memo = memo.replaceAll("\n", "<br>");
	// 혹시나 replaceAll 이 안먹힐 수 있다. JDK 1.5 이후에서 사용가능하다.
	// replaceAll 을 통해 처리한 결과물을 다시 memo 변수에 대입
	// ex) "나는\n왜인지\n박서준이\n점점 더 좋아지고 있다.\n"
	//     → "나는<br>왜인지<br>박서준이<br>점점 더 좋아지고 있다.<br>"
	
	// 이상형 데이터 수신
	//String checkGroup = request.getParameter("checkGroup");
	
	// ※ 같은 이름 속성의 값을 가진 데이터 여러 개를 받는 (수신하는 ) 경우
	//    이를 배열로 처리해야 한다.
	//    『request.getParameterValues(name)』 메소드 사용
	String[] checkGroup = request.getParameterValues("checkGroup"); 
	
	// check~!! 이전과 다른 방식
	// 배열 데이터를 수신하여 처리할 경우...
	// 수신된 데이터가 전혀 없는 경우는(존재하지 않는 경우)
	// 배열의 상태가 null이 되어버리기 때문에
	// null 에 대한 검사가 반드시 필요하다.
	
	String str = "";
	int count = 0;
	if(checkGroup != null)
	{
		for(String item: checkGroup)
		{
			str += " [" + item + "] ";
		}
	}
	else
	{
		str = "이상형 선택 없음";	
	} 
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckArea_ok.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 추가 관찰</h1>
	<hr>
</div>

<div>
	<h2>CheckArea.jsp → CheckArea_ok.jsp</h2>
	<%-- 	
	<h3>이름</h3>
	<%=name %><br>
	
	<h3>메모</h3>
	<textarea rows="5" cols="30" readonly="readonly"><%=memo %></textarea>
	<br>
	<%=memo2 %>

	<br><br>
	
	<h3>이상형</h3>
	<%=idolStr %>
	--%>
</div>


<div>
	<h3>수신 데이터</h3>
	<h4> 이름 : <%=name %></h4>
	<h4>메모</h4>
	<p><%=memo %></p>
	
	<h4>이상형 : <%=str %></h4>
</div>


</body>
</html>