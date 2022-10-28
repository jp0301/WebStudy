package com.test;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.DBConn;

public class Test
{
	public static void main(String[] args) throws SQLException, ClassNotFoundException
	{
		Connection conn = DBConn.getConnection();
		
		if (conn != null)
		{
			System.out.println("데이터 베이스 연결 성공~!!!");
		}
		DBConn.close();
	}
}
