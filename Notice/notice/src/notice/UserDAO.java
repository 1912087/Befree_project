package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; //�ڹٿ� �����ͺ��̽��� ����
	private PreparedStatement pstmt; //������ ��� �� ����
	private ResultSet rs; //����� �޾ƿ���
	
	//�⺻ ������
	//UserDAO�� ����Ǹ� �ڵ����� �����Ǵ� �κ�
	//�޼ҵ帶�� �ݺ��Ǵ� �ڵ带 �̰��� ������ �ڵ尡 ����ȭ�ȴ�
	public UserDAO() {
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
	
	//�α��� ����
	public int login(String userID, String userPassword) {
		String sql = "select userPassword from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(sql); //sql�������� ��� ��Ų��
			pstmt.setString(1, userID); //ù��° '?'�� �Ű������� �޾ƿ� 'userID'�� ����
			rs = pstmt.executeQuery(); //������ ������ ����� rs�� ����
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //�α��� ����
				}else
					return 0; //��й�ȣ Ʋ��
			}
			return -1; //���̵� ����
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //����
	}
	
	// �Ѹ��� ����ڸ� �Է¹ް� ����Ŭ������ �̿��ؼ� �ϳ��� �ν��Ͻ� �����, ȸ�������ϱ�
    public int join(User user) {
        String SQL = "insert into user values(?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserEmail());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // �����ͺ��̽� ���
    }
 
}