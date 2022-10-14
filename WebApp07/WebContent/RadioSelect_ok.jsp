<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로부터 데이터 수신
	//-- name, gender, major, hobby
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String genderEng = request.getParameter("gender");
	
	String gender = "";
	if(genderEng.equals("M"))
		gender = "남자";
	else if(genderEng.equals("F"))
		gender = "여자";
	else
		gender = "확인불가";

	String major = request.getParameter("major");
	
	String[] hobbyArr = request.getParameterValues("hobby");
	// 다중 선택이 가능한 셀렉트박스일 경우... 배열 형태로 수신
	
	String hobby = "";
	if(hobbyArr != null) {
		for(String item : hobbyArr)
		{
			hobby += "[" + item + "] ";			
		}
	}
	else
		hobby = "선택하지 않았음";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">

<style type="text/css">
	.container {
		color: white;
		background-Color: #3C4456;
		border-radius: 6px;
		padding: 5px;
		width: 25%;
	}
	
	.container:hover {
		background-Color: white;
		transition: all 1s;
		color: black;
	}
	
	.container > h3 {
		color: #3C4456;
		font-weight: bold;
		text-align: center;
		background-Color: white;
		border-radius: 6px;
		margin-top: 0;
		padding: 10px;
	}
	
	p {
		margin-left: 15px;
	}

	

</style>

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 추가 관찰</h1>
	<hr>
</div>


<div>
	<h2>RadioSelect.jsp → RadioSelect_ok.jsp</h2>
</div>


<div class="container">
	<h3>수신한 데이터</h3>
	
	<p>이름 : <%=name %></p>
	
	<p>성별 : <%=genderEng %>(<%=gender %>)</p>
	
	<p>전공 : <%=major %></p>
	
	<p>취미 : <%=hobby %></p>
	
</div>


</body>
</html>