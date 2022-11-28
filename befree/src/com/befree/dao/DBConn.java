package com.befree.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConn {
	String url = "jdbc:mysql://localhost/PARTNER";
	String user = "befree";
	String pass = "tiger";
		
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public DBConn() {
		try {
			//1. Driver 준비
			//2. Driver loading
			Class.forName("com.mysql.cj.jdbc.Driver");
			//3. Connection 생성
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getPreparedStatement(String sql) {
		try {
			pstmt = conn.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getClose() {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
