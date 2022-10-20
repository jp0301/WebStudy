<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("userName");
	String birth = request.getParameter("userBirth");
	
	session.setAttribute("userName", name);
	session.setAttribute("userBirth", birth);
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberSelect.css">

<script type="text/javascript">

	function sendIt()
	{
		var f = document.getElementById("myForm")
		
		if(!f.userId.value)
		{
			alert("아이디를 입력해주세요.");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("비밀번호를 입력해주세요.");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
	}

</script>


</head>
<body>


<div>
	<h1>세션 처리</h1>
	<h2>WebApp15/SessionTest02.jsp</h2>
	<hr>
</div>


<div>
	<form action="SessionTest03.jsp" method="post" id="myForm">
	<!-- <input type="hidden" name="userName" value=<%=userName %>>-->
		이름 : <%=name %>
		<br>
		생일 : <%=birth %>
		<hr>
		아이디 : <input type="text" name="userId">
		<br>
		패스워드 : <input type="password" name="userPwd">
		 
	</form>
	<br><br>
	<button type="button" onclick="sendIt()">입력</button>
</div>




</body>
</html>