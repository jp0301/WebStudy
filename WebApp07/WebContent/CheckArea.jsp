<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckArea.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">

<script type="text/javascript">
</script>

</head>
<body>


<div>
	<h1>JSP를 이용한 데이터 송수신 추가 관찰</h1>
	<hr>
</div>

<div>
	<h2>CheckArea.jsp → CheckArea_ok.jsp</h2>
	
	<form action="CheckArea_ok.jsp" method="post">
		이름 <input type="text" name="name" class="txt">
		<br>
		
		메모
		<br>
		<textarea rows="5" cols="30" name="memo"></textarea>
		<br><br>
		
		이상형
		<br>
		<label><input type="checkbox" name="checkGroup" value="아이유">아이유</label>
		<label><input type="checkbox" name="checkGroup" value="한소희">한소희</label>
		<label><input type="checkbox" name="checkGroup" value="RM">RM</label>
		<label><input type="checkbox" name="checkGroup" value="박서준">박서준</label>
		<br>
		<label><input type="checkbox" name="checkGroup" value="이종석">이종석</label>
		<label><input type="checkbox" name="checkGroup" value="공유">공유</label>
		<label><input type="checkbox" name="checkGroup" value="슬기">슬기</label>
		<label><input type="checkbox" name="checkGroup" value="손석구">손석구</label>
		<br><br>
		
		<input type="submit" value="전송" class="btn" style="width: 200px;">
	</form>

</div>


</body>
</html>