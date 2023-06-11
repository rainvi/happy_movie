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
	<link href="resources/css/login/login_deleteuser.css" rel=stylesheet>
	<title>DELETEUSERㅣHAPPYMOVIE</title>
	<script src="resources/js/jquery-3.6.4.min.js"></script>
	<script>
      $(document).ready(function () {
        let input_id = $("#id");
        let input_pw = $("#password");
        
        // submit
        $("form").submit(function(event) {
        	event.preventDefault();
        	
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
          //공백확인End
          
          // pw 확인
          let pw = "${ pw }";
          if ($("#password").val() == pw) {
              //탈퇴확인
              let check = confirm("정말 탈퇴하시겠습니까?");
              if (check == true) {
                alert("탈퇴되었습니다");
                $("#loginform").get(0).submit();
              }
              //탈퇴확인 End
          }
          else {
        	  alert("PW가 다릅니다.");
          }
        }); //submit End

        //취소버튼
        $("#canclebtn").click(function () {
          location.href = "main";
        });
        //취소버튼 End

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
     	<a href="loginuserinfo"><img id="user_icon" src="resources/images/userIcon.png"></a>
     	<input class="login_btns" type="button" value="LOGOUT" onclick = "location.href = 'logout'">
    </header>

    <form id="loginform" action="logindeleteusersub">
      <h1>탈퇴를 위해</h1>
      <h1>아이디와 비밀번호를 입력해주세요</h1>
      <div id="longininput">
        <input type="text" id="id" name="user_id" placeholder="ID" value="${ user_id }" readonly/>
        <span id="errorId" class="ErrorText"></span>
        <input
          type="password"
          id="password"
          name="pw"
          placeholder="PASSWORD"
        />
        <span id="errorpw" class="ErrorText"></span>
      </div>
      <div id="formbtn">
        <input type="submit" value="회원탈퇴" class="btns" id="loginbtn" />
        <button type="button" class="btns" id="canclebtn">취소</button>
      </div>
    </form>

    <footer>
      <p>
        사실 침대가 최고조<br />
        대표 : 코딩이최고조 | 전화번호 : 010-1234-5678 | 주소 : 지구
      </p>
    </footer>
</body>
</html>