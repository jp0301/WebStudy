<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지로부터 데이터 수신(MemberScoreInsertForm.jsp)
	String sid = request.getParameter("sid");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	int kor = Integer.parseInt(korStr);
	int eng = Integer.parseInt(engStr);
	int mat = Integer.parseInt(matStr);
	
	try
	{
		dao.connection();

		// MemberScoreDTO 인스턴스 생성 → 수신된 데이터로 객체 구성 → add()
		MemberScoreDTO score = new MemberScoreDTO();
				
		score.setSid(sid);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		// dao의 add() 메소드 호출 → 데이터 입력(insert 쿼리문 수행)
		dao.add(score);
		
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
	
	response.sendRedirect("MemberScoreSelect.jsp");
	
	
%>
