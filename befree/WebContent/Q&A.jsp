<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.befree.dao.QADAO" %>
<%@ page import="com.befree.vo.QAVo" %>
<%@ page import="java.util.ArrayList, java.util.Map" %>
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
    	<!--<link href="${pageContext.request.contextPath}/css/qa_design.css" rel="stylesheet" type="text/css">-->
    	<link href="./css/qa_design.css" rel="stylesheet" type="text/css">
        <title>BE FREE</title>
    </head>
    <body>
        	<% 
        		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
				String userID = null;
				if(session.getAttribute("userID") != null){
					userID = (String)session.getAttribute("userID");
				}
				int pageNumber = 1; 
				
				if(request.getParameter("pageNumber") != null){
					pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
				}
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
                        <p class="QA">Q & A</p>
                            <div class="w">
                                <a href="write.jsp">글 쓰기</a>
                            </div>
                            <table>
	                            <thead>
	                                <tr><th>번호</th><th>작성자</th><th>제목</th><th>작성일시</th><th>조회수</th></tr>
	                            </thead>
	                            <tbody>
									<%
										QADAO qaDao = new QADAO(); // 인스턴스 생성
										Map<String, Integer> param = qaDao.getPaging(String.valueOf(pageNumber));
										ArrayList<QAVo> list = qaDao.getList(param);
										if(list.isEmpty()){
									%>
									<tr>
										<td colspan="5">게시글이 없습니다.</td>
									</tr>
									<%
										}else{
											for(QAVo vo : list){
									%>
									<tr>
										<td><%= vo.getRno() %></td>
										<!-- 게시글 제목을 누르면 해당 글을 볼 수 있도록 링크를 걸어둔다 -->
										<td><a href="view.jsp?qid=<%= vo.getQid() %>">
											<%= vo.getUserId() %></a></td>
										<td><a href="view.jsp?qid=<%= vo.getQid() %>">
											<%= vo.getQtitle() %></a></td>
										<td><a href="view.jsp?qid=<%= vo.getQid() %>">
											<%= vo.getQdate() %></a></td>
										<td><a href="view.jsp?qid=<%= vo.getQid() %>">
											<%= vo.getQclick() %></a></td>
										
									</tr>
									<%
											}
										}
									%>
	                            </tbody>
                            </table>
                            
                            <!-- 페이징 처리 영역 -->
                            <div class = "paging">
							<%
								
								if(pageNumber != 1){
							%>
									<button class="custom-btn btn-5" onclick="location.href='Q&A.jsp?pageNumber=<%= pageNumber - 1 %>'"><span>
									<a id="btn">이전</a>
									</span></button>
							<%
								}
								for (int i = 1; i <= param.get("pageCount"); i++) {
									if(i == pageNumber){
							%>
										<a href="Q&A.jsp?pageNumber=<%=i%>" style="font-weight: 900; color:#E02401;" id = "currPage" page-set = "<%= i %>">&nbsp <%=i%> &nbsp</a>
							<%
									}else{
							%>	
										<a href="Q&A.jsp?pageNumber=<%=i%>">&nbsp <%=i%> &nbsp</a>
							<%	
									}
								}if(param.get("pageCount") != 0 && pageNumber != param.get("pageCount")){
							%>
									<button class="custom-btn btn-5" onclick="location.href='Q&A.jsp?pageNumber=<%= pageNumber + 1 %>'"><span>
									<a id="btn">다음</a>
									</span></button>
							<%
									}
							%>
							</div>
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