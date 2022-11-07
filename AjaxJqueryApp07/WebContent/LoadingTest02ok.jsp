<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String name = request.getParameter("name");

	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String region = request.getParameter("region");
	
	
	String tel = tel1 + "-" + tel2 + "-" + tel3;
	
	JSONArray jarr = new JSONArray();
	
	for(int i=1; i<=5; i++)
	{
		JSONObject jobj = new JSONObject();
		
		jobj.put("num", i);
		jobj.put("name", name);
		jobj.put("tel", tel);
		jobj.put("region", region);
			
		jarr.add(jobj);
	}
	
 	try
	{
		Thread.sleep(3000);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
 	
 	
 	out.println(jarr.toString());
 
%>
