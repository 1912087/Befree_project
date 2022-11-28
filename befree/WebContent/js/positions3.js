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
            content: '<div>제주 스카이랩</div>', 
            latlng: new kakao.maps.LatLng(33.4735279,126.4541225)
        },
        {
            content: '<div>바이나흐튼 크리스마스박물관</div>', 
            latlng: new kakao.maps.LatLng(33.2910902,126.3173954)
        },
        {
            content: '<div>핑크뮬리 축제(휴애리)</div>', 
            latlng: new kakao.maps.LatLng(33.2542427,126.2924621)
        }
    ];

    var positions2 = [
        {
            content: '<div>새별오름</div>', 
            latlng: new kakao.maps.LatLng(33.3659424,126.3476852)
        },
        {
            content: '<div>아르떼뮤지엄 제주</div>', 
            latlng: new kakao.maps.LatLng(33.3973766,126.3435331)
        },
        {
            content: '<div>노형수퍼마켙</div>', 
            latlng: new kakao.maps.LatLng(33.4649309,126.4531257)
        }
    ];

    var positions3 = [
        {
            content: '<div>더마파크</div>', 
            latlng: new kakao.maps.LatLng(33.3543013,126.2425798)
        },
        {
            content: '<div>노리매공원</div>', 
            latlng: new kakao.maps.LatLng(33.2826639,126.2847297)
        },
        {
            content: '<div>용머리해안</div>', 
            latlng: new kakao.maps.LatLng(33.231847,126.3124523)
        }
    ];

    var positions4 = [
        {
            content: '<div>일출랜드</div>', 
            latlng: new kakao.maps.LatLng(33.3835243,126.8391747)
        },
        {
            content: '<div>아쿠아플라넷 제주</div>', 
            latlng: new kakao.maps.LatLng(33.4327935,126.9257214)
        },
        {
            content: '<div>섭지코지</div>', 
            latlng: new kakao.maps.LatLng(33.4242095,126.9289223)
        },
        {
            content: '<div>광치기해변</div>', 
            latlng: new kakao.maps.LatLng(33.4403664,126.9024759)
        }
    ];
    var positions5 = [
        {
            content: '<div>새별헤이요목장</div>', 
            latlng: new kakao.maps.LatLng(33.3623504,126.3551828)
        },
        {
            content: '<div>제주 유리의 성</div>', 
            latlng: new kakao.maps.LatLng(33.314595,126.2649005)
        },
        {
            content: '<div>소인국 테마파크</div>', 
            latlng: new kakao.maps.LatLng(33.2904267,126.3137626)
        }
    ];
    var positions6 = [
        {
            content: '<div>오설록 티 뮤지엄</div>', 
            latlng: new kakao.maps.LatLng(33.3059108,126.2807792)
        },
        {
            content: '<div>제주 스카이워터쇼</div>', 
            latlng: new kakao.maps.LatLng(33.4240162,126.735019)
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
