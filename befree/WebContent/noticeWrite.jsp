<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>

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
        <!--<link href="${pageContext.request.contextPath}/css/write_design.css" rel="stylesheet" type="text/css">-->
    	<link href="./css/write_design.css" rel="stylesheet" type="text/css">
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <title>BE FREE</title>
        <script>
        	$(document).ready(function(){
        		$("#noticeWriteOk").click(function(){
        			if($("#ntitle").val() == ""){
        				alert("제목을 입력해주세요");
        				$("#ntitle").focus();
        				return false;
        			}else if($("#noticewrite_txt").val() == ""){
        				alert("내용을 입력해주세요");
        				$("#noticewrite_txt").focus();
        				return false;
        			}else{
        				noticeWriteForm.submit();
        			}
        		});
        	});
        </script>
    </head>
    <body>
        <% // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
			String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인 후 이용 가능합니다.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
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
                          	공지사항
                        </div>
                    </div>
                </header>
            </div>
            
            <div class="se">
                <section>
                    <div class="item_list">
                        <p class="write">글쓰기</p>
                        <form name = "noticeWriteForm" method="post" action="noticeWriteAction.jsp">
	                        <table>
	                            <tr><th>제목</th><td><input type="text" name="ntitle" id = "ntitle" size="50"></td></tr>
	                            <tr><th>내용</th><td><textarea id = "noticewrite_txt" cols="90" rows="20" name="ncontent" placeholder="내용을 적으시오."></textarea></td></tr>
	                        </table>
	                        <div class="notice_check">
	                        <button type = "button" class="custom-btn btn-5" id = "noticeWriteOk"><span><a id="btn">확인</a></span></button>
	                        <button type="reset" class="custom-btn btn-5" onclick="location.href='notice.jsp'"><span><a id="btn">취소</a></span></button>
	                        </div>
                        </form>
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