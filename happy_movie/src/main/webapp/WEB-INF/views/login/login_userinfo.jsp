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
	<link href="resources/css/login/login_userinfo.css" rel=stylesheet>
	<title>USERINFOㅣHAPPYMOVIE</title>
	<script src="resources/js/jquery-3.6.4.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$(document).ready(function() {
			// 취소 버튼 이벤트
			$("#canclebtn").on("click", function() {
				window.location.href = "main";
			});
			
			// 탈퇴 버튼 이벤트
			$("#deleteUser").on("click", function() {
				window.location.href = "logindeleteuser";
			});
		});
	</script>
</head>
<body>
    <header>
      <a href="main.html"><img id="logo" src="resources/images/logo.svg" /></a>
      <p>회원정보</p>
    </header>
    <a href="userimformation.html"
      ><img src="resources/images/userIcon.png" alt="usericon" id="usericon"
    /></a>

    <!-- 입력양식 -->
    <form action="loginuserinfosub" id="join" name="join">
      <!-- 이름 입력 -->
      <div class="userInput" id="userName">
        <h3 class="list">성명<span id="nameError"></span></h3>
        <span class="box int_id"
          ><input type="text" id="name" class="int check" maxlength="20" name="name" value="${ dto.name }"
        /></span>
      </div>
      <!-- 아이디 입력 -->
      <div class="userInput">
        <h3 class="list">아이디<span id="idError"></span></h3>
        <span><input type="text" id="id" maxlength="15" class="check" name="user_id" value="${ dto.user_id }" readonly/></span>
      </div>
      <!-- 비밀번호 입력 -->
      <div class="userInput">
        <h3 class="list">비밀번호<span id="pwError"></span></h3>
        <span
          ><input type="password" id="pw" maxlength="15" class="check" name="pw" value="${ dto.pw }"
        /></span>
      </div>
      
      <!-- 주소입력 -->
      <div class="userInput">
        <h3 class="list">주소<span id="addressError"></span></h3>
        <div id="address"></div>
        <div id="address" class="int_id">
          <input
            type="text"
            id="sample4_detailAddress"
            class="d_form mini line addressCheck addressInput"
            name="address"
            value="${ dto.address }"
          />
        </div>

        <div class="userInput emailInput">
          <h3 class="list">이메일<span id="emailError"></span></h3>
          <span class="emailInt" id="emailBox">
            <input type="text" id="email" maxlength="20" class="check" name="email" value="${ dto.email }"/>
          </span>
        </div>

        <!-- 전화번호 입력 -->
        <div class="userInput">
          <h3 class="list">
            전화번호("-" 제외)<span id="phoneNumError"></span>
          </h3>
          <span class="box int_id"
            ><input type="text" id="phoneNum" class="check" maxlength="11" name="phone" value="${ dto.phone }"
          /></span>
        </div>

        <!-- 수정버튼 -->
        <div class="btn_area">
          <input
            type="submit"
            value="수정"
            id="btnJoin"
            class="btn_type btn_primary"
          />
          <input type="button" value="취소" id="canclebtn" />
        </div>
      </div>
      <input type="button" value="회원탈퇴" id="deleteUser" />
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