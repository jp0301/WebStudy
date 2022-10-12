<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 이전 페이지(Senc04.jsp)로부터 수신
	
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");

	
	String id = request.getParameter("userId");										//-- 필수 항목 수신 - 아이디
	String pwd = request.getParameter("userPwd");									//-- 필수 항목 수신 - 패스워드
	String name = request.getParameter("userName");									//-- 필수 항목 수신 - 이름
	String tel = request.getParameter("userTel");									//-- 필수 항목 수신 - 전화번호
	
	
	String userGender = "확인불가";
	userGender = request.getParameter("userGender");
	
	String userCity = "확인불가";
	userCity = request.getParameter("userCity");

	
	//check~!!!
	// - 다중 선택 제어
	// - 배열 수신
	
	String[] subjectArr = request.getParameterValues("userSubject");
	
	String userSubject = "";
	
	if(subjectArr.length != 0)
	{	
		for(int i=0; i<subjectArr.length; i++) // 배열방의 갯수만큼 반복문 수행
		{
			 userSubject += subjectArr[i].toString() + " ";
		}	
	}
	else
	{
		userSubject = "선택내용없음";
	}
	
	// 수신된 데이터를
	// 쿼리문을 통해 DB 액션 처리하는 과정을
	// 염두하며 작업을 진행하자~!!!
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04_1.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
</head>
<body>

	<div>
		<h1>데이터 송수신 관련 실습 04_1</h1>
		<hr>
	</div>
	

<div>
	아이디:<%=id %> <br>
	패스워드:<%=pwd %> <br>
	이름:<%=name %> <br>
	전화번호:<%=tel %> <br>
	<br><br>
	
	성별:<%=userGender %> <br>
	지역:<%=userCity %> <br>
	수강과목:<%=userSubject %> <br>
	<br><br>

</div>
	
</body>
</html>