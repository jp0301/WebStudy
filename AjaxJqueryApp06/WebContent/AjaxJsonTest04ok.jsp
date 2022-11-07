<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	//AjaxJsonTest04ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	
	String result = "";
	
	// ※ JSON 데이터 배열 구조
	//    [{"키1":"값1", "키2" : "값2"}, {"키3":"값3", "키4" : "값4"}, ...]

			
	/*			
	for(int n=1; n <= 5; n++) // 1 2 3 4 5
	{
		StringBuffer sb = new StringBuffer();

		sb.append("{\"num\":\"" + n + "\"");
		sb.append(", \"name\" :\"" + name + "\"");
		sb.append(", \"content\":\"" + content + "\"},");		// check~!!!
		
		result += sb.toString();
	}
	
	result = result.substring(0, result.length()-1);
	
	result = "[" + result + "]";
	
	out.println(result);
	*/
	
	// check~!!!
	JSONArray jarr = new JSONArray();
	
	for(int n=1; n <= 5; n++)
	{
		// check~!!!
		JSONObject jobj = new JSONObject();
		
		jobj.put("num", n);
		jobj.put("name", name);
		jobj.put("content", content);
		
		jarr.add(jobj);
	}
	
	out.println(jarr.toString());
	
	
%>






















