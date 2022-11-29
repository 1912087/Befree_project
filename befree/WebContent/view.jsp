<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.befree.vo.QAVo" %>
<%@ page import="com.befree.dao.QADAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    	<link href="./css/view_design.css" rel="stylesheet" type="text/css">
        <title>BE FREE</title>
    </head>
    <body>
        <% // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
			String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}
			
			// QID를 초기화시키고 'QID'라는 데이터가 넘어온 것이 존재한다면 캐스팅을 하여 변수에 담는다.
			int qid = 0;
			if(request.getParameter("qid") != null){
				qid = Integer.parseInt(request.getParameter("qid"));
			}
			
			// 만약 넘어온 데이터가 없다면
			if(qid == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='Q&A.jsp'");
				script.println("</script>");
			}
			
			QADAO qaDao = new QADAO();
			QAVo vo = qaDao.getContent(qid);
			qaDao.countUpdate(qid);
		%>
        <div class="all">
            <div class="main">
                <header>
                    <div class="name">
                    </div>
    
					<%
						// 로그인 하지 않았을 때 보여지는 화면
						if(userID == null){
					%>
                            <ul class="login">
                                <li><a href="login.jsp">로그인</a></li> &nbsp;
                                <li><a href="clause.jsp">회원가입</a></li>
                            </ul>
                    <%
						// 로그인이 되어 있는 상태에서 보여주는 화면
						}else{
					%>    
                            <ul class="login">
                                <li><a href="logoutAction.jsp">로그아웃</a></li> &nbsp;
                                <li><a href="main.jsp">회원관리</a></li>
                            </ul>
                    <%
						}
					%>
                
                    <nav>
                        <div class="title_menu">
                            <a href="main.jsp"><img class="logo" src="images/BE_FREE.png"></a>
                            <ul id="main-menu">
                                <li><a href="company.jsp">BE FREE란</a></li>
                                <li><a href="location.jsp">관광지</a></li>
                                <li><a href="recommend_location.jsp">추천여행지</a>
                                    <ul id="sub-menu">
                                        <li><a href="recommend_12.jsp">1박2일</a></li>
                                        <li><a href="recommend_23.jsp">2박3일</a></li>
                                        <li><a href="recommend_location.jsp">개발자 추천</a></li>
                                    </ul>
                                </li>
                                <li><a href="notice.jsp">게시판</a>
                                    <ul id="sub-menu">
                                        <li><a href="notice.jsp">공지사항</a></li>
                                        <li><a href="Q&A.jsp">Q&A</a></li>
                                    </ul>
                                </li>
                                <li><a href="my_jjim.jsp">나의 저장소</a>
                                    <ul id="sub-menu">
                                        <li><a href="my_jjim.jsp">나의 찜 목록</a></li>
                                        <!--li><a href="my_list.html">나의 여행 일정</a></li-->
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <div class="hd">
                        <div class="ment">
                          Q&A
                        </div>
                    </div>
                </header>
            </div>
            
            <div class="se">
                <section>
                    <div class="item_list">
	                        <table>
	                            <tr>
	                            	<td class="t1">글 제목</td>
	                            	<td colspan="2" class="td"><%= vo.getQtitle() %></td>
	                            </tr>
	                            <tr>
	                            	<td class="t2">작성자</td>
	                            	<td colspan="2" class="td"><%= vo.getUserId() %></td>
	                            </tr>
	                            <tr>
	                            	<td class="t1">작성일자</td>
	                            	<td colspan="2" class="td"><%= vo.getQdate() %></td>
	                            </tr>
                                <tr>
	                            	<td colspan="2" class="content"><%= vo.getQcontent() %></td>
                                </tr>
	                   </table>
                            <div class="notice_check">
                                <button class="custom-btn btn-5" onclick="location.href='Q&A.jsp'"><span><a href="Q&A.jsp;" id="btn">목록</a></span></button>
                                <!-- 해당 글의 작성자가 본인이라면 수정과 삭제가 가능하도록 코드 추가 -->
	                        <%
	                        	if(userID != null && userID.equals(vo.getUserId())){
	                        		
	                        %>
	                        
                                <button class="custom-btn btn-5" onclick="location.href='update.jsp?qid=<%=qid%>'"><span><a href="update.jsp?qid=<%= qid %>" id="btn">수정</a></span></button>
                                <button class="custom-btn btn-5 de" onclick="delete_btn(this, <%=qid%>)"><span><a id="btn">삭제</a></span></button>
                                <script>
                                	function delete_btn(de, qid){
                                		let check = confirm('정말로 삭제하시겠습니까?');
                                		if(check){
                                    		location.href="deleteAction.jsp?qid="+qid;
                                		}
                                	}
						        </script>
	                        <%
	                        	}
	                        %>
                    </div>
                </section>
            
	            <footer>
	                <p style="padding: 25px 0px 0px 0px;">전화 : 031-720-2114</p>
	                <p>주소 : 경기도 성남시 수정구 복정로 76</p>
	            </footer>
            </div>
        </div>
    </body>
</html>