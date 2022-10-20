<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberSelect.css">

<script type="text/javascript">
	function sendIt()
	{
		var f = document.getElementById("myForm")
		//var f = document.formS[0]
		
		if(!f.userName.value)
		{
			alert("이름을 입력해주세요.");
			f.userName.focus();
			return;
		}
		
		if(!f.userBirth.value)
		{
			alert("생일을 입력해주세요.");
			f.userBirth.focus();
			return;
		}
		
		
		f.submit();
	}
	

</script>

</head>
<body>


<!--
	○ SessionTest01 에서 사용자로부터 이름과 생일을 입력받아
	   SessionTest02 로 전송~!!!
	   
	   SessionTest02 에서 사용자로부터 아이디와 패스워드 입력받아
	   앞에서 전달받은 이름과 생일을 함께
	   SessionTest03 으로 전송~!!!
	   
	   SessionTest03 에서
	   전달받은 이름, 생일, 아이디, 패스워드 출력~!!!
	   
	   01 -------------------→ 02 -------------------→ 03
	   이름, 생일               아이디, 패스워드         이름, 생일, 아이디, 패스워드
	   입력                     입력                     출력
	                            -getParameter()          - getAttribute()
	   
	   ※ 즉, 01 에서 02 로 넘겨줄 땐 getParameter
	      02 에서 03 으로 넘겨줄 때는 getParameter 와 getAttribute 로 세션 활용
	      01 에서 03 으로 직접 넘겨줄 수 없기 때문에 세션에 저장
	      
	   ※ session 외에 hidden 을 이용하여 데이터 전달 가능
	   
-->


<div>
	<h1>데이터 전송 및 수신</h1>
	<h2>WebApp15/SessionTest01.jsp</h2>
	<p>이름과 생일</p>
	<hr>
</div>


<div>
	<form action="SessionTest02.jsp" method="post" id="myForm">
		이름 : <input type="text" class="txt" name="userName" placeholder="박○○">
			<br>
		생일 : <input type="text" class="txt" name="userBirth" placeholder="19980301">
	</form>
	<br><br>
	<button type="button" onclick="sendIt()">다음 페이지로 전송</button>
</div>





</body>
</html>