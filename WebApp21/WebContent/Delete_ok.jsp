<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />

<%

	String pageNum = request.getParameter("pageNum");
	String numStr = request.getParameter("num");
	
	int num = Integer.parseInt(numStr);

	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.deleteData(num);
	
	DBConn.close();
	
	response.sendRedirect(cp + "/List.jsp?pageNum=" + pageNum);
	


%>