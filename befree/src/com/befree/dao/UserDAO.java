package com.befree.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.befree.vo.UserVo;

public class UserDAO extends DBConn {
	
	//로그인 영역
	public int login(UserVo vo) {
		int result = 0;
		String sql = "select count(*) from user where userID = ? and userPassword = ?";
		try {
            getPreparedStatement(sql);
			pstmt.setString(1, vo.getUserID()); //첫번째 '?'에 매개변수로 받아온 'userID'를 대입
			pstmt.setString(2, vo.getUserPassword());
			rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			if(rs.next()) {
				result = rs.getInt(1);
			}
			getClose();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result; //오류
	}
	
	// 한명의 사용자를 입력받고 유저클래스를 이용해서 하나의 인스턴스 만들기, 회원가입하기
    public int join(UserVo user) {
    	int result = 0;
        String sql = "insert into user values(?,?,?,?,?)";
        try {
            getPreparedStatement(sql);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserEmail());
            result = pstmt.executeUpdate();
            getClose();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result; // 데이터베이스 목록
    }
 
}