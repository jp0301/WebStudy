/* =====================================================================
	MemberScoreDAO.java
	- 데이터베이스 액션 처리 전용 객체 활용
	  (TBL_MEMBERSCORE 테이블 전용 DAO)
===================================================================== */


package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberScoreDAO
{
	private Connection conn;
	
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드(성적 데이터 입력)
	public int add(MemberScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getSid());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	
	// 성적 리스트 출력 담당 메소드
	public ArrayList<MemberScoreDTO> list() throws SQLException
	{
		ArrayList<MemberScoreDTO> result = new ArrayList<MemberScoreDTO>();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG"
				+ ", RANK() OVER (ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM VIEW_MEMBERSCORE ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			MemberScoreDTO dto = new MemberScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);
		}
		pstmt.close();
		rs.close();
		
		return result;
	}
	
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException {
		DBConn.close();
	}
	
	//-----------------------------------------------------------------------------------------------------
	// 메소드 추가
	//-- 현재... 번호(sid)는 식별자의 역할을 수행하고 있으며
	//   번호를 통한 검색 결과를 한 명의 회원일 수 밖에 없기 때문에
	//   반환 자료형은 ArrayList 와 같은 자료구조의 형태가 아니라
	//   MemberScoreDTO 형태로 구성하면 된다.
	public MemberScoreDTO search(String sid) throws SQLException
	{
		MemberScoreDTO result = new MemberScoreDTO();
		
		String sql = "SELECT SID, NAME,  KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, sid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setSid(rs.getString("SID"));
			result.setName(rs.getString("NAME"));
			result.setKor(rs.getInt("KOR"));			
			result.setEng(rs.getInt("ENG"));			
			result.setMat(rs.getInt("MAT"));
		}
		
		pstmt.close();
		rs.close();
		
		return result;
	}
	
	
	
}
