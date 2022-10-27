<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<div>
		<h1>JSTL 코어(Core) 입력</h1>
		<h2>MemberInsertForm.jsp</h2>
		<hr />
	</div>
	
	<div>
		<form action="MemberInsert.jsp" method="post">	
		
				<table class="table">
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>주소</th>
					</tr>


					
  					<c:forEach var="a" begin="1" end="5" step="1">
						<tr>
							<td>
								<input type="text" name="name${a}" class="txt" />
							</td>
							<td>
								<input type="text" name="tel${a}" class="txt" />
							</td>
							<td>
								<input type="text" name="addr${a}" class="txt" />
							</td>
						</tr>
					</c:forEach>
					
					<tr>
						<td  colspan="3">
							<button type="submit" class="btn" style="width: 100%; height: 50px;">입력완료</button>
						</td>
					</tr>
					
					
					
				</table>
				
			</form>
	</div>
	
	


</body>
</html>