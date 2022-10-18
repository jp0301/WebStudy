<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp
	// 데이터에 대한 입력 액션을 전담하여 처리하는 페이지
	
	// 이전 페이지(ScoreList.jsp)로부터 데이터 수신
	// -- userName, korScore, engScore, matScore
	
	// 한글 인코딩 처리	
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("userName");
	int kor = Integer.parseInt(request.getParameter("korScore"));
	int eng = Integer.parseInt(request.getParameter("engScore"));
	int mat = Integer.parseInt(request.getParameter("matScore"));
	
	ScoreDAO dao = null;
	
	try
	{
		dao = new ScoreDAO();
		
		ScoreDTO dto = new ScoreDTO();
		
		dto.setName(name);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMat(mat);
		
		dao.add(dto);
		
	}
	catch (Exception e)
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

	response.sendRedirect("ScoreList.jsp");
	
%>
