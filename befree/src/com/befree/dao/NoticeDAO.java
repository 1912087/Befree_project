package com.befree.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.befree.vo.NoticeVo;

public class NoticeDAO extends DBConn {
	
	//글쓰기 메소드
	public int getWrite(NoticeVo vo) {
		int result = 0;
		String sql = "insert into NOTICE(USERID, NTITLE, NDATE, NCONTENT, NINT) values(?, ?, NOW(), ?, ?)";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getNtitle());
			pstmt.setString(3, vo.getNcontent());
			pstmt.setInt(4, 1); //글의 유효번호
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result; //데이터베이스 오류
	}

	//게시글 리스트 메소드
	public ArrayList<NoticeVo> getList(Map<String, Integer> param){
		String sql = " SELECT RNO, NID, USERID, NTITLE, NDATE " + 
				" FROM (SELECT ROW_NUMBER() OVER(ORDER BY NDATE DESC) RNO, NID, USERID, NTITLE, NDATE " + 
				"	FROM NOTICE) NOTICELIST " + 
				" WHERE RNO BETWEEN ? AND ?";
		ArrayList<NoticeVo> list = new ArrayList<NoticeVo>();
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, param.get("startCount"));
			pstmt.setInt(2, param.get("endCount"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeVo notice = new NoticeVo();
				notice.setRno(rs.getInt(1));
				notice.setNid(rs.getInt(2));
				notice.setUserId(rs.getString(3));
				notice.setNtitle(rs.getString(4));
				notice.setNdate(rs.getString(5));
				list.add(notice);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//하나의 게시글을 보는 메소드
	public NoticeVo getNotice(int nid) {
		NoticeVo notice = new NoticeVo();
		String sql = "select NID, USERID, NTITLE, NDATE, NCONTENT from NOTICE where NID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, nid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				notice.setNid(rs.getInt(1));
				notice.setUserId(rs.getString(2));
				notice.setNtitle(rs.getString(3));
				notice.setNdate(rs.getString(4));
				notice.setNcontent(rs.getString(5));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return notice;
	}
	
	public int getUpdate(NoticeVo vo) {
		String sql = "UPDATE NOTICE SET NTITLE = ?, NCONTENT = ? WHERE NID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setInt(3, vo.getNid());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public int getDelete(int nid) {
		String sql = "DELETE FROM NOTICE WHERE NID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, nid);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public int getCount() {
		String sql = "SELECT COUNT(*) FROM NOTICE";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public Map<String, Integer> getPaging(String rpage){
		Map<String, Integer> param = new HashMap<String, Integer>();
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;
		int reqPage = 1;
		int pageCount = 1;
		int dbCount = getCount();
		
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
		
		param.put("startCount", startCount);
		param.put("endCount", endCount);
		param.put("pageCount", pageCount);
		
		return param;
	}
}
