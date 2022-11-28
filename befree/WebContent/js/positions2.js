var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
        mapOption = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 9 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


    // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
    var markers=[];

    // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
    var positions = [
        {
            content: '<div>수목원 테마파크</div>', 
            latlng: new kakao.maps.LatLng(33.4706187,126.4794478)
        },
        {
            content: '<div>곽지해수욕장</div>', 
            latlng: new kakao.maps.LatLng(33.4508966,126.2707961)
        },
        {
            content: '<div>오셜록 티 뮤지엄</div>', 
            latlng: new kakao.maps.LatLng(33.3059108,126.2807792)
        }
    ];

    var positions2 = [
        {
            content: '<div>안덕계곡</div>', 
            latlng: new kakao.maps.LatLng(33.2573444,126.3441539)
        },
        {
            content: '<div>카멜리아힐</div>', 
            latlng: new kakao.maps.LatLng(33.2889935,126.3613839)
        },
        {
            content: '<div>정방폭포</div>', 
            latlng: new kakao.maps.LatLng(33.2448518,126.5630699)
        }
    ];

    var positions3 = [
        {
            content: '<div>절물자연휴양림</div>', 
            latlng: new kakao.maps.LatLng(33.4394441,126.6207111)
        },
        {
            content: '<div>함덕해수욕장</div>', 
            latlng: new kakao.maps.LatLng(33.5434177,126.6348415)
        },
        {
            content: '<div>에코랜드 테마파크</div>', 
            latlng: new kakao.maps.LatLng(33.4513424,126.663251)
        }
    ];

    var positions4 = [
        {
            content: '<div>에코랜드 테마파크</div>', 
            latlng: new kakao.maps.LatLng(33.4513424,126.663251)
        },
        {
            content: '<div>우도</div>', 
            latlng: new kakao.maps.LatLng(33.5042923,126.9191143)
        },
        {
            content: '<div>아쿠아플라넷 제주</div>', 
            latlng: new kakao.maps.LatLng(33.4327932,126.9191768)
        }
    ];
    var positions5 = [
        {
            content: '<div>쇠소깍</div>', 
            latlng: new kakao.maps.LatLng(33.2525443,126.6147873)
        },
        {
            content: '<div>대포해안주상절리대</div>', 
            latlng: new kakao.maps.LatLng(33.2377546,126.4163338)
        },
        {
            content: '<div>용머리해안</div>', 
            latlng: new kakao.maps.LatLng(33.2318467,126.3059077)
        }
    ];
    var positions6 = [
        {
            content: '<div>오설록 티 뮤지엄</div>', 
            latlng: new kakao.maps.LatLng(33.3059108,126.2807792)
        },
        {
            content: '<div>금능해수욕장</div>', 
            latlng: new kakao.maps.LatLng(33.3898782,126.200432)
        }
    ];
    var positions7 = [
        {
            content: '<div>제주 스카이워터쇼</div>', 
            latlng: new kakao.maps.LatLng(33.4244642, 126.743688)
        },
        {
            content: '<div>제주센트럴파크</div>', 
            latlng: new kakao.maps.LatLng(33.4333124,126.6657973)
        }
    ];
    var positions8 = [
        {
            content: '<div>오설록 티 뮤지엄</div>', 
            latlng: new kakao.maps.LatLng(33.3059108,126.2807792)
        },
        {
            content: '<div>제주신화월드</div>', 
            latlng: new kakao.maps.LatLng(33.3051047,126.3146858)
        }
    ];
    var positions9 = [
        {
            content: '<div>소인국 테마파크</div>', 
            latlng: new kakao.maps.LatLng(33.290421,126.3138687)
        },
        {
            content: '<div>한림공원</div>', 
            latlng: new kakao.maps.LatLng(33.3895276,126.2305551)
        }
    ];
    addMarker(positions);


    // 마커 하나를 지도위에 표시합니다 
    //addMarker(new kakao.maps.LatLng(33.450701, 126.570667));

    // 마커를 생성하고 지도위에 표시하는 함수입니다
    function addMarker(position) {

        for (var i = 0; i < position.length; i++) {
                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    position: position[i].latlng // 마커의 위치
                });

                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);
        
                // 생성된 마커를 배열에 추가합니다
                markers.push(marker);
            
             // 마커에 표시할 인포윈도우를 생성합니다 
             var infowindow = new kakao.maps.InfoWindow({
                content: position[i].content // 인포윈도우에 표시할 내용
            });

            // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
            // 이벤트 리스너로는 클로저를 만들어 등록합니다 
            // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        }
        // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
        function makeOverListener(map, marker, infowindow) {
            return function() {
                infowindow.open(map, marker);
            };
        }

        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
        function makeOutListener(infowindow) {
            return function() {
                infowindow.close();
            };
        }
            
        }

        
    function rbclick1(){
        setMarkers();
        addMarker(positions);
    }

    function rbclick2(){
        setMarkers();
        addMarker(positions2);
    }

    function rbclick3(){
        setMarkers();
        addMarker(positions3);
    }

    function rbclick4(){
        setMarkers();
        addMarker(positions4);
    }
    function rbclick5(){
        setMarkers();
        addMarker(positions5);
    }

    function rbclick6(){
        setMarkers();
        addMarker(positions6);
    }

    function rbclick7(){
        setMarkers();
        addMarker(positions7);
    }

    function rbclick8(){
        setMarkers();
        addMarker(positions8);
    }

    function rbclick9(){
        setMarkers();
        addMarker(positions9);
    }



        // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
    function setMarkers() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }            
    }
    // "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
    function showMarkers(){
        setMarkers()
    }
