<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        <title>BE FREE</title>
        <style>
            body { margin:0 auto; padding:20px 0 0 0; font-family: 'Gowun Dodum', sans-serif;}
            li { display: inline-block; list-style: none; }
            a { text-decoration: none; color:black;}
            header{ display: inline-block; width: 1400px; margin: 0 auto;}
            .hd { 
                background-image: url('images/town_2.jpg');
                background-size:over;
                background-size:100% 100%;
                background-attachment: fixed;
                width:1400px;
                height:300px;
                background-repeat: no-repeat;
                margin-top:-20px;
            }
            .main{
                margin: 0 auto;
                padding: 20px;
                text-align: center;
            }
            .logo{
                /*margin-top: 30px;
                display: flex;
                position : relative;*/
                height: 100px;
                /*left: 7%*/
            }
            .login { margin-right: 62px; /*float: right;*/ }
            header ul{ text-align: right; }
            .p { 
                height:60px;
                z-index: 1;
                width:1500px; 
                margin:0; 
                padding:0;
             }
             nav {
                display: flex;
                justify-content: center;
                position: relative;
                /* background: black; */
                margin: 0 auto;
                /* width: 95%; */
                /* position: absolute; */
                /* left: 10%;*/
            }
            ul, li {
                margin: 0;
                padding: 0;
                list-style: none;
                text-decoration: none;
            }

            nav > ul > li{
                width: 130px;
            }
            .se{
                background-color: white;
                /*position: absolute;
                top: 733px;
                left: 4%;*/
	            margin: 0 auto;
            }
            #main-menu{
                /*background: black;*/
                height: 40px;
                /* position: relative; */
                /* top: 50%; */
                justify-content: center;
                margin: 35px 0px 0px 20px;
                float: right;
                width: 810px;
            }
            #main-menu > li > a {
                /*color:white;*/
                text-align: center;
                line-height: 39px;
                padding: 0px 20px 0px 15px;
                text-shadow: 1px 1px 1px white(0, 0, 0, 0.39);
                width: 90px;
                float: right;
            }
            
            #main-menu > li::before{
                content: "|";
                float: right;
                display: block;
                margin-top: 7.7px;
            }
            #main-menu > li:last-child::before{
                content: "";
            }
            #main-menu > li> .logo{
                width: 120px;
            }

            #sub-menu {
                width:120px;
                position: absolute;
                opacity: 0;
                visibility: hidden;
                background-color: rgba(255, 255, 255, 0.801);
                border-top: 2px solid gold;
                text-align: center;
                top: 74px;
            }

            #sub-menu > li {
                display: block;
                font-size:13px;
                padding: 10px 10px;
            }

            #main-menu > li:hover #sub-menu {
                z-index: 1;
                opacity: 1;
                visibility: visible;
            }
            #sub-menu > li > a:hover { text-decoration:underline; color:gray; }
            .event ul li { list-style: none; display: inline-block; }
            section div img { width: 100%; } 
            .ment {
                margin :0 auto;
                float:left;
                width:100%;
                font-size:100px;
                text-align: center;
                margin-top:100px;
                color:rgb(255, 255, 255);
                font-size: 70px;
            }
            section{width:1400px;margin:0 auto; padding-top:50px;}
            .a1{ text-align: center; font-weight: bold; font-size:30px;}
           /*.a2{background-color:gray; color:white; border-bottom: 2px solid black; padding:5px; margin-top:10px;}*/
            .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
            .wrap * {padding: 0;margin: 0;}
            .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
            .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
            .info .title {padding: 5px 0 0 10px;height: 30px;background: rgb(17, 38, 141);border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold; color: #fff;}
            .info .close {position: absolute;top: 10px;right: 10px;color: rgb(255, 255, 255);width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
            .info .close:hover {cursor: pointer;}
            .info .body {position: relative;overflow: hidden;}
            .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
            .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
            .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
            .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
            .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
            .info .link {color: #5085BB;}
            footer{
                clear:both;
                margin:0 auto;
                /*background-color: rgb(22, 20, 20);*/
                color:white;
                text-align: center;
                /*padding:15px;*/
                font-size: 12px;
                position: relative;
                width: 1350px;
                bottom: 0;
                left: 0;
                border-bottom: 100px solid black;
				border-right: 25px solid transparent;
				border-left: 25px solid transparent;
				height: 0px;
            }
            .item_list{
                text-align: center;
            }
            .recommend_plan{
                display: inline-block;
                /*text-align: center;*/
                margin: 0px;
            }
            .item_section{
                float: left;
                /*width: 300px;
                box-shadow: 5px 5px 5px gray;
                border: 1px solid rgb(184, 184, 184);
                border-radius: 5px;*/
                margin: 10px;
            }
            .item_btm_like{
                text-align: right;
                padding: 10px 20px 10px 10px;
                border-top: 1px solid rgb(184, 184, 184);
            }
            .item_title{
                font-size: 20px;
                margin: 0px 0px 0px 0px;
            }
            .item_plan{
                margin: 0px 0px 16px 0px;
                clear: left;
                text-align: left;
            }
            .item_img{
                margin: 20px;
                width: 200px;
            }

            .item_list2{
                width: 1400px;
                text-align: center;
                margin-top: 70px;
            }
            .table_travle{
                margin-left: auto;
                margin-right: auto;
            }
            .travle{
                /*border: 1px solid gray;*/
                padding-right: 60px;
            }
            .item_section2{
                float: left;
                /*width: 240px;*/
                /*box-shadow: 5px 5px 5px gray;*/
                border: 1px solid rgb(184, 184, 184);
                border-radius: 5px;
                margin: 10px;
            }
            .item_section3{
                float: left;
                /*width: 240px;*/
                /*box-shadow: 5px 5px 5px gray;
                border: 1px solid rgb(184, 184, 184);
                border-radius: 5px;*/
                margin: 10px;
            }
            .item_title2{
                margin: 0px 0px 20px 0px;
                font-size: 20px;
            }
            .item_btm_like2{
                text-align: right;
                padding: 10px 20px 10px 10px;
                border-top: 1px solid rgb(184, 184, 184);
            }
            .hash{
                /*width: 250px;*/
                padding: 20px;
                /*border: 1px solid rgb(240, 240, 240);
                border-radius: 150px;
                background-color: rgb(240, 240, 240);*/
            }
            .item_top_jeju{
                margin-top: 45px;
            }
            .item_title{
                font-size: 40px;
                font-weight: bold;
                font-family: 'Black Han Sans', sans-serif;
                color: rgb(255, 255, 255);
                -webkit-text-stroke-width: 0.5px;
                -webkit-text-stroke-color: rgb(0, 0, 0);
                float: left;
            }
            .item_sub{
                font-size: 40px;
                font-family: 'Black Han Sans', sans-serif;
                color: black;
                -webkit-text-stroke-width: 0px;
                margin: 0px 0px 0px 12px;
                float: left;
            }
            .back{
                background: linear-gradient(to right, #0052d4,#4364f7,#6fb1fc);
                height: 44px;
                padding: 5px;
            }
            .logo_img{
                width: 390px;
                padding: 74px 10px 74px 10px;
            }
            .site_logo{
                font-size: 40px;
                font-family: 'Black Han Sans', sans-serif;
                /*background: linear-gradient(to right top, #0052d4,#4364f7,#6fb1fc);
                color: transparent;
                -webkit-background-clip: text;
                -webkit-text-stroke-width: 0px;*/
                color: black;
                margin: 0px 0px 0px 0px;
            }
            .object_logo{
                font-size: 40px;
                font-family: 'Black Han Sans', sans-serif;
                /*background: linear-gradient(to right top, #0052d4,#4364f7,#6fb1fc);
                color: transparent;
                -webkit-background-clip: text;
                -webkit-text-stroke-width: 0px;*/
                color: black;
                margin: 0px 0px 0px 0px;
            }
            .logo_img3{
                width: 350px;
            }
            .item_list3{
                width: 1400px;
                text-align: center;
                margin-top: 70px;
            }
            .table_site{
                margin-left: auto;
                margin-right: auto;
            }
            .a2{
                font-size: 40px;
                font-family: 'Black Han Sans', sans-serif;
                /*background: linear-gradient(to right top, #0052d4,#4364f7,#6fb1fc);
                color: transparent;
                -webkit-background-clip: text;
                -webkit-text-stroke-width: 0px;*/
                color: black;
                margin: 0px 0px 0px 0px;
            }
        </style> 

        <script>
            /*
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    
// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}*/
        </script>
       
    </head>
    <body>
        <div class="all">
            <div class="main">
                <header>
                    <div class="name">
                    </div>
    
                    <ul class="login">
                        <li><a href="login.jsp">로그인</a></li> &nbsp;
                        <li><a href="clause.jsp">회원가입</a></li>
                    </ul>
                
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
                          BE FREE
                        </div>
                    </div>
                </header>
            </div>
            
            <div class="se">
                <section>
                    <div class="item_list">
                        <dd class="recommend_plan">
                            <dl class="item_section">
                                <dt class="item_top">
                                    <a href="#">
                                        <img src="images/jejudo/jejudo.png" width="200px" height="200px" class="item_img">
                                    </a>
                                </dt>
                            </dl>
                            <dl class="item_section">
                                <dt class="item_top_jeju">
                                    <div class="back"><p class="item_title">제주도의 다양한 </p><p class="item_sub">명소</p></div><br>
                                    <p class="item_plan">BE FREE 사이트는 제주도의 다양한 장소를 담고 있습니다.<br>
                                        관광지, 테마파크, 박물관ㆍㆍㆍ 여러분의 취향껏 살펴보세요.<br>
                                        복잡하고 바쁜 나날들 속의 작은 즐거움이 될 수 있도록 더더욱 좋은 정보를 제공하는 사이트가 되도록 노력하겠습니다. </p>
                                </dt>
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
                                                <a href="#">
                                                    <img src="images/BE_FREE.png" class="logo_img">
                                                </a>
                                            </dt>
                                        </dl>
                                    </td>
                                    <td class="hash">
                                        <p class="site_logo">사이트 로고</p><br>
                                        <hr>
                                        <p> 'BE FREE'는 '자유롭다'라는 의미를 가지고 있습니다.<br>
                                            여러분이 즐겁고 자유로운 여행을 즐길 수 있도록 노력하는 기업이 되겠습니다.</p>
                                    </td>
                                </tr>
                            </table>
                        </dd>
                    </div>

                    <div class="item_list3">
                        <dd class="site_object">
                            <table class="table_site">
                                <tr>
                                    <td class="travle">
                                        <p class="object_logo">사이트 목적</p><br>
                                        <hr>
                                        <p> 여려분이 계획적이고 체계적인 여행 일정을 짤 수 있도록 도움으로써<br>
                                            알차고 보람된 여행이 될 수 있도록 하겠습니다.
                                        </p>
                                        </dl>
                                    </td>
                                    <td class="hash">
                                        <dl class="item_section3">
                                            <dt class="item_top3">
                                                    <img src="images/site_object.png" class="logo_img3">
                                            </dt>
                                        </dl>
                                    </td>
                                </tr>
                            </table>
                        </dd>
                    </div>
                    <p class="a2">오시는 길 </p><br>
                    
                    <div id="map" style="width:100%;height:350px;"></div>
    
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19ee1aad628e3c1d1ed60863856d92c6"></script>
                    <script>
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                        mapOption = { 
                            center: new kakao.maps.LatLng(37.45989427195582, 127.12929871328285), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };
    
                    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
                    // 지도에 마커를 표시합니다 
                    var marker = new kakao.maps.Marker({
                        map: map, 
                        position: new kakao.maps.LatLng(37.45989427195582, 127.12929871328285)
                    });
    
                    // 커스텀 오버레이에 표시할 컨텐츠 입니다
                    // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
                    // 별도의 이벤트 메소드를 제공하지 않습니다 
                    var content = '<div class="wrap">' + 
                                '    <div class="info">' + 
                                '        <div class="title">' + 
                                '            동서울대학교' + 
                                '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                                '        </div>' + 
                                '        <div class="body">' + 
                                '            <div class="img">' +
                                '                <img src="images/du.jpg" width="73" height="70">' +
                                '           </div>' + 
                                '            <div class="desc">' + 
                                '                <div class="ellipsis">경기 성남시 수정구 복정동 423-8</div>' + 
                                '                <div class="jibun ellipsis">031-720-2900</div>' + 
                                '                <div><a href="https://www.du.ac.kr/KR/index.do" target="_blank" class="link">홈페이지</a></div>' + 
                                '            </div>' + 
                                '        </div>' + 
                                '    </div>' +    
                                '</div>';
    
                    // 마커 위에 커스텀오버레이를 표시합니다
                    // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                    var overlay = new kakao.maps.CustomOverlay({
                        content: content,
                        map: map,
                        position: marker.getPosition()       
                    });
    
                    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                    kakao.maps.event.addListener(marker, 'click', function() {
                        overlay.setMap(map);
                    });
    
                    // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
                    function closeOverlay() {
                        overlay.setMap(null);     
                    }
                    </script>




                </section>
                <footer>
                    <p style="padding: 25px 0px 0px 0px;">전화 : 031-720-2114</p>
                    <p>주소 : 경기도 성남시 수정구 복정로 76</p>
                </footer>
            </div>
            
            </div>

        

    </body>
</html>