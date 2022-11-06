<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	//AjaxJsonTest02ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	
	String result = "";
	
	// ※ JSON 데이터 배열 구조
	//    [{"키1":"값1", "키2" : "값2"}, {"키3":"값3", "키4" : "값4"}, ...]

	/*
	{"num":"1", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"2", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"3", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"4", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"5", "name" :"일이호", "content":"이러쿵저러쿵"},
	*/			
	
	// ↓
	
	/*
	{"num":"1", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"2", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"3", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"4", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"5", "name" :"일이호", "content":"이러쿵저러쿵"}
	*/
	
	// ↓
	
	/*
	[{"num":"1", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"2", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"3", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"4", "name" :"일이호", "content":"이러쿵저러쿵"},
	{"num":"5", "name" :"일이호", "content":"이러쿵저러쿵"} ]
	*/
	
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
	
	
%>
