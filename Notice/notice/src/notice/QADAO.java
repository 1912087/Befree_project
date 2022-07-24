package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QADAO {
	private Connection conn;
	private ResultSet rs;
	
	//�⺻ ������
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

	//�ۼ����� �޼ҵ�
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
		return ""; //�����ͺ��̽� ����
	}
	
	//�Խñ� ��ȣ �ο� �޼ҵ�
	public int getNext() {
		//���� �Խñ��� ������������ ��ȸ�Ͽ� ���� ������ ���� ��ȣ�� ���Ѵ�
		String sql = "select QID from QA order by QID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //ù ��° �Խù��� ���
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	//�۾��� �޼ҵ�
	public int write(String QTITLE, String userID, String QCONTENT) {
		String sql = "insert into QA values(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, QTITLE);
			pstmt.setString(4, getDate());
			pstmt.setString(5, QCONTENT);
			pstmt.setInt(6, 1); //���� ��ȿ��ȣ
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	//�Խñ� ����Ʈ �޼ҵ�
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
	
	//����¡ ó�� �޼ҵ�
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
	
	//�ϳ��� �Խñ��� ���� �޼ҵ�
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
		
		//�Խñ� ���� �޼ҵ�
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
			return -1; //�����ͺ��̽� ����
		}
		
		//�Խñ� ���� �޼ҵ�
		public int delete(int QID) {
			//���� �����͸� �����ϴ� ���� �ƴ϶� �Խñ� ��ȿ���ڸ� '0'���� �����Ѵ�
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
			return -1; //�����ͺ��̽� ���� 
		}
}