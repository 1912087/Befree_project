<%@ page import="java.io.PrintWriter"%>
<%@ page import ="com.google.gson.*" %>
<%@ page import="com.befree.dao.JjimDAO"%>
<%@ page import="com.befree.vo.JjimVo" %>
<%@ page import="com.befree.dao.LocationDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.lang.Math" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="jjim" class="com.befree.vo.JjimVo" scope="page" />
<jsp:setProperty name="jjim" property="jid" />
<jsp:setProperty name="jjim" property="lid" />
<%-- <jsp:useBean id="Location" class="com.befree.vo.LocationVo" scope="page" />
<jsp:setProperty name="Location" property="lid" /> --%>
<%
		// 현재 세션 상태를 체크한다.
		String userId = null;
		if(session.getAttribute("userID") != null){
			userId = (String)session.getAttribute("userID");
		}
		
		// 로그인을 한 사람만 글을 쓸 수 있도록 코드를 수정한다
		JsonObject jo = new JsonObject();
		Gson gson = new Gson();
		if(userId == null){
			jo.addProperty("result", "login");
			/* PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>"); */
		}else{
			// 정상적으로 입력이 되었다면 글쓰기 로직을 수행한다
			JjimDAO jjimDao = new JjimDAO();

			if(jjim.getJid() == 0){
				jjim.setUserId(userId);
				int result = jjimDao.getWrite(jjim);
				if(result == 1){
					jjim = jjimDao.getId(jjim);
					jo.addProperty("jid", jjim.getJid());
					jo.addProperty("result", "jjim_ok");
				}

			}else{
				int result = jjimDao.getDelete(jjim);
				if(result == 1){
					jo.addProperty("result", "jjim_cancel");
				}
			}
			//out.write(String.valueOf(result));
		 	/*ArrayList<JjimVo> list = jjimDAO.getJjim(userID, Location.getLid());
			int result = 0;
			if (list.isEmpty()){
				result = jjimDAO.write(Location.getLid(), userID);
			}
			else{
				result = jjimDAO.delete(jjim.getLid(), Location.getLid(), userID);
			}
			
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("location.href=document.referrer;");
	 		script.println("</script>");*/
		};
		out.write(gson.toJson(jo));
	
	%>