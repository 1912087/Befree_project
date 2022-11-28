package com.befree.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.befree.vo.JjimVo;
import com.befree.vo.LocationVo;

public class JjimDAO extends DBConn{
	
	//글쓰기 메소드
	public int getWrite(JjimVo jjim) {
		int result = 0;
		String sql = "insert into jjim(lid, userid) values(?,?)";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, jjim.getLid());
			pstmt.setString(2, jjim.getUserId());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result; //데이터베이스 오류
	}

	//게시글 리스트 메소드
	public ArrayList<LocationVo> getList(Map<String, Integer> param, String userId){
		String sql = "SELECT LID, LOCATION, TNAME, IMG, JID " + 
				" FROM (SELECT ROW_NUMBER() OVER(ORDER BY LID) RNO, JM.LID, LOCATION, TNAME, IMG, JID " + 
				"	FROM JJIM JM, BEFREE BF " + 
				"	WHERE JM.LID = BF.LID AND USERID = ?) JJIMLIST " + 
				" WHERE RNO BETWEEN ? AND ?";
		ArrayList<LocationVo> list = new ArrayList<LocationVo>();
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, param.get("startCount"));
			pstmt.setInt(3, param.get("endCount"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LocationVo location = new LocationVo();
				location.setLid(rs.getInt(1));
				location.setLocation(rs.getString(2));
				location.setTname(rs.getString(3));
				location.setImg(rs.getString(4));
				location.setJid(rs.getInt(5));
				list.add(location);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getDelete(JjimVo jjim) {
		String sql = "DELETE FROM jjim WHERE JID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, jjim.getJid());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0; // 데이터베이스 오류
	}

	public JjimVo getId(JjimVo jjim) {
		String sql = "SELECT JID FROM jjim WHERE LID = ? AND USERID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, jjim.getLid());
			pstmt.setString(2, jjim.getUserId());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				jjim.setJid(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jjim;
	}

	public int getCount(String userId) {
		int result = 0;
		String sql = "select count(*) from jjim WHERE userid = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Map<String, Integer> getPaging(String rpage, String userId){
		Map<String, Integer> param = new HashMap<String, Integer>();
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 8;
		int reqPage = 1;
		int pageCount = 1;
		int dbCount = getCount(userId);
		
		if(dbCount % pageSize == 0) {
			pageCount = dbCount/pageSize;
		}else {
			pageCount = dbCount/pageSize + 1;
		}
		
		if(rpage != null) {
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		}else {
			startCount = 1;
			endCount = pageSize;
		}
		
		param.put("rpage", reqPage);
		param.put("startCount", startCount);
		param.put("endCount", endCount);
		param.put("pageCount", pageCount);
		
		return param;
	}
}
