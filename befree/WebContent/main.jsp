<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>BE FREE</title>
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Encode+Sans+Semi+Expanded:wght@900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/main_1.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
        <!-- <link href="${pageContext.request.contextPath}/css/main_design.css" rel="stylesheet" type="text/css"> -->
    	<link href="./css/main_design.css" rel="stylesheet" type="text/css">
    <script src="js/script.js"></script>
        
        <script>
            $(document).ready(function() {
                //사용할 배너
                var $banner = $(".banner").find("ul");

                var $bannerWidth = $banner.children().outerWidth();//배너 이미지의 폭
                var $bannerHeight = $banner.children().outerHeight(); // 높이
                var $bannerLength = $banner.children().length;//배너 이미지의 갯수
                var rollingId;

                //정해진 초마다 함수 실행
                rollingId = setInterval(function() { rollingStart(); }, 5000);//다음 이미지로 롤링 애니메이션 할 시간차

                //마우스 오버시 롤링을 멈춘다.
                banner.mouseover(function(){
                    //중지
                    clearInterval(rollingId);
                    $(this).css("cursor", "pointer");
                });
                //마우스 아웃되면 다시 시작
                banner.mouseout(function(){
                    rollingId = setInterval(function() { rollingStart(); }, 5000);
                    $(this).css("cursor", "default");
                });
                
                function rollingStart() {
                    $banner.css("width", $bannerWidth * $bannerLength + "px");
                    $banner.css("height", $bannerHeight + "px");
                    //alert(bannerHeight);
                    //배너의 좌측 위치를 옮겨 준다.
                    $banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
                        //첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
                        $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
                        //뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
                        $(this).find("li:first").remove();
                        //다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
                        $(this).css("left", 0);
                        //이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
                    });
                }
            }); 

            /* Demo purposes only */
            $(".hover").mouseleave(
            function () {
                $(this).removeClass("hover");
            });
        </script>
    </head>
    <body>
    	<% // 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
			String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}
			%>
			
        <div class="all">
	
            <div class="main">
                    <header>
                        <div class="name">
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
                                    <p class="typing-txt"> 떠나자, 제주도로. </p> 
                                    <p class="typing"></p> 
                                    <div class="banner_a">
                                        <div class="banner">
                                            <ul> 
                                                <li> <img src="images/jejudo/jejudo2.jpg" width="1400px" height="600px"></li>
                                                <li> <img src="images/jejudo/jejudo8.jpg" width="1400px" height="600px"></li>
                                                <li> <img src="images/jejudo/jejudo9.jpg" width="1400px" height="600px"></li>
                                                <li> <img src="images/jejudo/jejudo10.jpg" width="1400px" height="600px"></li>
                                                <li> <img src="images/jejudo/jejudo11.jpg" width="1400px" height="600px"></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!--<div class="slider-btns" id="next"><span>▶</span></div>
                                <div class="slider-btns" id="previous"><span>◀</span></div>-->
                            </div>
                        </div>
                    </header>

            </div>

            <div class="se">
            <section>
                <div class="se2">
                <div class="sa sa-up">
                    <p>간편하게 지금 바로!<br><spen class="BEST">BEST 여행지</spen></p>
                </div>
                <div class="item_list">
                    <dd class="recommend_plan">
                        <dl class="item_section">
                            <dt class="item_top">
                                <a href="#">
                                    <img src="images/tourist/19.png" width="200px" height="200px" class="item_img">
                                    <p class="item_title">박물관은살아있다 제주</p>
                                    <p class="item_plan">#박물관</p>
                                </a>
                            </dt>
                            <dt class="item_btm_like"><a href="location_view.jsp?ID=19"><img src="images/transparency.png" width="30px" height="30px"></a></dt>
                        </dl>
                        <dl class="item_section">
                            <dt class="item_top">
                                <a href="#">
                                    <img src="images/tourist/25.png" width="200px" height="200px" class="item_img">
                                    <p class="item_title">휴애리자연생활공원</p>
                                    <p class="item_plan">#자연공원</p>
                                </a>
                            </dt>
                            <dt class="item_btm_like"><a href="location_view.jsp?ID=25"><img src="images/transparency.png" width="30px" height="30px"></a></dt>
                        </dl>
                        <dl class="item_section">
                            <dt class="item_top">
                                <a href="#">
                                    <img src="images/tourist/57.png" width="200px" height="200px" class="item_img">
                                    <p class="item_title">바이나흐튼 크리스마스박물관</p>
                                    <p class="item_plan">#박물관</p>
                                </a>
                            </dt>
                            <dt class="item_btm_like"><a href="location_view.jsp?ID=57"><img src="images/transparency.png" width="30px" height="30px"></a></dt>
                        </dl>
                        <dl class="item_section">
                            <dt class="item_top">
                                <a href="#">
                                    <img src="images/tourist/53.png" width="200px" height="200px" class="item_img">
                                    <p class="item_title">사진놀이터</p>
                                    <p class="item_plan">#테마파크</p>
                                </a>
                            </dt>
                            <dt class="item_btm_like"><a href="location_view.jsp?ID=53"><img src="images/transparency.png" width="30px" height="30px"></a></dt>
                        </dl>
                    </dd>
                    
                </div>
                
                <div class="item_list2">
                    <dd class="recommend_travle">
                        <table class="table_travle">
                            <tr>
                                <td class="travle">
                                    <dl class="item_section2">
                                        <dt class="item_top">
                                            <a href="recommend_12_B.jsp">
                                                <img src="images/tourist/1.png" width="200px" height="200px" class="item_img">
                                                <p class="item_title2">#1박2일 코스</p>
                                            </a>
                                        </dt>
                                        <dt class="item_btm_like2"><a href="recommend_12_B.jsp"><img src="images/right-arrow.png" width="30px" height="30px"></dt>
                                    </dl>
                                    <dl class="item_section2">
                                        <dt class="item_top">
                                            <a href="recommend_23_B.jsp">
                                                <img src="images/tourist/74.png" width="200px" height="200px" class="item_img">
                                                <p class="item_title2">#2박3일 코스</p>
                                            </a>
                                        </dt>
                                        <dt class="item_btm_like2"><a href="recommend_23_B.jsp"><img src="images/right-arrow.png" width="30px" height="30px"></dt>
                                    </dl>
                                    <dl class="item_section2">
                                        <dt class="item_top">
                                            <a href="recommend_location_A.jsp">
                                                <img src="images/tourist/56.png" width="200px" height="200px" class="item_img">
                                                <p class="item_title2">#개발자의 추천</p>
                                            </a>
                                        </dt>
                                        <dt class="item_btm_like2"><a href="recommend_location_A.jsp"><img src="images/right-arrow.png" width="30px" height="30px"></dt>
                                    </dl>
                                </td>
                                <td class="hash">
                                    <p class="hash1">#인생_여행지</p>
                                    <p class="hash2">#지금 바로 GOGO!</p>
                                    <p class="recommend_travle_hash">개발자 추천 여행</p>
                                </td>
                            </tr>
                        </table>
                    </dd>
                </div>
                <div class="service">
                    <dd class="service_item">
                        <dl class="item_section3">
                            <dt class="item_top_service">
                                <a href="https://www.visitjeju.net/kr/bigdatamap/">
                                <img src="images/service.png" height="200px"></a>
                            </dt>
                        </dl>
                    </dd>
                </div>
                <script>
                // Scroll Animation (sa, 스크롤 애니메이션)
                const saTriggerMargin = 300;
                const saElementList = document.querySelectorAll('.sa');

                const saFunc = function() {
                    for (const element of saElementList) {
                    if (!element.classList.contains('show')) {
                        if (window.innerHeight > element.getBoundingClientRect().top + saTriggerMargin) {
                        element.classList.add('show');
                        }
                    }
                    }
                }
                window.addEventListener('load', saFunc);
                window.addEventListener('scroll', saFunc);
                </script>

                <div class="fotal">
                    <div class="f">
                        <div class=fi>
                            <figure class="snip1477" style="float: right;">
                                <img src="images/jejudo/jejudo5.jpg" width="300px" height="300px"  />
                                <div class="title">
                                  <div>
                                    <h2>추천여행지</h2>
                                    <h4>바로가기</h4>
                                  </div>
                                </div>
                                <figcaption>
                                  <p>여행지를 고르기 힘들다면?<br><br>추천여행지를 통해 골라보세요.<br></p>
                                </figcaption>
                                <a href="recommend_12.jsp"></a>
                              </figure>
                             
                              <figure class="snip1477"><img src="images/jejudo/jejudo6.jpg" width="300px" height="300px" alt="sample35" />
                                <div class="title">
                                  <div>
                                    <h2>관광지</h2>
                                    <h4>보러가기</h4>
                                  </div>
                                </div>
                                <figcaption>
                                  <p>제주도에는 어떤 곳이 있을까?<br><br>관광지에 대해 알아보세요!</p>
                                </figcaption>
                                <a href="location.jsp"></a>
                              </figure>
                            </div>
                    <!--
                            <div class="vd">
                                <video src="media/Painting.mp4" controls></video>
                            </div>-->
                        </div> 
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