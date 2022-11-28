package com.befree.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.befree.vo.UserVo;

public class UserDAO extends DBConn {
	
	//�α��� ����
	public int login(UserVo vo) {
		int result = 0;
		String sql = "select count(*) from user where userID = ? and userPassword = ?";
		try {
            getPreparedStatement(sql);
			pstmt.setString(1, vo.getUserID()); //ù��° '?'�� �Ű������� �޾ƿ� 'userID'�� ����
			pstmt.setString(2, vo.getUserPassword());
			rs = pstmt.executeQuery(); //������ ������ ����� rs�� ����
			if(rs.next()) {
				result = rs.getInt(1);
			}
			getClose();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result; //����
	}
	
	// �Ѹ��� ����ڸ� �Է¹ް� ����Ŭ������ �̿��ؼ� �ϳ��� �ν��Ͻ� �����, ȸ�������ϱ�
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
        return result; // �����ͺ��̽� ���
    }
 
}