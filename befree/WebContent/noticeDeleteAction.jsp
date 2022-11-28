<%@page import="java.io.PrintWriter"%>
<%@page import="com.befree.dao.NoticeDAO"%>
<%@page import="com.befree.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		// 현재 세션 상태를 체크한다
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		// 로그인을 한 사람만 글을 쓸 수 있도록 코드를 수정한다
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 이용 가능합니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
		int nid = 0;
		if(request.getParameter("nid") != null){
			nid = Integer.parseInt(request.getParameter("nid"));
		}
		if(nid == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='Q&A.jsp'");
			script.println("</script>");
		}
		
		if(!userID.equals("admin")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='Q&A.jsp'");
			script.println("</script>");
		} else{
			NoticeDAO noticeDao = new NoticeDAO();
			int result = noticeDao.getDelete(nid);
			if(result != 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정하기에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제하기 성공')");
				script.println("location.href='notice.jsp'");
				script.println("</script>");
			}
		}
	
	%>
</body>
</html>