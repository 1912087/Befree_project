<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, java.util.Map" %>
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
<link href="./css/location_design.css" rel="stylesheet" type="text/css">
   <title>BE FREE</title>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
   <script>
   	$(document).ready(function(){
   		$(".jjimClick").click(function(){
   			let jid = $(this).attr("data-set");
   			$.ajax({
   				type: "post",
   				cache : false,
   				data : {
   					jid : jid,
   					lid : $(this).attr("location-set")
   				},
   				url : "my_jjimAction.jsp",
   				success : function(result){
   					let data = JSON.parse(result);
   					if(data.result == "jjim_cancel") {
   						if(($("#pageCount").val() - 1) != 0){
   	   						$(location).attr("href", "my_jjim.jsp?pageNumber=" + $("#currPage").attr("page-set"));
   						}else{
   	   						$(location).attr("href", "my_jjim.jsp?pageNumber=" + ($("#currPage").attr("page-set") - 1));
   						}
   					}
   				}//success
   			});//ajax
   		});
   	});
   </script>
</head>
<body>
        	<% 
        		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
				String userId = null;
				if(session.getAttribute("userID") != null){
					userId = (String)session.getAttribute("userID");
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
						if(userId == null){
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('로그인 후 이용 가능합니다.')");
							script.println("location.href='login.jsp'");
							script.println("</script>");
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
                    	<img src="images/heart3.png" style="width:50px;">
                        <p class="QA">나의 찜 목록</p>
			<div class="item_list2">
                    <dd class="recommend_travle">
                        <ul class="table_travle" id="ajaxTable">
							<%
								
								JjimDAO jjimDao = new JjimDAO();
								Map<String, Integer> param = jjimDao.getPaging(String.valueOf(pageNumber), userId);
								ArrayList<LocationVo> list = jjimDao.getList(param, userId);
								if(list.isEmpty()){
							%>
								<div style="margin: 35px ​0 50px 0;">
									<span style="margin-bottom: 50px;">찜한 내용이 없습니다.</span>
								</div>
							<%
								}else{
									for(LocationVo vo : list){	
							%>
                            	<li class="location_list" id = "<%= vo.getJid() %>">
                                    <dl class="item_section2">
                                        <dt class="item_top">
                                            <a href="location_view.jsp?ID=<%= vo.getLid() %>">
                                                <img src="images/tourist/<%= vo.getImg() %>" width="200px" height="200px" class="item_img" >
                                                <span id="local"><%= vo.getLocation() %></span>
                                                <p class="item_title2"># <%= vo.getTname().replaceAll(" ", "&nbsp;")
			                            		.replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></p>
                                            </a>
                                        </dt>
                                        <!--  onclick = "location.href='my_jjimAction.jsp?jid=<%-- <%=vo.getJid()%> --%>'"  -->
                                        <dt class="item_btm_like2">
	                                        <button class = "jjimClick" data-set="<%= vo.getJid() %>" location-set = "<%= vo.getLid() %>">
	                                        	<img src="images/heart2.png" style="width:30px; height:30px;">
	                                        </button>
                                        </dt>
                                    </dl>
                                </li>
                           	<%
									}
								}
							%>
							<br>
                            </ul>
                    </dd>		
                </div>                          
                       <!-- 페이징 처리 영역 -->
                       <div class="paging">
                       		<input type = "hidden" id = "pageCount" value = "<%= list.size() %>">
							<div class="next">
							<%
								if(pageNumber > 0 && pageNumber != 1){
							%>
								<a href="#0" class="bar-anchor" onclick="location.href='my_jjim.jsp?pageNumber=<%= pageNumber - 1 %>'">
								    <span>◀</span>
									<div class="transition-bar"></div>
								</a>
							<%
								}
								for (int i = 1; i <= param.get("pageCount"); i++) {
									if(i == pageNumber){
							%>
										<a href="my_jjim.jsp?pageNumber=<%=i%>" style="font-weight: 900; color:#E02401;" id = "currPage" page-set = "<%= i %>">&nbsp <%=i%> &nbsp</a>
							<%
									}else{
							%>	
										<a href="my_jjim.jsp?pageNumber=<%=i%>">&nbsp <%=i%> &nbsp</a>
							<%	
									}
								}
								if(param.get("pageCount") != 0 && pageNumber != param.get("pageCount")){
							%>
								<a href="#0" class="bar-anchor" onclick="location.href='my_jjim.jsp?pageNumber=<%= pageNumber + 1 %>'">
								     <span>▶</span>
								  <div class="transition-bar"></div>
								</a>
							</div>
							<%
								}
							%>
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