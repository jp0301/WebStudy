<%@page import="com.test.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	// 데이터에 대한 입력 액션을 전담하여 처리하는 페이지

	// 이전 페이지(MemberList.jsp)로부터 데이터 수신
	// -- userName, userTel

	// 한글 인코딩 처리	
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	
	MemberDAO dao = null;	
	
	try 
	{
		dao = new MemberDAO();	
		
		// MemberDTO 구성
		MemberDTO member = new MemberDTO();
		
		//member.setSid(); -- dto의 속성은 String 이므로 초기화 선언 없을 시 null이 됨 /
		member.setName(name);
		member.setTel(tel);

		// dao 의 add() 메소드 호출 → insert 쿼리문 수행
		
		// add() 메소드의 반환 결과에 따른 분기처리 가능~!!!
		/*
		int result = dao.add(member);
		
		if(result > 1)
		{
						
		}
		else
		{
			
		}
		*/
		dao.add(member);
	}
	catch(Exception e) {
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
	
	// URL 주소가 적혀있는 쪽지를 사용자에게 전달
	//-- 즉, 사용자가 다시 요청할 페이지를 안내
	response.sendRedirect("MemberList.jsp");
		
%>
