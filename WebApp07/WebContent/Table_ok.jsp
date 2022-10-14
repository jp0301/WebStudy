<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	/* 	
	int width = Integer.parseInt(request.getParameter("su1"));
	int height = Integer.parseInt(request.getParameter("su2"));
	
	StringBuffer sb = new StringBuffer();
	
	sb.append("<table>");
	
	int last = 1;
	
	for(int i=1; i<=height; i++)
	{
		sb.append("<tr>");		
		for(int j=1; j<=width; j++)
		{
			sb.append(String.format("<td>%d</td>", last));
			//sb.append("<td> </td>");
			last++;
		}
		sb.append("</tr>");
	}
	
	sb.append("</table>"); 
	*/
	
	String s1str = request.getParameter("su1");
	String s2str = request.getParameter("su2");
	
	int n1 = 0;
	int n2 = 0;
	
	// 테이블의 셀 안에서 1씩 증가시켜나갈 변수 선언 및 초기화
	int n = 0;
	
	// 수신된 데이터에 대한 형 변환
	try {
		n1 = Integer.parseInt(s1str);
		n2 = Integer.parseInt(s2str);

	}
	catch(Exception e) {
		System.out.println(e.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok.jsp</title>
<link rel="stylesheet" type="test/css" href="css/main.css">
<style type="text/css">
	table {
		border: 1px solid #9292A7;
		border-radius: 10px;
		background-Color: #525266;
		color: #fff;
		text-align: center;
	}
	td {
		padding: 15px;
	}
	td:hover {
		border-radius: 4px;
		background-Color: #9F9FF1;
		transition: all 0.5s;
	}
</style>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 추가 관찰</h1>
	<hr>
</div>

<div>
	<h2>Table.jsp → Table_ok.jsp</h2>
</div>
	<%-- <%=sb %> --%>
	
<div>
	<table border="1">
		<%
			for(int i=0; i<n2; i++) // 세로
			{
		%>
				<tr>
					<%
					for(int j=0; j<n1; j++) // 가로
					{
					%>
						<td> <%=++n %> </td>
					<%
					}
					%>
											
				</tr>
		<%
			}
		%>
	</table>
</div>

	
</body>
</html>






















