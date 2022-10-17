<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// ScoreInsert.jsp
	
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("userName");
	String korStr = request.getParameter("korScore");
	String engStr = request.getParameter("engScore");
	String matStr = request.getParameter("matScore");
	
	int kor = Integer.parseInt(korStr);
	int eng = Integer.parseInt(engStr);
	int mat = Integer.parseInt(matStr);
	
	//db연결
	Connection conn = DBConn.getConnection();
	Statement stmt = conn.createStatement();
	
	
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
			+ " VALUES(SCORESEQ.NEXTVAL, '%s', '%d', '%d', '%d')", name, kor, eng, mat);
	
	
	int result = 0;
	result = stmt.executeUpdate(sql);


	stmt.close();
	DBConn.close();
	
	
	if(result < 1) {
		response.sendRedirect("ScoreInsertError.jsp");
	}
	else
	{
		response.sendRedirect("ScoreList.jsp");
	}
	


	
%>
