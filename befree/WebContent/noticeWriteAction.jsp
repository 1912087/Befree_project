<%@page import="java.io.PrintWriter"%>
<%@page import="com.befree.dao.NoticeDAO"%>
<%@page import="com.befree.vo.NoticeVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="notice" class="com.befree.vo.NoticeVo" scope="page" />
<jsp:setProperty name="notice" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BE FREE</title>
</head>
<body>
	<%
			String userId = null;
			if(session.getAttribute("userID") != null){
				userId = (String)session.getAttribute("userID");
			}
			
			if(userId == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인 후 이용 가능합니다.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}else{
				if(userId.equals("admin")){
					if(notice.getNtitle() == null || notice.getNcontent() == null){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('입력이 안 된 사항이 있습니다')");
						script.println("history.back()");
						script.println("</script>");
					}else{
						NoticeDAO noticeDao = new NoticeDAO();
						notice.setUserId(userId);
						int result = noticeDao.getWrite(notice);

						if(result != 1){
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글쓰기에 실패했습니다')");
							script.println("history.back()");
							script.println("</script>");
							
						}else {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글쓰기 성공')");
							script.println("location.href='notice.jsp'");
							script.println("</script>");
						}
					}
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('권한이 없습니다.')");
					script.println("location.href='notice.jsp'");
					script.println("</script>");
				}
				
			}
		
		%>
</body>
</html>