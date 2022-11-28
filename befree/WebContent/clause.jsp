<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
        <title>BE FREE</title>
        <style>
            body{
                background-color: #f5f6f7;
                font-family: 'Gowun Dodum', sans-serif;
            }
            ul {list-style-type: none; padding: 0;}
            input {
                /*float: left;*/
                height: 16px;
                width: 16px;
                margin-right: 13px;
            }
            a {text-decoration: none; 
                color: rgb(114, 114, 114);}
            .all {
                padding-top:15px;
                margin:0 auto;
                width:995px;
            }
            .name{
                margin: 70px 0px 0px 0px;
            }
            .logo{
                display: flex;
                /*position : relative;*/
                height: 100px;
                /*left: 32.3%;*/
                /*top: 70px;*/
                z-index: 10;
                margin: 0 auto;
            }
            .aa{
                height: 400px;
                /* background-color: #f5f6f7; */
                text-align: center;
                width: 600px;
                padding-top: 30px;
                 margin: 0 auto;
            }
            .login_menu > ul{
                display: inline-block;
            }
            .login_icon{
                width: 30px;
                float: left;
                margin-left: 62px;
            }
            h2{
                font-size: 20px;
                /* color: gray; */
                position: absolute;
                left: 110px;
                /*top: 236.2px; */
                /* right: 20%; */
                float: left;
                margin: 0px;
            }
            .aa li{  width: 550px; margin: 0 auto; padding: 5px;}

            /*.aa a:hover{ color:goldenrod;}*/

            .aa2{
                margin:0 auto;
                width:470px; 
                height: 38px;
                background-color: rgb(89, 161, 165);
                border-radius: 7px;
                position: relative;
                top: 70px;
                height: 50px;
                text-align: center;
                line-height: 50px;
                font-weight: bold;
                cursor: pointer;
                transition: all .25s;
                color: white;
                font-size:15px;
            }

            .id{
                border-radius: 7px 7px 0px 0px;
                width: 457px;
                height: 50px;
                border-color: #b8b8b8;
                box-shadow: none;
                border-style: solid;
            }
            .pw{
                border-radius: 0px 0px 7px 7px;
                width: 457px;
                height: 50px;
                border-color: #b8b8b8;
                box-shadow: none;
                border-style: solid;
            }

            .login_system{
                clear: both;
                position: relative;
                top: 30px;
            }
            
            .aa >u>a{
                color:gray;
                font-size:13px;
                position: relative;
                top: 70px;
            }
            u{
                position: relative;
                top: 70px;
            }

            .login_Provision{
                width: 600px;
                margin: 0 auto;
            }
            .aa li{
                width: 400px;
                font-size: 17px;
                font-weight: bold;
                padding: 20px 0px 0px 0px;
            }
            .txtarea1{
                width: 550px;
                height: 100px;
            }
            .txtarea2{
                width: 550px;
                height: 100px;
            }
            #txtarea{
                width: 560px;
                margin: 0 auto;
            }
            .delet{
                width: 250px;
                height: 38px;
                background-color: white;
                border: 0px solid;
                margin: 10px;
                font-size: 15px;
                font-weight: bold;
            }

        </style>        
        <script>
            $(function(){
                $('.agree').css({
                    'width': '250px',
                    'height': '38px',
                    'background-color': 'rgb(89, 161, 165)',
                    'border': '0px solid',
                    'margin': '10px',
                    'cursor': 'pointer',
                    'transition': 'all .25s',
                    'color': 'white',
                    'font-size': '15px',
                   'font-weight': 'bold',
                    'cursor': 'pointer',
                    'transition': 'all .25s'
                }).click(function(){
                    var terms1 = $(".chk_1").is(':checked');
                    var terms2 = $(".chk_2").is(':checked');
                    if (terms1 == true && terms2 == true) {
                        location.href = "join.jsp"
                    } else {
                        alert("이용 약관과 개인정보 수집 및 이용에 대한 안내를 모두 동의해주세요");
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="all">
        <header>
            <div class="name">
                <a href="main.jsp"><img class="logo" src="images/BE_FREE.png"></a>
            </div>
        </header>
        <!--<hr>-->

        <div class="aa">
            <form class="login_Provision">
                <fieldset>
                    <ul>
                        <li class="garo"><label class="check1" ><input type="checkbox" class="chk_1" required>HM 이용약관 동의(필수)</label></li>
                        <li id="txtarea"><textarea rows="6" cols="80" class="txtarea1" placeholder=
                            "환영합니다.
HM 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 HM 서비스를 이용과 관련하여, HM과 귀하(해당 서비스 이용을 원하는 자)의 관계를 나타내기 위한 약관입니다. HM은 귀하의 효율적인 쇼핑을 돕기 위해 서비스를 제공할 것을 약속하고 그 외 필요한 상품 정보들을 최대한 많이 제공하기 위해 노력하겠습니다.
HM 서비스를 이용하시거나 HM 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.

다양한 HM 서비스를 즐겨보세요."
                            readonly></textarea></li>
                        <li class="garo"><label class="check2" ><input type="checkbox" class="chk_2" required>개인정보 수집 및 이용에 대한 안내(필수)</label></li>
                        <li id="txtarea"><textarea rows="6" cols="80" class="txtarea2" placeholder="
정보통신망법 규정에 따라 HM에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 HM 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, HM는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 HM가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다.
- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다." readonly></textarea></li>
                        <li class="garo"><label class="check3"><input type="checkbox" class="chk_3">이벤트 등 프로모션 알림 메일 수신(선택)</label></li>
                    </ul>
                </fieldset>
            </form>
            <div>
                <a href="main.jsp"><button class="delet">취소</button></a>
                <button class="agree">모두 동의함</button>
            </div>
        </div>
    </div>
    </body>
</html>