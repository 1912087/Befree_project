<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
        <title>BE FREE</title>
           <!-- <link href="${pageContext.request.contextPath}/css/login_design.css" rel="stylesheet" type="text/css">-->
           <link href="./css/login_design.css" rel="stylesheet" type="text/css">
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
            <ul class="login_menu">
                <li><img class="login_icon" src="images/login_Icon.png"></li>
                <li><h2>ID 로그인</h2></li>
            </ul>
            <form method="post" action="loginAction.jsp">
                <ul class="login_system">
                    <li><input class="id" type="text"size="43" name="userID" placeholder="ID를 입력하세요."></li>
                    <li><input class="pw" type="password"size="43" name="userPassword" placeholder="패스워드를 입력하세요."></li>
                </ul>
                <button class="ios-15"><span>LOGIN</span></button>
            </form>
            <u><b><a href="join.jsp">회원가입</a></b></u>
        </div>
    </div>
    </body>
</html>
