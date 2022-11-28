package com.befree.dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.befree.vo.QAVo;

public class QADAO extends DBConn {

	//글쓰기 메소드
	public int getWrite(QAVo vo) {
		int result = 0;
		String sql = "insert into QA(USERID, QTITLE, QDATE, QCONTENT, QCLICK) values(?, ?, NOW(), ?, 0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getQtitle());
			pstmt.setString(3, vo.getQcontent());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//게시글 리스트 메소드
	public ArrayList<QAVo> getList(Map<String, Integer> param){
		ArrayList<QAVo> list = new ArrayList<QAVo>();
		String sql = "SELECT RNO, QID, USERID, QTITLE, QDATE, QCLICK " + 
				" FROM(SELECT ROW_NUMBER() OVER(ORDER BY QDATE DESC) RNO, QID, USERID, QTITLE, QDATE, QCLICK " + 
				"	FROM QA) QALIST " + 
				" WHERE RNO BETWEEN ? AND ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, param.get("startCount"));
			pstmt.setInt(2, param.get("endCount"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QAVo qa = new QAVo();
				qa.setRno(rs.getInt(1));
				qa.setQid(rs.getInt(2));
				qa.setUserId(rs.getString(3));
				qa.setQtitle(rs.getString(4));
				qa.setQdate(rs.getString(5));
				qa.setQclick(rs.getInt(6));
				list.add(qa);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//하나의 게시글을 보는 메소드
	public QAVo getContent(int qid) {
		QAVo qa = new QAVo();
		String sql = "select QID, USERID, QTITLE, QDATE, QCONTENT from QA where QID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				qa.setQid(rs.getInt(1));
				qa.setUserId(rs.getString(2));
				qa.setQtitle(rs.getString(3));
				qa.setQdate(rs.getString(4));
				qa.setQcontent(rs.getString(5));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return qa;
	}

	//게시글 수정 메소드
	public int getUpdate(QAVo vo) {
		int result = 0;
		String sql = "update QA set QTITLE = ?, QCONTENT = ? where QID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getQtitle());
			pstmt.setString(2, vo.getQcontent());
			pstmt.setInt(3, vo.getQid());
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result; //데이터베이스 오류
	}

	//게시글 삭제 메소드
	public int getDelete(int qid) {
		int result = 0;
		String sql = "delete from QA where QID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qid);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result; //데이터베이스 오류 
	}

	//조회수 
	public int countUpdate(int qid) {
		int result = 0;
		String sql = "update QA set QCLICK = QCLICK + 1 where QID = ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qid);
			result = pstmt.executeUpdate();//insert,delete,update	
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;//데이터베이스 오류
	}
	
	public int getCount() {
		String sql = "SELECT COUNT(*) FROM QA";
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
		param.put("rpage", reqPage);
		
		return param;
	}
}
