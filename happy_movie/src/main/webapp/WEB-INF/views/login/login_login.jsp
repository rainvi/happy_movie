<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="icon" href="resources/images/MainIcon.ico">
    <link href="resources/css/login/login_main.css" rel=stylesheet>
	<link href="resources/css/login/login_login.css" rel=stylesheet>
	<title>LOGINㅣHAPPYMOVIE</title>
	<script src="resources/js/jquery-3.6.4.min.js"></script>
	<script>
	  $(document).ready(function () {
        let input_id = $("#id");
        let input_pw = $("#password");

        // search
        let sInput = $("#search .inputValue");
        let sBtn = $("#search .searchImg");
        let sForm = $("#search #searchForm");

        window.onpageshow = function (event) {
          if (
            event.persisted ||
            (window.performance && window.performance.navigation.type == 2)
          )
            sInput.val("영화 제목");
        };

        sInput.focusin(function () {
          if (sInput.val() === "영화 제목") sInput.val("");
          sInput.css({
            color: "white",
            outline: "none",
          });
        });
        sInput.focusout(function () {
          if (sInput.val() === "") {
            sInput.val("영화 제목");
            sInput.css("color", "#5F5F5F");
          }
        });
        sForm.submit(function (event) {
          if (sInput.val() === "" || sInput.val() === "영화 제목") {
            alert("검색어를 입력하세요");
            event.preventDefault();
            return;
          }
        });
        sBtn.click(function () {
          var data = encodeURIComponent(sInput.val());
          sInput.css("color", "rgb(0,0,0)");
          sInput.val(data);
          sform.submit();
        });

        // submit이벤트
        $("#loginform").submit(function () {
          // 공백확인
          if (input_id.val() == "") {
            $("#errorId").text("아이디를 입력하세요!");
            input_id.attr("placeholder", "");
            input_id.focus();
            return false;
          }

          if (input_pw.val() == "") {
            $("#errorpw").text("비밀번호를 입력하세요!");
            input_pw.attr("placeholder", "");
            input_pw.focus();
            return false;
          }
          // 공백확인end
        });

        //input click이벤트
        $("#errorId").click(function () {
          $("#errorId").text("");
          $(input_id).focus();
          return;
        });

        $("#errorpw").click(function () {
          $("#errorpw").text("");
          $(input_pw).focus();
          return;
        });
        //input click이벤트End
        
        // 회원가입button 링크
        $("#join_btn").click(function () {
          location.href = "loginjoin";
        });
        
        
        
        /// login post
/*         let result = "${ result }";
        if (result != "") {
        	if (result == "로그인 성공") {
	        	window.location.href = "main";
        	}
        	else if(result == "PW 불일치") {
        		alert("PW가 일치하지 않습니다.")
        	}
        	else {
        		alert("ID가 존재하지 않습니다.")
        	}
	    }; */

      });
	</script>
</head>
<body>
    <header>
        <a href="main"><img id="logo" src="resources/images/logo.svg"></a>
        <div id="search">
            <form id="searchForm" method="GET" action="search" accept-charset="UTF-8">
                <input class="inputValue" name="query" type="text" value="영화 제목">
                <input class="searchImg" type="image" type="submit" src="resources/images/searchIcon.svg">
            </form>
        </div>
        <input class="login_btns" type="button" value="LOGIN" onclick = "location.href = 'login'">
    </header>

    <form id="loginform" action="login" method="post">
      <h1>LOGIN</h1>
      <div id="longininput">
        <input type="text" id="id" name="user_id" placeholder="ID" />
        <span id="errorId" class="ErrorText"></span>
        <input type="password" id="password" name="pw" placeholder="PASSWORD" />
        <span id="errorpw" class="ErrorText"></span>
      </div>
      <div id="formbtn">
        <input type="submit" value="LOGIN" class="btns" id="loginbtn" />
        <button type="button" id="join_btn" class="btns">회원가입</button>
      </div>
    </form>

    <footer>
      <p>
        HAPPY MOVIE<br />
        대표 : multicampus-4조 | 전화번호 : 010-1234-5678 | 주소 : Zoom
        소회의실4
      </p>
    </footer>
</body>
</html>