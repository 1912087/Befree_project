package notice;

public class Notice {
    private int NID;
    private String userID;
    private String NTITLE;
    private String NDATE;
    private String NCONTENT;
	public int getNID() {
		return NID;
	}
	public void setNID(int nID) {
		NID = nID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getNTITLE() {
		return NTITLE;
	}
	public void setNTITLE(String nTITLE) {
		NTITLE = nTITLE;
	}
	public String getNDATE() {
		return NDATE;
	}
	public void setNDATE(String nDATE) {
		NDATE = nDATE;
	}
	public String getNCONTENT() {
		return NCONTENT;
	}
	public void setNCONTENT(String nCONTENT) {
		NCONTENT = nCONTENT;
	}
}
