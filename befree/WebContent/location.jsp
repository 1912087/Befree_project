<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.befree.dao.JjimDAO" %>
<%@ page import="com.befree.vo.JjimVo" %>
<%@ page import="com.befree.dao.LocationDAO" %>
<%@ page import="com.befree.vo.LocationVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
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
    	<link href="./css/location_design.css" rel="stylesheet" type="text/css">
        <title>BE FREE</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <script>
        $(document).ready(function(){
        	ajax_location_list(1, "all");
        	
            $(".location").click(function(){
            	$(".location").removeClass("show");
            	$(this).addClass("show");
            	ajax_location_list(1, $(this).attr("data-set"));
            });
            
            function ajax_location_list(pageNumber, loc){
            	$.ajax({
            		url : "location_ajax.jsp?pageNumber="+pageNumber+"&loc="+loc,
            		success : function(result){
            			let data = JSON.parse(result);
            			
            			let output = "";
            			for(dataset of data.list){            				
	            			output += "<li class='location_list'>";
	            			output += "<dl class='item_section2'>";
	                        output += "<dt class='item_top'>";
	                        output += "<a href='location_view.jsp?ID=" + dataset.lid + "'>";
	                        output += "<img src='images/tourist/" + dataset.img + "' width='200px' height='200px' class='item_img'>";
	                        output += "<span id='local'>" + dataset.location + "</span>";
	                        output += "<p class='item_title2'>#" + dataset.tname + "</p>";
	                        output += "</a></dt>";
	                        if(dataset.jid == ""){
		                        output += "<dt class='item_btm_like2'>";
		                        output += "<button class = 'jjimClick' data-set='' location-set = '" + dataset.lid + "'>";
		                        output += "<img src='images/heart1.png' style='width: 30px; height: 30px;'>";
		                        output += "</button></dt>";
	                        }else{
		                        output += "<dt class='item_btm_like2'>";
		                        output += "<button class = 'jjimClick' data-set='" + dataset.jid + "' location-set = '" + dataset.lid + "'>";
		                        output += "<img src='images/heart2.png' style=''>";
		                        output += "</button></dt>";	                        	
	                        }//if~else
	                        output += "</dl><br></li>";
	                        
            			}//for
            			
            			
            			let pageList = "<div class='next' id = 'pageAction'>";
            			if(data.rpage != 1){
            				pageList += "<a href='#0' class='bar-anchor' id = 'prevPage'>";	
	            			pageList += "<span>◀</span>";
	            			pageList += "<div class='transition-bar'></div>";
	            			pageList += "</a>"; 
	            		}
            			for(let i = 1; i <= data.pageCount; i++) {
            				if(i == data.rpage){
	                			pageList += "<button type = 'button' class = 'pageCount' page-set = " + i + ">";
	                			pageList += "<a href='javascript:void(0);' style='font-weight: 900; color:#E02401;'>&nbsp " + i + " &nbsp</a>";            					
            					pageList += "</button>";
            				}else{
            					//pageList += "<a href='location.jsp?pageNumber=" + i + "&loc=" + loc + "'>&nbsp " + i + " &nbsp</a>";
            					
	                			pageList += "<button type = 'button' class = 'pageCount' page-set = " + i + ">";
	                			pageList += "<a href='javascript:void(0);'>&nbsp " + i + " &nbsp</a>";
            					pageList += "</button>";
            				}
            			}
            			if(data.pageCount != data.rpage){
	            			pageList += "<a href='#0' class='bar-anchor' id = 'nextPage'>";
	            			pageList += "<span>▶</span>";
	            			pageList += "<div class='transition-bar'></div>";
	            			pageList += "</a>";
            			}
	            		pageList += "</div>";
            			
            			$(".location_list").remove();
            			$("#pageAction").remove();
            			$("#ajaxTable").append(output);
            			$(".paging").append(pageList);
            			
            			
            			$(".pageCount").click(function(){
            				ajax_location_list($(this).attr("page-set"), $(".location.show").attr("data-set"));
            			});
            			
            			$("#prevPage").click(function(){
            				ajax_location_list((data.rpage - 1), $(".location.show").attr("data-set"));
            			});
            			
            			$("#nextPage").click(function(){
            				ajax_location_list((data.rpage + 1), $(".location.show").attr("data-set"));
            			});
            			
            			$(".jjimClick").off("click").click(function(){
            				jjim($(this), $(this).attr("data-set"), $(this).attr("location-set"));
            			});
            		}//success
            	});//ajax
            	
            	function jjim(obj, jid, lid){
           			$.ajax({
           				type: "post",
           				cache : false,
           				data : {
           					jid : jid,
           					lid : lid
           				},
           				url : "my_jjimAction.jsp",
           				success : function(result){
           					let data = JSON.parse(result);
           					
           					if(data.result == "login"){
           						alert("로그인 후 이용 가능합니다.");
           						$(location).attr("href", "login.jsp");
           					}else if(data.result == "jjim_ok"){
           						obj.attr("data-set", data.jid);
           						obj.children("img").attr("src", "images/heart2.png");
           					}else if(data.result == "jjim_cancel") {
           						obj.attr("data-set", "");
           						obj.children("img").attr("src", "images/heart1.png");
           					}
           				}//success
           			});//ajax
            	}
            }
        });
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
                        <p class="QA">관광지</p>
	                        <button type = "button" data-set="all" id="total" class = "location show">전체</button><!--  onclick="location.href='location.jsp'" -->
	                        <button type = "button" data-set="jeju" id="jeju" class = "location">제주</button><!--  onclick="location.href='location_jeju.jsp'" -->
	                        <button type = "button" data-set="seogwipo" id="seogwipo" class = "location">서귀포</button><!--  onclick="location.href='location_seogwipo.jsp'" -->
	                        <input type="hidden" name="Location_list" value="0" id="Location_list">
	                 </div>
					<div class="item_list2">
                    	<dd class="recommend_travle">
                        	<ul class="table_travle" id="ajaxTable">
		                        <%-- <%
									LocationDAO locationDAO = new LocationDAO();
		                        	Map<String, Object> param = locationDAO.getList(pageNumber, "all");
		                        	ArrayList<LocationVo> list = (ArrayList<LocationVo>)param.get("list");
									for (LocationVo vo : list) {
								%>
		                            	<li class="location_list">
		                                    <dl class="item_section2">
		                                        <dt class="item_top">
		                                            <a href="location_view.jsp?ID=<%= vo.getLid() %>">
		                                                <img src="images/tourist/<%= vo.getImg() %>" width="200px" height="200px" class="item_img">
		                                                <span id="local"><%= vo.getLocation() %></span>
		                                                <p class="item_title2"># <%= vo.getTname().replaceAll(" ", "&nbsp;")
					                            		.replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></p>
		                                            </a>
		                                        </dt>
		                                        <%	JjimDAO jjimDAO = new JjimDAO();
													ArrayList<JjimVo> list1 = jjimDAO.getJjim(userID, vo.getLid());
													if (list1.isEmpty()){%>
													<dt class="item_btm_like2">
														<button onclick="location.href='my_jjimAction.jsp?lid=<%=vo.getLid()%>'"
															style="background: none; border: 0px solid;">
															<img src="images/heart1.png" style="width: 30px; height: 30px;">
														</button>
													</dt>
		
												<%	}else{%>
													<dt class="item_btm_like2">
														<button onclick="location.href='my_jjimAction.jsp?lid=<%=vo.getLid()%>'"
															style="background: none; border: 0px solid;">
															<img src="images/heart2.png"
																style="width: 30px; height: 30px;">
														</button>
													</dt>
												<%	}  %>                                    
												</dl>
											<br>
		                                </li>
		                                <% } %> --%>
		                            </ul>
		                    </dd>			
		                </div>                          
                       <!-- 페이징 처리 영역 -->
                       <div class="paging">
							<%-- <%
								if(pageNumber != 1){
							%>
							<div class="next">
								<a href="#0" class="bar-anchor" onclick="location.href='location.jsp?pageNumber=<%= pageNumber - 1 %>'">
								     <span>◀</span>
								  <div class="transition-bar"></div>
								</a>
							<%
								}
//								int n = (int) (locationDAO.getCount("all") / 8 + 1);
								Map<String, Integer> pageCount = (Map<String, Integer>) param.get("page");
								for (int i = 1; i <= pageCount.get("pageCount"); i++) {
									if(i == pageNumber){
							%>
							<a href="location.jsp?pageNumber=<%=i%>" style="font-weight: 900; color:#E02401;">&nbsp <%=i%> &nbsp</a>
							<%
									}else{
							%>	
							<a href="location.jsp?pageNumber=<%=i%>">&nbsp <%=i%> &nbsp</a>
							<%	
									}
								}
								if(pageCount.get("pageCount") != pageNumber){
							%>
								<a href="#0" class="bar-anchor" onclick="location.href='location.jsp?pageNumber=<%= pageNumber + 1 %>'">
								     <span>▶</span>
								  <div class="transition-bar"></div>
								</a>
							</div>
							<%
								}
							%> --%>
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