package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QADAO {
	private Connection conn;
	private ResultSet rs;
	
	//기본 생성자
	public QADAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/PARTNER?serverTimezone=Asia/Seoul&useUnicode=true&characterEncoding=utf8";
			String dbID = "befree";
			String dbPassword = "dl10743";
			/*String dbURL = "jdbc:mysql://localhost/dldbwls2010";
			String dbID = "dldbwls2010";
			String dbPassword = "whddlfdbwlsaka1**";*/
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	//작성일자 메소드
	public String getDate() {
		String sql = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	//게시글 번호 부여 메소드
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "select QID from QA order by QID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	//글쓰기 메소드
	public int write(String QTITLE, String userID, String QCONTENT) {
		String sql = "insert into QA values(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, QTITLE);
			pstmt.setString(4, getDate());
			pstmt.setString(5, QCONTENT);
			pstmt.setInt(6, 1); //글의 유효번호
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	//게시글 리스트 메소드
	public ArrayList<QA> getList(int pageNumber){
		String sql = "select * from QA where QID < ? and QCLICK = 1 order by QID desc limit 10";
		ArrayList<QA> list = new ArrayList<QA>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QA qa = new QA();
				qa.setQID(rs.getInt(1));
				qa.setUserID(rs.getString(2));
				qa.setQTITLE(rs.getString(3));
				qa.setQDATE(rs.getString(4));
				qa.setQCONTENT(rs.getString(5));
				qa.setQCLICK(rs.getInt(6));
				list.add(qa);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//페이징 처리 메소드
	public boolean nextPage(int pageNumber) {
		String sql = "select * from QA where QID < ? and QCLICK = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//하나의 게시글을 보는 메소드
		public QA getQA(int QID) {
			String sql = "select * from QA where QID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, QID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					QA qa = new QA();
					qa.setQID(rs.getInt(1));
					qa.setUserID(rs.getString(2));
					qa.setQTITLE(rs.getString(3));
					qa.setQDATE(rs.getString(4));
					qa.setQCONTENT(rs.getString(5));
					qa.setQCLICK(rs.getInt(6));
					return qa;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
		//게시글 수정 메소드
		public int update(int QID, String QTITLE, String QCONTENT) {
			String sql = "update QA set QTITLE = ?, QCONTENT = ? where QID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, QTITLE);
				pstmt.setString(2, QCONTENT);
				pstmt.setInt(3, QID);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
		//게시글 삭제 메소드
		public int delete(int QID) {
			//실제 데이터를 삭제하는 것이 아니라 게시글 유효숫자를 '0'으로 수정한다
			//String sql = "update QA set QCLICK = 0 where QID = ?";
			String sql = "delete from QA where QID = ?";
			String sql2 = "update QA set QID = QID-1 where QID > ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, QID);
				pstmt.executeUpdate();
				try {
					PreparedStatement pstmt1 = conn.prepareStatement(sql2);
					pstmt1.setInt(1, QID);
					return pstmt1.executeUpdate();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류 
		}
}
