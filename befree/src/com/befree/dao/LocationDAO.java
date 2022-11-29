package com.befree.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.befree.vo.LocationVo;

public class LocationDAO extends DBConn {

	/**
	 * MAIN PAGE
	 */
	public ArrayList<LocationVo> getMainList(){
		ArrayList<LocationVo> list = new ArrayList<LocationVo>();
		String sql = "SELECT LID, CATEGORY, TNAME, IMG " + 
				"FROM (SELECT LID, CATEGORY, TNAME, IMG " + 
				"	FROM BEFREE ORDER BY RAND() LIMIT 4) MAINLIST " + 
				"ORDER BY LID";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LocationVo vo = new LocationVo();
				vo.setLid(rs.getInt(1));
				vo.setCategory(rs.getString(2));
				vo.setTname(rs.getString(3));
				vo.setImg(rs.getString(4));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * LOCATION PAGE
	 */
	
	//게시글 리스트 메소드
	public Map<String, Object> getList(String userid, int pageNumber, String loc){
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<LocationVo> list = new ArrayList<LocationVo>();
		Map<String, Integer> param = getPaging(pageNumber, loc);

		String loc_name = "";
		if(loc.equals("all")) {
			loc_name = "";
		}else if(loc.equals("jeju")) {
			loc_name = " AND LOCATION = '제주시'";
		}else {
			loc_name = " AND LOCATION = '서귀포시'";
		}
		
		String sql = "SELECT BEFREE.LID, LOCATION, TNAME, IMG, JID " + 
				" FROM (SELECT ROW_NUMBER() OVER(ORDER BY LID) RNO, LID, LOCATION, TNAME, IMG " + 
				"	  FROM BEFREE WHERE 1=1 " + loc_name + ") BEFREE LEFT OUTER JOIN " + 
				"      (SELECT BF.LID, JIM.JID " + 
				"	FROM BEFREE AS BF, JJIM AS JIM, USER AS US " + 
				"	WHERE BF.LID = JIM.LID AND US.USERID = JIM.USERID AND JIM.USERID = '" + userid + "') JJIM " + 
				" ON BEFREE.LID = JJIM.LID " + 
				" WHERE RNO BETWEEN ? AND ?";
		
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, param.get("startCount"));
			pstmt.setInt(2, param.get("endCount"));
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
			getClose();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		map.put("list", list);
		map.put("page", param);
		return map;
	}

	//하나의 게시글을 보는 메소드
	public LocationVo getLocation(int ID) {
		LocationVo location = new LocationVo();
		String sql = "select * from befree where LID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				location.setLid(rs.getInt(1));
				location.setLocation(rs.getString(2));
				location.setCategory(rs.getString(3));
				location.setTname(rs.getString(4));
				location.setTtime(rs.getString(5));
				location.setAddress(rs.getString(6));
				location.setPhone(rs.getString(7));
				location.setSite(rs.getString(8));
				location.setPrice(rs.getString(9));
				location.setConvenient(rs.getString(10));
				location.setComments(rs.getString(11));
				location.setImg(rs.getString(12));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return location;
	}

	public int getCount(String loc) {
		String location = "";
		int result = 0;
		if(loc.equals("all")) {
			location = " ";
		}else if(loc.equals("jeju")) {
			location = " where location = '제주시'";
		}else {
			location = " where location = '서귀포시'";
		}
		
		String sql = "select count(*) from befree " + location;
		try {
			getPreparedStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}	
					
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	//페이징 처리
	public Map<String, Integer> getPaging(int rpage, String loc){
		Map<String, Integer> param = new HashMap<String, Integer>();
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 8;
		int reqPage = 1;
		int pageCount = 1;
		int dbCount = getCount(loc);
		
		if(dbCount % pageSize == 0) {
			pageCount = dbCount/pageSize;
		}else {
			pageCount = dbCount/pageSize + 1;
		}
		
		if(rpage != 0) {
			reqPage = rpage;
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		}else {
			startCount = 1;
			endCount = pageSize;
		}
		
		param.put("startCount", startCount);
		param.put("endCount", endCount);
		param.put("pageCount", pageCount);
		param.put("rpage", reqPage);
		
		return param;
	}
}
