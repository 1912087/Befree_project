<%@page import="java.io.PrintWriter"%>
<%@page import="com.befree.dao.NoticeDAO"%>
<%@page import="com.befree.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="notice" class = "com.befree.vo.NoticeVo" scope="page"/>
<jsp:setProperty name = "notice" property = "*"/>

<% request.setCharacterEncoding("utf-8"); %>
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
		if(notice.getNid() != 0){
			nid = notice.getNid();
		}
		if(nid == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='notice.jsp'");
			script.println("</script>");
		}
		//해당 'bbsID'에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다
		NoticeDAO noticeDao = new NoticeDAO();
		if(!userID.equals("admin")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='notice.jsp'");
			script.println("</script>");
		} else{
			int result = noticeDao.getUpdate(notice);
			if(result != 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정하기에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정하기 성공')");
				script.println("location.href='notice.jsp'");
				script.println("</script>");
			}
		}
	
	%>