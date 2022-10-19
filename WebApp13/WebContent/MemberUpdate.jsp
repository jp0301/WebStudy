<%@page import="com.test.MemberDAO"%>
<%@page import="com.test.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	
	// MemberUpdate.jsp
	//-- 데이터베이스의 테이블(TBL_MEMBER)에
	//   회원 데이터 추가 액션 처리 수행
	//   ... 이후, 다시 리스트 페이지를 요청할 수 있도록 안내
	
	// 한글 관련 인코딩
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(MemberInsertForm.jsp)로부터 데이터 수신
	String name = request.getParameter("uName");	
	String tel = request.getParameter("uTel");
	
	String sid = request.getParameter("sid");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		// dao 의 modift() 메소드를 호출하는 과정에서 인자로 넘겨야 하는 MemberDTO
		MemberDTO dto = new MemberDTO();
		
		dto.setName(name);
		dto.setTel(tel);
		dto.setSid(sid);
		
		dao.modify(dto);
		
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
	
	
	// 클라이언트가 MemberSelect.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberSelect.jsp");
	
%>
