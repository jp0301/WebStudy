/* ========================
   BoardDTO.java
===========================*/


package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO
{
	
	// 주요 속성 구성
	private Connection conn;
	
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	// 주요 기능 정의

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
	public int insertBoard(BoardDTO dto)
	{
		int result = 0;
		PreparedStatement pstmt = null;
		String sql ="";
		
		try
		{
			sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
			
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
	}
	
	
	// DB 레코드의 갯수를 가져오는 쿼리문 구성 -- 페이징 갯수
	public int getDataCount()
	{
		int result = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try
		{
			sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";		
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
				result = rs.getInt("COUNT");
			
			rs.close();
			stmt.close();

		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}		
		return result;
	}
	
	
	// 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을 읽어오는 메소드
	public List<BoardDTO> getLists(int start, int end)
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
	}
	
	
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 쿼리문 구성
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
	}
	
	// 특정 게시물의 내용을 읽어오는 쿼리문 구성
	
	
	// 특정 게시물을 삭제하는 쿼리문 구성
	
	
	// 특정 게시물을 수정하는 쿼리문 구성
	
	
	// 지금 열람하는 게시물의 이후 게시물
	
	
	// 지금 열람하는 게시물의 이전 게시물
	
	
	// 게시물 검색 기능 관련 쿼리문 구성
	
	

}













