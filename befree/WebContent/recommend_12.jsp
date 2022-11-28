<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.befree.dao.JjimDAO" %>
<%@ page import="com.befree.vo.JjimVo" %>
<%@ page import="com.befree.dao.LocationDAO" %>
<%@ page import="com.befree.vo.LocationVo" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>BE FREE</title>
<meta charset="UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
        <!--<link href="${pageContext.request.contextPath}/css/qa_design.css" rel="stylesheet" type="text/css">-->
    	<link href="./css/recommend_12.css" rel="stylesheet" type="text/css">
        <title>BE FREE</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <script>
	        /* Demo purposes only */
	        var snippet = [].slice.call(document.querySelectorAll('.hover'));
	        if (snippet.length) {
	          snippet.forEach(function (snippet) {
	            snippet.addEventListener('mouseout', function (event) {
	              if (event.target.parentNode.tagName === 'figure') {
	                event.target.parentNode.classList.remove('hover')
	              } else {
	                event.target.parentNode.classList.remove('hover')
	              }
	            });
	          });
	        }
        </script>
</head>
<body>
        	<% 
        		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
				String userID = null;
				if(session.getAttribute("userID") != null){
					userID = (String)session.getAttribute("userID");
				}
				int pageNumber = 1; //기본은 1 페이지를 할당
				// 만약 파라미터로 넘어온 오브젝트 타입 'pageNumber'가 존재한다면
				// 'int'타입으로 캐스팅을 해주고 그 값을 'pageNumber'변수에 저장한다
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
							PrintWriter script = response.getWriter();
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
                </header>
            </div>
            
            <div class="se">
                <section>
                    <div class="item_list">
                    	<img src="images/commend.png" style="width:50px;">
                        <p class="QA">추천 여행지</p>
							<div class="one">
							    <h2 class="mid">1박 2일</h2>
							</div>
							
							<figure class="snip1585">
						  <img src="images/jejudo/jejudo12.jpg"/>
						  <figcaption>
						    <h3 style="font-size:20px;">1박 2일 <span style="margin: 2px 0; font-size: 30px;">A코스</span></h3>
						  </figcaption>
						  <a href="recommend_12_A.jsp"></a>
						</figure>
						<figure class="snip1585 hover"><img src="images/jejudo/jejudo13.jpg" />
						  <figcaption>
						    <h3 style="font-size:20px;">1박 2일 <span style="margin: 2px 0; font-size: 30px;">B코스</span></h3>
						  </figcaption>
						  <a href="recommend_12_B.jsp"></a>
						</figure>
						<figure class="snip1585"><img src="images/jejudo/jejudo14.jpg"/>
						  <figcaption>
						    <h3 style="font-size:20px;">1박 2일 <span style="margin: 2px 0; font-size: 30px;">C코스</span></h3>
						  </figcaption>
						  <a href="recommend_12_C.jsp"></a>
						</figure>
							
							<p class="no">*이미지를 클릭하면 해당 일정 코스로 이동합니다.</p>
					</div>
				</section>
				            
	            <footer>
	                <p style="padding: 25px 0px 0px 0px;">전화 : 031-720-2114</p>
	                <p>주소 : 경기도 성남시 수정구 복정로 76</p>
	            </footer>
			</div>
</body>
</html>