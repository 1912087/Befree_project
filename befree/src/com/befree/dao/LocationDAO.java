package com.befree.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.befree.vo.LocationVo;

public class LocationDAO extends DBConn {

	//�Խñ� ��ȣ �ο� �޼ҵ�
	public int getNext() {
		//���� �Խñ��� ������������ ��ȸ�Ͽ� ���� ������ ���� ��ȣ�� ���Ѵ�
		int result = 0;
		String sql = "select LID from befree order by LID desc";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1) + 1;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result; //�����ͺ��̽� ����
	}

	//�Խñ� ����Ʈ �޼ҵ�
	public Map<String, Object> getList(String userid, int pageNumber, String loc){
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<LocationVo> list = new ArrayList<LocationVo>();
		Map<String, Integer> param = getPaging(pageNumber, loc);

		String loc_name = "";
		if(loc.equals("all")) {
			loc_name = "";
		}else if(loc.equals("jeju")) {
			loc_name = " AND LOCATION = '���ֽ�'";
		}else {
			loc_name = " AND LOCATION = '��������'";
		}
		
		/*String sql = "SELECT LID, LOCATION, TNAME, IMG " + 
				" FROM (SELECT ROW_NUMBER() OVER(ORDER BY LID) RNO, LID, LOCATION, TNAME, IMG FROM BEFREE WHERE 1=1 " + 
				loc_name + " ) BEFREE " + 
				" WHERE RNO BETWEEN ? AND ?";*/
		
		String sql = "SELECT BEFREE.LID, LOCATION, TNAME, IMG, JID " + 
				" FROM (SELECT ROW_NUMBER() OVER(ORDER BY LID) RNO, LID, LOCATION, TNAME, IMG " + 
				"	  FROM BEFREE WHERE 1=1 " + loc_name + ") BEFREE LEFT OUTER JOIN " + 
				"      (SELECT BF.LID, JIM.JID " + 
				"	FROM BEFREE AS BF, JJIM AS JIM, USER AS US " + 
				"	WHERE BF.LID = JIM.LID AND US.USERID = '" + userid + "') JJIM " + 
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

	//����¡ ó�� �޼ҵ�
	public boolean nextPage(int pageNumber) {
		String sql = "select * from befree where LID < ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 8);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			//
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	//�ϳ��� �Խñ��� ���� �޼ҵ�
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
			location = " where location = '���ֽ�'";
		}else {
			location = " where location = '��������'";
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

	//--------------���ֽ�-----------------------

	//�Խñ� ����Ʈ �޼ҵ�
	public ArrayList<LocationVo> getJeju(int pageNumber){
		String sql = "select * from befree where LOCATION='���ֽ�' order by LID desc limit 8 offset ?";
		ArrayList<LocationVo> list = new ArrayList<LocationVo>();
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, (pageNumber - 1) * 8);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LocationVo location = new LocationVo();
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
				list.add(location);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//�Խñ� ��ȣ �ο� �޼ҵ�
	public int getNext_jeju() {
		//���� �Խñ��� ������������ ��ȸ�Ͽ� ���� ������ ���� ��ȣ�� ���Ѵ�
		int result = 0;
		String sql = "select LID from befree WHERE LOCATION = '���ֽ�' order by LID desc";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1) + 1;
			}
			//
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result; //�����ͺ��̽� ����
	}

	//����¡ ó�� �޼ҵ�
	public boolean nextPage_jeju(int pageNumber) {
		String sql = "select * from befree where LID < ? && LOCATION = '���ֽ�'";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, getCount_jeju() - (pageNumber - 1) * 8);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			//
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int getCount_jeju() {
		int result = 0;
		String sql = "select count(*) from befree WHERE LOCATION = '���ֽ�'";
		try {
			getPreparedStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}	
			//		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	//----------------------��������-----------------------------

	//�Խñ� ����Ʈ �޼ҵ�
	public ArrayList<LocationVo> getSeogwipo(int pageNumber){
		String sql = "select * from befree where LOCATION='��������' order by LID desc limit 8 offset ?";
		ArrayList<LocationVo> list = new ArrayList<LocationVo>();
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, (pageNumber - 1) * 8);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LocationVo location = new LocationVo();
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
				list.add(location);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//�Խñ� ��ȣ �ο� �޼ҵ�
	public int getNext_seogwipo() {
		//���� �Խñ��� ������������ ��ȸ�Ͽ� ���� ������ ���� ��ȣ�� ���Ѵ�
		int result = 0;
		String sql = "select LID from befree WHERE LOCATION = '��������' order by LID desc";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1) + 1;
			}
			
			return 1; //ù ��° �Խù��� ���
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result; //�����ͺ��̽� ����
	}

	//����¡ ó�� �޼ҵ�
	public boolean nextPage_seogwipo(int pageNumber) {
		String sql = "select * from befree where LID < ? && LOCATION = '��������' order by LID desc limit 8 offset ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, getNext_seogwipo());
			pstmt.setInt(2, (pageNumber - 1) * 8);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int getCount_seogwipo() {
		int result = 0;
		String sql = "select count(*) from befree WHERE LOCATION = '��������'";
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

	//����¡ ó��
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
