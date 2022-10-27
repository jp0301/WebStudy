<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>


<%
	List<MemberDTO> list = new ArrayList<MemberDTO>();
	

 	for(int i=1; i<=5; i++)
	{ 
	
		String name = request.getParameter("name" + i);
		String tel = request.getParameter("tel" + i);
		String addr = request.getParameter("addr" + i);

		
		
		MemberDTO ob = new MemberDTO(name, tel, addr);
		list.add(ob);
		
	
	 } 
	
	request.setAttribute("list", list);
	
%>
<jsp:forward page="MemberList.jsp"></jsp:forward>
	