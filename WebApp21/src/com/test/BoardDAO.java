/*========================
        BoardDTO.java
  ========================*/


package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class BoardDAO
{
	
	// ■■■■■ 주요 속성 구성 ■■■■■
	private Connection conn;
	
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	
	
	// ■■■■■ 주요 기능 정의 ■■■■■

	
	// 게시물 번호의 최대값을 얻어내는 쿼리문 구성 
	public int getMaxNum()
	{
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt("MAXNUM");
			
			rs.close();
			pstmt.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	} //end getMaxNum()
	
	
	// 게시물 작성 → 데이터 입력
	public int insertData(BoardDTO dto)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql ="";
		
		try
		{
			// HITCOUNT 는 기본값 0 또는 default 또는 입력항목 생략 가능
			// CREATED 는 기본값 SYSDATE 또는 default 또는 입력항목 생략 가능
			
			/* 방법 ①
			 * sql =
			 * "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)"
			 * + " VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
			 */
			
			// 방법 ②
			sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, default, default)";
			
			/* 방법 ③
			 * sql =
			 * "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR)" +
			 * " VALUES(?, ?, ?, ?, ?, ?, ?)";
			 */
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIpAddr());
			
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	} // end insertData(BoardDTO dto)
	

	
	// DB 레코드의 갯수를 가져오는 메소드 정의
	// → 검색 기능을 추가하게 되면 수정하게 될 메소드
	public int getDataCount()
	{
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";		
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt("COUNT");
			
			rs.close();
			pstmt.close();

		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}		
		return result;
	} // end getDataCount()
	

	
	
	// 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을 읽어오는 메소드 정의
	// → 검색 기능을 추가하게 되면 수정하게 될 메소드
	public List<BoardDTO> getList(int start, int end) // BoardDTO 들을 반환
	{ 
		List<BoardDTO> result = new ArrayList<BoardDTO>();
		
		String sql="";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql="SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED"
					+ " FROM (SELECT ROWNUM RNUM, DATA.*"
					+ " FROM(SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED "
					+ " FROM TBL_BOARD ORDER BY NUM DESC ) DATA )"
					+ " WHERE RNUM >= ? AND RNUM <= ?";
						
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("NUM"));
				dto.setName(rs.getString("NAME"));
				dto.setSubject(rs.getString("SUBJECT"));
				dto.setHitCount(rs.getInt("HITCOUNT"));
				dto.setCreated(rs.getString("CREATED"));
				
				result.add(dto);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	} // end getList(int start, int end)
	
	
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의
	public int updateHitCount(int num)
	{
		int result = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		
		try
		{
			sql = "UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	} // end updateHitCount(int num)
	
	
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의(Article)
	public BoardDTO getReadData(int num)
	{
		BoardDTO result = null;
		PreparedStatement pstmt = null;
		String sql ="";
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR,"
					      + " HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
					+ " FROM TBL_BOARD WHERE NUM = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				result = new BoardDTO();
				
				result.setNum(rs.getInt("NUM"));
				result.setName(rs.getString("NAME"));
				result.setPwd(rs.getString("PWD"));
				result.setEmail(rs.getString("EMAIL"));
				result.setSubject(rs.getString("SUBJECT"));
				result.setContent(rs.getString("CONTENT"));
				result.setIpAddr(rs.getString("IPADDR"));
				result.setHitCount(rs.getInt("HITCOUNT"));
				result.setCreated(rs.getString("CREATED"));
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	
	// 특정 게시물을 삭제하는 기능의 메소드 정의
	public int deleteData(int num)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "DELETE FROM TBL_BOARD WHERE NUM = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	} // end deleteData(int num)
	
	
	
	
	// 특정 게시물을 수정하는 기능의 메소드 정의
	public int updateData(BoardDTO dto)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try
		{
			sql = "UPDATE TBL_BOARD"
				  + " SET NAME=?" 
					 + ", PWD=?"
					 + ", EMAIL=?"
					 + ", SUBJECT=?"
					 + ", CONTENT=?"
					 + " WHERE NUM = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getNum());	
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	} // end updateData(BoardDTO dto)
	
	
	
	
	// 게시물의 다음 번호 읽어오는 메소드 정의
	public int getNextNum(int num)
	{
		int result = 0;
		
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NVL(MIN(NUM), -1) AS NEXTNUM"
				 + " FROM TBL_BOARD"
				 + " WHERE NUM > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next())
				result = rs.getInt("NEXTNUM");
				
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	} // end nextData(int num)

	
	
	// 게시물의 이전 번호 읽어오는 메소드 정의
	public int getBeforeNum(int num)
	{
		int result = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT NVL(MAX(NUM), -1) AS BEFORENUM"
				 + " FROM TBL_BOARD"
				 + " WHERE NUM < ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while(rs.next())
			{
				result = rs.getInt("BEFORENUM");
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	} // end getBeforeNum(int num)
	

	
	
	// 게시물 검색 기능 관련 쿼리문 구성
	public int searchData(String subject)
	{
		int result = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD WHERE SUBJECT LIKE ?";
			pstmt = conn.prepareStatement(sql);
			
			subject = '%' + subject + '%';
			
			pstmt.setString(1, subject);
			rs = pstmt.executeQuery();

			while(rs.next())
			{
				result = rs.getInt("COUNT");
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	} // end searchData(String subject)
	
	

}













