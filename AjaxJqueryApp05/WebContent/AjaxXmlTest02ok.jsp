<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%><%
	// AjaxXmlTest02ok.jsp
	
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String hobby = request.getParameter("hobby");
	int count = Integer.parseInt(request.getParameter("count"));
	

	response.setContentType("text/xml");
%><?xml version="1.0" encoding="UTF-8" ?>
<list>
	<%
	for(int i=1; i<=count; i++)
	{
	%>
	<comment num="<%=i %>">
		<id><%=i %></id>
		<name><%=name + i %></name>
		<age><%=age %></age>
		<hobby><%=hobby + i %></hobby>
	</comment>	
	<%
	}
	%>
</list>

<!--
	<records id="3">
		<name></name>
		<age></age>
		<hobby></hobby>
	</records>
-->
