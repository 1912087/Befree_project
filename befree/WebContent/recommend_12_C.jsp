<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.befree.dao.RecommendDAO" %>
<%@ page import="com.befree.vo.RecommendVo" %>
<%@ page import="com.befree.dao.JjimDAO" %>
<%@ page import="com.befree.vo.JjimVo" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>BE FREE</title>
        <!-- Remember to include jQuery :) -->
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
        <!--<link href="${pageContext.request.contextPath}/css/qa_design.css" rel="stylesheet" type="text/css">-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <!-- jQuery Modal -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
        <link href="./css/recommend_12/recommend_12_A.css" rel="stylesheet" type="text/css">
        <style>
    </style>
    <script>
        $(function(){
            $('.tabnav a').click(function () {
                $('.tabcontent > div').hide().filter(this.hash).fadeIn();
                $('.tabnav a').removeClass('active');
                $(this).addClass('active');
            }).filter(':eq(2)').click();
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
				String type = "C-12";
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
                    	<img src="images/travel.png" style="width:60px;">
                        <p class="QA">1박 2일 추천 여행지</p>
			            <div class="section">
			            	<div class="ac"><span class="ac1"><span class="ac2">C 코스</span></div>
							
					<div class="item_list2">
                    <dd class="recommend_travle">
                    <table style="margin: 0 auto;">
                    	<tr>
                    	<td style="width: 200px;">
                    		<img src="images/forest.png" style="width:120px; margin-right:20px"><br><span style="width: 70px; font-size: 30px;">1일차</span>
                    		</td>
                    	<td>
                        <ul class="table_travle" id="ajaxTable">
                        <%
							RecommendDAO recommendDAO = new RecommendDAO();
                        	ArrayList<RecommendVo> list = recommendDAO.getList(type, "1일차");
							for (int i = 0; i < list.size(); i++) {
						%>
                            	<li class="location_list">
                            		<a href="location_view.jsp?ID=<%= list.get(i).getLid() %>">
	                                    <img src="images/tourist/<%= list.get(i).getImg() %>" width="200px" height="200px" class="item_img">
	                                    <br>
	                                    <span id="local" style="padding: 10px; font-size: 20px; font-weight: bold;"><%= list.get(i).getLocation() %></span>
                                	</a>
                                </li>
                                <%
							}
                                %>
                        </ul>
                        </td>
                    	</tr>
                    	<tr style="margin: 20px 0 0 0 ;">
                    	<td style="width: 200px;">
                    		<img src="images/forest.png" style="width:120px; margin-right:20px"><br><span style="width: 70px; font-size: 30px;">2일차</span>
                    		</td>
                    	<td>
                        <ul class="table_travle" id="ajaxTable">
                        <%
                        	ArrayList<RecommendVo> list1 = recommendDAO.getList(type, "2일차");
							for (int i = 0; i < list1.size(); i++) {
						%>
                            	<li class="location_list">
                            		<a href="location_view.jsp?ID=<%= list1.get(i).getLid() %>">
	                                    <img src="images/tourist/<%= list1.get(i).getImg() %>" width="200px" height="200px" class="item_img">
	                                    <br>
	                                    <span id="local" style="padding: 10px; font-size: 20px; font-weight: bold;"><%= list1.get(i).getLocation() %></span>
                                	</a>
                                </li>
                                <%
							}
                                %>
                        </ul>
                        </td>
                    	</tr>
                    </table>
                    </dd>			
                </div>     
    						<div style="display: inline-block;" class="stst">
				                <div class="mapbp"><button class="mapbtn">위치와 거리 확인하기</button></div>
				                <div class="mapbp" style="width: 120px"><button class="mapbtn" onclick="location.href='recommend_12.jsp'">목록</button></div>
    						</div>
					    </div>          
					</div>
				</section>
				
							
			<!-- The Modal -->
					    <div id="myModal" class="modal">
					        
					    <div id="map" style="width:93.7%;height:90%;"></div> 
					    <div id="place"><h2>일정 리스트</h2>
					        <div id="placecontent">1박2일</div>
					        <div class="tab">
					            <ul class="tabnav">
					                <li><a href="#tab01" onclick="rbclick1();">A 코스</a></li>
					                <li><a href="#tab02" onclick="rbclick3();">B 코스</a></li>
					                <li><a href="#tab03" onclick="rbclick5();">C 코스</a></li>
					            </ul>
					            <div class="tabcontent">
					                <div id="tab01">
					                    <div id="pl1">
					                        <ul>
					                            <li><label><input type="radio" id="1" value="1" name="place" onclick="rbclick1()" checked>1일차</label>
					                                <ol>
					                                    <li>공룡랜드</li>
					                                    <li>테디베어사파리</li>
					                                    <li>오설록 티 뮤지엄</li>
					                                    <li>제주 유리의 성</li>
					                                </ol>
					                            </li>
					                            <br>
					                            <li><label><input type="radio" id="2"  value="2" name="place" onclick="rbclick2()">2일차</label>
					                                <ol>
					                                    <li>세리월드</li>
					                                    <li>박물관은살아있다 제주</li>
					                                </ol>
					                            </li>
					                        </ul>
					                    </div>
					                </div>
					                
					                <div id="tab02"><div id="pl2">
					                    <ul>
					                        <li><label><input type="radio" id="3"  value="3" name="place1" onclick="rbclick3()" checked>1일차</label>
					                            <ol>
					                                <li>수목원 테마파크</li>
					                                <li>에코랜드 테마파크</li>
					                                <li>제주 스카이워터쇼</li>
					                            </ol>
					                        </li>
					                        <br>
					                        <li><label><input type="radio" id="4"  value="4" name="place1" onclick="rbclick4()">2일차</label>
					                            <ol>
					                                <li>일출랜드</li>
					                                <li>제주민속촌</li>
					                            </ol>
					                        </li>
					                    </ul>
					                </div></div>
					
					
					                <div id="tab03"><div id="pl3">
					                    <ul>
					                        <li><label><input type="radio" id="5"  value="5" name="place2" onclick="rbclick5()" checked>1일차</label>
					                            <ol>
					                                <li>사진놀이터</li>
					                                <li>도치돌알파카목장</li>
					                            </ol>
					                        </li>
					                        <br>
					                        <li><label><input type="radio" id="6"  value="6" name="place2" onclick="rbclick6()">2일차</label>
					                            <ol>
					                                <li>오설록 티 뮤지엄</li>
					                                <li>점보빌리지</li>
					                            </ol>
					                        </li>
					                    </ul>
					                </div>
					            </div>
					            </div>
					        </div>
					        </div>
					        <div class="modal_close"><button class="close_btn"><img src="images/close.png" width="30px"></button></div>
					   </div>
					   
		            <footer>
		                <p style="padding: 25px 0px 0px 0px;">전화 : 031-720-2114</p>
		                <p>주소 : 경기도 성남시 수정구 복정로 76</p>
		            </footer>
			</div>


          <!--End Modal-->
      <script type="text/javascript">
          jQuery(document).ready(function() {
                // 모달 열기
                function modalOpen() {
                    map.relayout();
                    setTimeout(function() {
                        map.relayout();
                        map.setCenter(new kakao.maps.LatLng(33.450701, 126.570667));
                        // map.setLevel(2); 필요하면 레벨조정
                    }, 100);
                    document.querySelector('.modal').style.display = 'block';
                    document.querySelector('.modal-content').style.display = 'block';
                }

                // 모달 끄기
                function modalClose() {
                    map.relayout();
                    document.querySelector('.modal').style.display = 'none';
                    document.querySelector('.modal-content').style.display = 'none';
                }

                //버튼 클릭리스너 달기
                map.relayout();
                document.querySelector('.mapbtn').addEventListener('click', modalOpen);
                document.querySelector('.modal_close button').addEventListener('click', modalClose);

          });
        </script>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19ee1aad628e3c1d1ed60863856d92c6"></script>
      <script src="js/positions1.js"></script>   
      <script src="js/mapline.js"></script>
    </body>
</html>