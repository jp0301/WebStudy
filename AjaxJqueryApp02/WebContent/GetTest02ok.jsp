<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	
	String uName = request.getParameter("uName").toString();

	//String result = "";
	
	//result = uName + "님, 안녕하세요. <br>반갑습니다.";

%>

<%-- <%=result %> --%>
<%-- <%=uName %>님, 안녕하세요.<br>반갑습니다. --%>
${param.uName}님, 안녕하세요.
<br>
반갑습니다.