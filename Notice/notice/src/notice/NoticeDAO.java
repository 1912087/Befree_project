package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeDAO {
	private Connection conn;
	private ResultSet rs;
	
	//�⺻ ������
	public NoticeDAO() {
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
		String sql = "select NID from NOTICE order by NID desc";
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
	public int write(String NTITLE, String userID, String NCONTENT) {
		String sql = "insert into NOTICE values(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, NTITLE);
			pstmt.setString(4, getDate());
			pstmt.setString(5, NCONTENT);
			pstmt.setInt(6, 1); //���� ��ȿ��ȣ
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	//�Խñ� ����Ʈ �޼ҵ�
	public ArrayList<Notice> getList(int pageNumber){
		String sql = "select * from NOTICE where NID < ? order by NID desc limit 10";
		ArrayList<Notice> list = new ArrayList<Notice>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Notice qa = new Notice();
				qa.setNID(rs.getInt(1));
				qa.setUserID(rs.getString(2));
				qa.setNTITLE(rs.getString(3));
				qa.setNDATE(rs.getString(4));
				qa.setNCONTENT(rs.getString(5));
				list.add(qa);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//����¡ ó�� �޼ҵ�
	public boolean nextPage(int pageNumber) {
		String sql = "select * from NOTICE where NID < ?";
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
		public Notice getNotice(int NID) {
			String sql = "select * from NOTICE where NID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, NID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					Notice notice = new Notice();
					notice.setNID(rs.getInt(1));
					notice.setUserID(rs.getString(2));
					notice.setNTITLE(rs.getString(3));
					notice.setNDATE(rs.getString(4));
					notice.setNCONTENT(rs.getString(5));
					return notice;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
}