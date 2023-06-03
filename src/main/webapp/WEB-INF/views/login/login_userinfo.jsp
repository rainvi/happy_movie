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
      $(document).ready(function () {
        let ids = [
          "#name",
          "#id",
          "#pw",
          "#pwCheck",
          ".addressCheck",
          "#email",
          "#phoneNum",
        ];
        let idsError = [
          "#nameError",
          "#idError",
          "#pwError",
          "#pwCheckError",
          "#addressError",
          "#emailError",
          "#phoneNumError",
        ];
        //유효검사
        let nametest = /^[가-힣]{2,20}$/;
        let idtest = /^[a-zA-Z0-9-_]{5,20}$/;
        let pwtest = /^[a-zA-Z0-9~!@#$%^&*()_-]{8,20}$/;
        let pnumtest = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        let emailtest = /[0-9a-zA-Z-_.]/;
        let testArray = [nametest, idtest, pwtest, emailtest, pnumtest];
        let testError = [
          "2~20자의 한글만 사용가능",
          "5~20자의 영문 대소문자,숫자와 특수기호_ ,-만 사용 가능합니다.",
          " 8~20자의 영문 대소문자, 숫자와 특수기호 '~!@#$%^&*()_-'만 사용 가능합니다.",
          " 올바른 형식이 아닙니다. 다시 확인해주세요",
          "이메일!!",
          " 올바른 형식이 아닙니다. 영문,숫자, (-)(_)(.) 입력만 가능합니다.",
        ];
        //취소버튼 이벤트
        $("#canclebtn").click(function (e) {
          let check = confirm("취소하시겠습니까?");
          if (check == false) {
            e.preventDefault();
          } else {
            location.href = "main";
          }
        }); //취소버튼 이벤트End

        // 탈퇴버튼 이벤트
        $("#deleteUser").click(function (e) {
          let check = confirm("탈퇴하시겠습니까?");
          if (check == false) {
            e.preventDefault();
          } else {
            location.href = "logindeleteuser";
          }
        });
        // 탈퇴버튼 이벤트End

        // input click이벤트
        for (let i = 0; i < ids.length; i++) {
          $(ids[i]).click(function () {
            $(idsError[i]).html("");
          });
        }

        //이름 유효성
        $(ids[0]).keydown(function () {
          if (!testArray[0].test($(ids[0]).val())) {
            $(idsError[0]).html(testError[0]);
            $(idsError[0]).css("color", "blue");
          } else {
            $(idsError[0]).html("");
          } //이름 유효성 End
        });
        //ID 유효성
        $(ids[1]).keydown(function () {
          if (!testArray[1].test($(ids[1]).val())) {
            $(idsError[1]).html(testError[1]);
            $(idsError[1]).css("color", "blue");
          } else {
            $(idsError[1]).html("");
          } //ID 유효성 End
        });

        //비밀번호 유효성
        $(ids[2]).keydown(function () {
          if (!testArray[2].test($(ids[2]).val())) {
            $(idsError[2]).html(testError[2]);
            $(idsError[2]).css("color", "blue");
          } else {
            $(idsError[2]).html("");
          }
        }); //비밀번호 유효성End

        //이메일 유효성
        $(ids[5]).keydown(function () {
          if (!testArray[3].test($(ids[5]).val())) {
            $(idsError[5]).html(testError[5]);
            $(idsError[5]).css("color", "blue");
          } else {
            $(idsError[5]).html("");
          }
        }); //이메일 유효성end

        //전화번호 유효성
        $(ids[6]).keydown(function () {
          if (!testArray[3].test($(ids[6]).val())) {
            $(idsError[6]).html(testError[3]);
            $(idsError[6]).css("color", "blue");
          } else {
            $(idsError[6]).html("");
          }
        }); //전화번호 유효성End
        //input click이벤트 End
        //submit
        $("form").submit(function () {
          //   submit 이름 유효성
          if (!testArray[0].test($(ids[0]).val())) {
            $(idsError[0]).html(testError[0]);
            $(idsError[0]).css("color", "blue");
            $(ids[0]).focus();
            return flase;
          } //   submit 이름 유효성 end

          //   submit ID 유효성
          if (!testArray[1].test($(ids[1]).val())) {
            $(idsError[1]).html(testError[1]);
            $(idsError[1]).css("color", "blue");
            $(ids[1]).focus();
            return false;
          } //   submit 이름 유효성 End

          // submit 비밀번호 유효성
          if (!testArray[2].test($(ids[2]).val())) {
            $(idsError[2]).html(testError[1]);
            $(idsError[2]).css("color", "blue");
            $(ids[2]).focus();
            return false;
          } // submit 비밀번호 유효성 End

          // submit 비밀번호 재확인 유효성
          if ($(ids[2]).val() != $(ids[3]).val()) {
            $(idsError[3]).html("다시 입력해주세요");
            $(idsError[3]).css("color", "red");
            $(ids[3]).focus();
            return false;
          } // submit 비밀번호 재확인 유효성 End

          //submit 이메일 유효성
          if (!testArray[3].test($(ids[5]).val())) {
            $(idsError[5]).html("영문,숫자, (-)(_)(.) 외 입력은 불가합니다");
            $(idsError[5]).css("color", "red");
            $(ids[5]).focus();
            return false;
          } //submit 이메일 유효성 End

          //submit email선택장 유효성
          if ($("#mail_Select").val() == "이메일 선택") {
            $(idsError[5]).html("이메일을 선택해주세요!");
            $(idsError[5]).css("color", "red");
            $(ids[5]).focus();
            return false;
          }
          //submit email선택장 유효성End
          //submit 전화버호 유효성
          if (!testArray[3].test($(ids[6]).val())) {
            $(idsError[6]).html("다시 입력해주세요");
            $(idsError[6]).css("color", "red");
            $(ids[6]).focus();
            return false;
          } //submit 전화번호 유효성End

          //submit 주소 유효성
          if ($(".addressCheck").val() == "") {
            $(idsError[4]).html("입력해주세요");
            $(idsError[4]).css("color", "red");
            $(ids[4]).focus();
            return false;
          } //submit 주소 유효성End
        }); //submit End
      });
	</script>
</head>
<body>
    <header>
      <a href="main"><img id="logo" src="resources/images/logo.svg" /></a>
      <p>회원정보</p>
    </header>
    <a href="loginuserinfo"
      ><img src="resources/images/userIcon.png" alt="usericon" id="usericon"
    /></a>

    <!-- 입력양식 -->
    <form action="#" id="join" name="join">
      <!-- 이름 입력 -->
      <div class="userInput" id="userName">
        <h3 class="list">성명<span id="nameError"></span></h3>
        <span class="box int_id"
          ><input type="text" id="name" class="int check" maxlength="20"
        /></span>
      </div>
      <!-- 아이디 입력 -->
      <div class="userInput">
        <h3 class="list">아이디<span id="idError"></span></h3>
        <span><input type="text" id="id" maxlength="15" class="check" /></span>
      </div>
      <!-- 비밀번호 입력 -->
      <div class="userInput">
        <h3 class="list">비밀번호<span id="pwError"></span></h3>
        <span
          ><input type="password" id="pw" maxlength="15" class="check"
        /></span>
      </div>
      <!-- 비밀번호 재확인 -->
      <div class="userInput">
        <h3 class="list">비밀번호 재확인<span id="pwCheckError"></span></h3>
        <span
          ><input type="password" id="pwCheck" maxlength="15" class="check"
        /></span>
      </div>

      <!-- 주소입력 -->
      <div class="userInput">
        <h3 class="list">주소<span id="addressError"></span></h3>
        <div id="address"></div>
        <div id="address" class="int_id">
          <span>
            <input
              type="text"
              id="sample4_postcode"
              class="d_form mini line addressCheck addressInput"
              placeholder="우편번호"
              readonly
            />
            <input
              type="button"
              id="addressButton"
              class="d_form mini"
              value="우편번호 찾기"
              readonly
            />
          </span>
          <input
            type="text"
            id="sample4_roadAddress"
            class="d_form mini line addressInput"
            placeholder="도로명주소"
            readonly
          />
          <input
            type="text"
            id="sample4_jibunAddress"
            class="d_form mini line addressInput"
            placeholder="지번주소"
            readonly
          />

          <input
            type="text"
            id="sample4_detailAddress"
            class="d_form mini line addressCheck addressInput"
            placeholder="상세주소"
          />
        </div>

        <div class="userInput emailInput">
          <h3 class="list">이메일<span id="emailError"></span></h3>
          <span class="emailInt" id="emailBox">
            <input type="text" id="email" maxlength="20" class="check" />
            <span> @ </span>
            <!-- 이메일 택일 -->
            <select id="mail_Select">
              <option>이메일 선택</option>
              <option>naver.com</option>
              <option>gmail.com</option>
              <option>daum.net</option>
            </select>
          </span>
        </div>

        <!-- 전화번호 입력 -->
        <div class="userInput">
          <h3 class="list">
            전화번호("-" 제외)<span id="phoneNumError"></span>
          </h3>
          <span class="box int_id"
            ><input type="text" id="phoneNum" class="check" maxlength="11"
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