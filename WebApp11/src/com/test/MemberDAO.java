/*=====================================
 * MemberDAO.java
 *  - 데이터베이스 액션 처리 전용 객체 활용
 =====================================*/


package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	// ○ 주요 속성 구성
	private Connection conn;
	
	// ○ 주요 기능 구성(메소드 정의)
	
	// ★★★ 데이터베이스 연결 메소드 정의 ★★★
	// 생성자 활용
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 입력 메소드
	public int add(MemberDTO dto) throws SQLException
	{
		// 결과값 변수 선언 및 초기화
		int result = 0;
		
		// 쿼리문 준비
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
				+ " VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		// 최종 결과값 반환
		return result;
	}
	
	
	
	// ★★★ 리스트 전체 출력 메소드 정의 ★★★
	
	// 한 명이면 MemberDTO 반환, 전체 리스트는 여러명이기때문에 MemberDTO들~
	// 이걸 어떤 자료구조에 적재할 것이냐는 선택이기에 ArrayList 를 선택해서 담는 것 뿐
	// 사실 MemberDTO[] 이래도 상관없다.
	// 하지만 컬렉션공부했기 때문에 그나마 순서있는 자료구조형태로 쓰기 위해 어레이리스트 사용
	public ArrayList<MemberDTO> list() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			
			/*
			rs.getString("SID"); // rs.getString(1);
							↓
			String sid = rs.getString("SID"); 이렇게되버리면 그냥 덮어쓰기 된다.
							↓			
			dto.sid = rs.getString("SID"); 이렇게 접근 못하는 이유는 Information Hiding, private되있기 때문
							↓
			dto.setSid(rs.getString("SID"));
			*/
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// ★★★ 인원 수 확인을 위한 메소드 정의 ★★★
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())	// if(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// ★★★ 데이터베이스 연결 종료 담당 메소드 정의 ★★★
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	
}
