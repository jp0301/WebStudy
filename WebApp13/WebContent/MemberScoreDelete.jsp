<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String sid = request.getParameter("sid");
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	String strAddr = "";
	
	try
	{
		dao.connection();
		
		//dao.remove(sid);
		int checkCount = dao.refCount(sid);
		//-- TBL_MEMBER 테이블의 제거하고자 하는 데이터의
		// SID를 참조하는 TBL_MEMBERSCORE 테이블 내의 데이터 갯수(존재 여부)
		
		if(checkCount == 0)
		{
			dao.remove(sid);
			strAddr = "MemberSelect.jsp";
		}
		else
		{
			//dao.remove(sid) 안됨
			strAddr = "Notice.jsp";
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}	
	}
	
	response.sendRedirect(strAddr);
	
%>
