<%@ page contentType="text/html; charset=UTF-8"%>

<%
	
	// 한글 처리를 위한 인코딩 방식 지정(한글 깨짐 방지)
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지로부터 넘어온 데이터 수신
	String name = request.getParameter("userName");
	String korStr = request.getParameter("korScore");
	String engStr = request.getParameter("engScore");
	String matStr = request.getParameter("matScore");
	
	
	int kor = Integer.parseInt(korStr);
	int eng = Integer.parseInt(engStr);
	int mat = Integer.parseInt(matStr);
	
	int tot = kor + eng + mat;
	double avg = tot / 3.0;
	
	String avgStr = String.format("%.1f", avg);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
</head>
<body>


	<div>
		<h1>데이터 송수신 관련 실습 02</h1>
		<hr>
	</div>
	
	<div>
		<p>이름 : <%=name %></p>
		<p>국어점수 : <%=kor %></p>
		<p>영어점수 : <%=eng %></p>
		<p>수학점수 : <%=mat %></p>
	</div>
	
	<div>
		<%=name %>님, 성적처리가 완료되었습니다.<br>
		회원님의 점수는 국어: <span style="color: Red"><%=kor %></span>점,
		 영어:<span style="color: Red"><%=eng %></span>점,
		  수학:<span style="color: Red"><%=mat %></span>점 입니다.<br>
		총점은 <span style="color: Blue"><%=tot %></span>점, 평균은 <span style="color: Blue"><%=avgStr %></span>점 입니다.
	</div>
	
	
	
	<!-- 

	     
	   - 성적처리 버튼 클릭 시
	     『홍길동님, 성적처리가 완료되었습니다.
	       회원님의 점수는 국어:xx점, 영어:xx점, 수학:xx점 입니다.
	       총점은 xxx점, 평균은 xx.x점 입니다.』
	     라는 내용을 출력하는 JSP 페이지를 작성한다.
	     (Receive01.jsp)
	     
	   - 사용자의 최초 요청 페이지는
	     『http://localhost:8090/WebApp06/Send02.jsp』로 한다.
-->
	
</body>
</html>