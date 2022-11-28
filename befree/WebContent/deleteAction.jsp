<%@page import="java.io.PrintWriter"%>
<%@page import="com.befree.dao.QADAO"%>
<%@page import="com.befree.vo.QAVo"%>
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
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
		int qid = 0;
		if(request.getParameter("qid") != null){
			qid = Integer.parseInt(request.getParameter("qid"));
		}
		if(qid == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='Q&A.jsp'");
			script.println("</script>");
		}
		
		QADAO qaDao = new QADAO();
		if(!userID.equals(qaDao.getContent(qid).getUserId())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='Q&A.jsp'");
			script.println("</script>");
		} else{
			// 글 삭제 로직을 수행한다
			QADAO qaDAO = new QADAO();
			int result = qaDAO.getDelete(qid);
			// 데이터베이스 오류인 경우
			if(result != 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정하기에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			// 글 삭제가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제하기 성공')");
				script.println("location.href='Q&A.jsp'");
				script.println("</script>");
			}
		}
	
	%>
</body>
</html>