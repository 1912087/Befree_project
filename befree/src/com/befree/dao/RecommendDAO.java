package com.befree.dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.befree.vo.RecommendVo;

public class RecommendDAO extends DBConn {
	//게시글 리스트 메소드
	public ArrayList<RecommendVo> getList(String TTYPE, String DDAY){
		String sql = "select * from recommend where TTYPE = ? && DDAY =? order by RID asc";
		ArrayList<RecommendVo> list = new ArrayList<RecommendVo>();
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, TTYPE);
			pstmt.setString(2, DDAY);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RecommendVo rm = new RecommendVo();
				rm.setRid(rs.getInt(1));
				rm.setTtype(rs.getString(2));
				rm.setDday(rs.getString(3));
				rm.setLocation(rs.getString(4));
				rm.setImg(rs.getString(5));
				rm.setLid(rs.getInt(6));
				list.add(rm);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	//게시글 번호 부여 메소드
//	public int getNext() {
//		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
//		String sql = "select ID from recommend WHERE TTYPE='A-12' order by RID desc";
//		try {
//			getPreparedStatement(sql);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				return rs.getInt(1) + 1;
//			}
//			getClose();
//			return 1; //첫 번째 게시물인 경우
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1; //데이터베이스 오류
//	}

	//페이징 처리 메소드
	public boolean nextPage_jeju(int pageNumber) {
		String sql = "select * from recommend where RID < ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, getCount() - (pageNumber - 1) * 8);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			getClose();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int getCount() {
		int result = 0;
		String sql = "select count(*) from recommend";
		try {
			getPreparedStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}	
			//getClose();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
