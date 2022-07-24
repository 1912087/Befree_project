package notice;

public class QA {
    private int QID;
    private String userID;
    private String QTITLE;
    private String QDATE;
    private String QCONTENT;
    private int QCLICK;
	public int getQID() {
		return QID;
	}
	public void setQID(int qID) {
		QID = qID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getQTITLE() {
		return QTITLE;
	}
	public void setQTITLE(String qTITLE) {
		QTITLE = qTITLE;
	}
	public String getQDATE() {
		return QDATE;
	}
	public void setQDATE(String qDATE) {
		QDATE = qDATE;
	}
	public String getQCONTENT() {
		return QCONTENT;
	}
	public void setQCONTENT(String qCONTENT) {
		QCONTENT = qCONTENT;
	}
	public int getQCLICK() {
		return QCLICK;
	}
	public void setQCLICK(int qCLICK) {
		QCLICK = qCLICK;
	}
    
}
