<%@ page contentType="text/html; charset=UTF-8"%>
<%

/*
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");

	
	String str = "";
	
	str += name + "님,  회원가입이 완료되었습니다.<br>";
	str += "회원님께서 등록하신 전화번호는 " + tel + " 입니다.";
*/
	 
	 // 스크립릿 영역(자바 코드를 기술할 수 있는 영역)
	 
	 
	 // 이전페이지(Send01.html) 로부터 데이터 수신
	 // → userName, userTel
	 // → request.getParameter("userName");
	 // → request.getParameter("userTel");
	 
	 
	 request.setCharacterEncoding("UTF-8");
	 
	 String name = request.getParameter("userName");
	 String tel = request.getParameter("userTel");
	 
	 //String name="홍길동";
	 
	 
	 
	 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01.jsp</title>

</head>

<body>


<%-- 	<div>
		<form>
			<div><%=str %></div>		
		</form>
	</div>

--%>



<div>
	<h1>데이터 송수신 관련 실습 01</h1>
	<hr>
</div>

<div>
	<h2>넘어온 데이터 확인</h2>
	
	<!-- 테스트 -->
	<p>userName: <%=name %></p>
	<p>userTel: <%=tel %></p>
	
	
	<form>
		<!-- <span style="color: blue;">홍길동</span>님, 회원가입이 완료되었습니다.<br>
		회원님께서 등록하신 전화번호는 <span style="color: red">010-1111-1111</span> 입니다.<br>
		 -->
		 
		 <span style="color: blue;"><%=name %></span>님, 회원가입이 완료되었습니다.<br>
		회원님께서 등록하신 전화번호는 <span style="color: red"><%=tel %></span> 입니다.<br>
		
	</form>
</div>

</body>
</html>