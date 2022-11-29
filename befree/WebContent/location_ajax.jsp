<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.befree.vo.LocationVo, com.befree.dao.LocationDAO, java.util.ArrayList, java.util.Map"%>
<%@ page import = "com.google.gson.*" %>
<%
	String pageNumber = request.getParameter("pageNumber");
	String loc = request.getParameter("loc");
	
	String userid = (String)session.getAttribute("userID");
	
	LocationDAO location = new LocationDAO();
	Map<String, Object> param = location.getList(userid, Integer.parseInt(pageNumber), loc);
	
	JsonObject jobject= new JsonObject();
	JsonArray jarray = new JsonArray();
	Gson gson = new Gson();
	
	ArrayList<LocationVo> list = (ArrayList<LocationVo>) param.get("list");
	Map<String, Integer> pageList = (Map<String, Integer>) param.get("page");
	
	for(LocationVo vo : list){
		JsonObject jo = new JsonObject();
		jo.addProperty("lid", vo.getLid());
		jo.addProperty("location", vo.getLocation());
		jo.addProperty("tname", vo.getTname());
		jo.addProperty("img", vo.getImg());
		jo.addProperty("jid", vo.getJid());
		
		jarray.add(jo);
	}
	
	jobject.add("list", jarray);
	jobject.addProperty("pageCount", pageList.get("pageCount"));
	jobject.addProperty("rpage", pageList.get("rpage"));
	
	out.write(gson.toJson(jobject));
	
%>