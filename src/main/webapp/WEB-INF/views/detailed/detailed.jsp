<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="resources/images/MainIcon.ico">
    <link href="resources/css/detailed.css" rel=stylesheet>
    <script src="resources/js/jquery-3.6.4.min.js"></script>
    <script src="resources/js/KobisOpenAPIRestService.js"></script>
    <script src="resources/js/detailed.js"></script>
    <script>

    </script>
    <script>
		// Model Data
		let movieCd = ${ movie_id };
		let poster_list = "${ poster_list }".slice(1, -1).split(", ");
		let still_list = "${ still_list }".slice(1, -1).split(", ");

		if (poster_list.length == 1) {
			poster_list = [];
			still_list = [];
			
			for (let i = 0; i <= 13; i++)
				poster_list.push("resources/images/photos/posters/poster" + i + ".jfif");
			for (let i = 0; i <= 18; i++)
				still_list.push("resources/images/photos/stills/still" + i + ".jfif");
		};
		
		/// API
		// API data
		let key = "736697ae7e8ff21f7f31778b2d47a87d";
		let yesterday = new Date();
		yesterday.setDate(yesterday.getDate() - 1);
		let options = {
		        year: "numeric",
		        month: "2-digit",
		        day: "2-digit"
		};
		let targetDt = yesterday.toLocaleDateString('ko-KR', options).replace(/\./g, "").replace(/\s/g, "");
		
		/// document
		$(document).ready(function() {
			// 영화 상세 정보 API data load
			$.ajax({
			    type: "get",
			    url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=" + key + "&movieCd=" + movieCd,
			    success: function(data) {
			        let movieData = data.movieInfoResult.movieInfo;
			        
			        // 리턴 타입 array X
			        let movieNm = movieData.movieNm; // 영화명(국문)
			        let movieNmEn = movieData.movieNmEn;	// 영화명(영문)
			        let showTm = movieData.showTm;	// 상영시간
			        let openDt = movieData.openDt;	// 개봉연도
			        let audits = movieData.audits[0].watchGradeNm;	// 심의정보
			        
			        $("#detailed_title").text(movieNm + "ㅣHAPPYMOVIE");
			        $("#movieNm").text(movieNm);
			        $("#movieNmEn").text(movieNmEn + ", " + openDt.substring(0, 4));
			        $("#showTm").text(showTm + "분");
			        $("#openDt").text(openDt.substring(0, 4) + "." + openDt.substring(4, 6) + "." + openDt.substring(6, 8));
			        $("#audits").text(audits);
			        
			        // 리턴 타입 array O
			        // 제작국가
			        let nations = [];
			        for (let i = 0; i < movieData.nations.length; i++) {
			            nations.push(movieData.nations[i].nationNm);
			        }
			        nations = nations.join(", ");
			        $("#nations").text(nations);
			        
			        // 장르명
			        let genres = [];	// 장르
			        for (let i = 0; i < movieData.genres.length; i++) {
			            genres.push(movieData.genres[i].genreNm);
			        }
			        genres = genres.join("/");
			        $("#genres").text(genres);
			        
			        // 감독
			        let directors = movieData.directors;
			        let directorsNm = [];
			        directors.forEach(d => {
			            // main info
			            directorsNm.push(d.peopleNm);
			            
			            // person contents
			            $("#director_table tr:nth-child(2)").append("<td>" + d.peopleNm + "</td>");

			        });
			        directorsNm = directorsNm.join(", ");
			        $("#directors").text(directorsNm);
			        
			        // 배우
			        let actors = movieData.actors;
			        actors.forEach(a => {
			            // person contents
			            $("#actor_table tr:nth-child(2)").append("<td>" + a.peopleNm + "</td>");
			            $("#actor_table tr:nth-child(3)").append("<td>" + a.cast + " 역</td>");
			        });
			        
			        // 제작진
			        let staffs = movieData.staffs;
			        staffs.forEach(s => {
			            // person contents
			            $("#crew_table").append("<tr><td>" + s.staffRoleNm + "</td><td>" + s.peopleNm + "</td></tr>");
			        });
			        
			        // 제작사
			        let companys = movieData.companys;
			        $("#companys").text(companys[0].companyNm);	// main info
			        companys.forEach(c => {
			            // person contents
			            $("#company_table").append("<tr><td>" + c.companyPartNm + "</td><td>" + c.companyNm + "</td></tr>");
			        });
			    }	// success end
			});	// ajax end
		
			// 일별 박스오피스 순위 API data load
			$.ajax({
			    type: "get",
			    url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=" + key + "&targetDt=" + targetDt,
			    success: function(data) {
			        let boxData = data.boxOfficeResult.dailyBoxOfficeList;
			        let rank, audiAcc;	// 순위, 누적관객수
			        for (let i = 0; i < boxData.length; i++) {
			            if (movieCd == boxData[i].movieCd) {
			                rank = boxData[i].rank;
			                audiAcc = boxData[i].audiAcc;
			                audiAcc = parseInt(audiAcc).toLocaleString("en-US");
			                
			                $("#main_table").append("<tr>"
			                        + "<th>박스오피스</th><td id='rank'><a href='rank'>"
			                        + rank + "위</a></td>"
			                        + "<th>누적관객</th><td>"
			                        + audiAcc +"명</td></tr>"
			                );
			                break;
			            };	// if end
			        };	// for end
			    }	// success end
			});	// ajax end
			
		    /// Photo event
		    // more button event
		    function ShowPhotoSlide(photo_type, photo_arr) {
		        let index = 0;
		        let big_img = $("#big_" + photo_type);
		        $("#" + photo_type + "_more_title h3").text("1/" + photo_arr.length);
		        big_img.attr("src", photo_arr[index]);

		        $(".prev_btn").on("click", function() {
		            index = (index + photo_arr.length - 1) % photo_arr.length;
		            $("#" + photo_type + "_more_title h3").text((index + 1) + "/" + photo_arr.length);
		            big_img.fadeOut(150, function() {
		                big_img.attr("src", photo_arr[index]);
		                big_img.fadeIn(150);
		            });
		        });
		        $(".next_btn").on("click", function() {
		            index = (index + 1) % photo_arr.length;
		            $("#" + photo_type + "_more_title h3").text((index + 1) + "/" + photo_arr.length);
		            big_img.fadeOut(150, function() {
		                big_img.attr("src", photo_arr[index]);
		                big_img.fadeIn(150);
		            });
		        });
		    };
		    $("#posters_more").on("click", function() {
		        ShowPhotoSlide("posters", poster_list);
		    });
		    $("#stills_more").on("click", function() {
		        ShowPhotoSlide("stills", still_list);
		    });	// photo event end
		    
		});	// document end
    </script>
    <title id="detailed_title"></title>
</head>
<body>
    <header>
        <a href="main"><img id="logo" src="resources/images/logo.svg"></a>
        <input id="login" type="button" value="LOGIN" onclick = "location.href = 'finalLogin.html'">
        <div id="search">
            <form id="searchForm" method="GET" action="search" accept-charset="UTF-8">
                <input class="inputValue" name="query" type="text" value="영화 제목">
                <input class="searchImg" type="image" type="submit" src="resources/images/searchIcon.svg">
            </form>
        </div>
    </header>
	<c:choose>
		<c:when test="${ empty poster_list }">
			<img id="main_poster" src="resources/images/photos/posters/poster0.jfif">
		</c:when>
		<c:otherwise>
			<img id="main_poster" src="${ poster_list[0] }">
		</c:otherwise>
    </c:choose>
	<img class="bookmark_img b_off" src="resources/images/bookmarkOff.svg" alt="bookmarkOff">
    <div id="main">
        <h1 id="movieNm"></h1>
        <h3 id="movieNmEn"></h3>
        <table id="main_table">
            <tr>
                <th>개봉</th><td id="openDt"></td>
                <th>평점</th><td id="main_grade"></td>
            </tr>
            <tr>
                <th>장르</th><td id="genres"></td>
                <th>국가</th><td id="nations"></td>
            </tr>
            <tr>
                <th>등급</th><td id="audits"></td>
                <th>러닝타임</th><td id="showTm"></td>
            </tr>
            <tr>
                <th>감독</th><td id="directors"></td>
                <th>제작사</th><td id="companys"></td>
            </tr>
        </table>
    </div>

    <div id="main_btns">
        <input id="info_btn" class="main_btns" type="button" data-target="#info_contents" data-end="1119" value="정보">
        <input id="person_btn" class="main_btns" type="button" data-target="#person_contents" data-end="1800" value="인물">
        <input id="photo_btn" class="main_btns" type="button" data-target="#photo_contents" data-end="1168" value="사진">
        <input id="grade_btn" class="main_btns" type="button" data-target="#grade_contents" value="평점">
    </div>

    <div id="info_contents" class="contents">
        <h1><img class="bar" src="resources/images/Bar.svg">시놉시스</h1>
        <p>
            따단-딴-따단-딴 ♫<br>
            전 세계를 열광시킬 올 타임 슈퍼 어드벤처의 등장!<br><br>

            뉴욕의 평범한 배관공 형제 '마리오'와 '루이지'는<br>
            배수관 고장으로 위기에 빠진 도시를 구하려다<br>
            미스터리한 초록색 파이프 안으로 빨려 들어가게 된다.<br><br>

            파이프를 통해 새로운 세상으로 차원 이동하게 된 형제.<br>
            형 '마리오'는 뛰어난 리더십을 지닌 '피치'가 통치하는 버섯왕국에 도착하지만<br>
            동생 '루이지'는 빌런 '쿠파'가 있는 다크랜드로 떨어지며 납치를 당하고<br>
            ‘마리오’는 동생을 구하기 위해 '피치'와 '키노피오'의 도움을 받아 '쿠파'에 맞서기로 결심한다.<br><br>

            그러나 슈퍼스타로 세상을 지배하려는 그의 강력한 힘 앞에<br>
            이들은 예기치 못한 위험에 빠지게 되는데...!<br><br>

            동생을 구하기 위해! 세상을 지키기 위해!<br>
            '슈퍼 마리오'로 레벨업하기 위한 '마리오'의 스펙터클한 스테이지가 시작된다!<br>
        </p>
    </div>

    <div id="person_contents" class="contents">
        <h1><img class="bar" src="resources/images/Bar.svg">감독</h1>
        <table id='director_table' class='is_profile'><tr></tr><tr></tr></table>
        <h1><img class="bar" src="resources/images/Bar.svg">출연</h1>
        <table id='actor_table' class='is_profile'><tr></tr><tr></tr><tr></tr></table>
        <h1><img class="bar" src="resources/images/Bar.svg">제작진</h1>
        <table id='crew_table' class='not_profile'></table>
        <h1><img class="bar" src="resources/images/Bar.svg">영화사</h1>
        <table id='company_table' class='not_profile'></table>
    </div>

    <div id="photo_contents" class="contents">
        <div id="posters_title" class="photo_titles">
            <h1><img class="bar" src="resources/images/Bar.svg">포스터</h1>
            <input id="posters_more" class="more_btns" type="button" data-target="#photo_contents_posters" data-end="1440" value="더보기">
        </div>
        <table id="posters_table" class="photo_table">
        	<tr>
        		<c:choose>
        			<c:when test="${ empty poster_list }">
        				<c:forEach var="i" begin="0" end="8">
		        			<td><img src="resources/images/photos/posters/poster${ i }.jfif"></td>
		        		</c:forEach>
        			</c:when>
        			<c:otherwise>
		        		<c:forEach items="${ poster_list }" var="imgP" end="8">
		        			<td><img src="${ imgP }"></td>
		        		</c:forEach>
        			</c:otherwise>
        		</c:choose>
        	</tr>
        </table>
        <div id="stills_title" class="photo_titles">
            <h1><img class="bar" src="resources/images/Bar.svg">스틸컷</h1>
            <input id="stills_more" class="more_btns" type="button" data-target="#photo_contents_stills" data-end="1220" value="더보기">
        </div>
        <table id="stills_table" class="photo_table">
        	<tr>
        		<c:choose>
        			<c:when test="${ empty still_list }">
        				<c:forEach var="i" begin="0" end="4">
		        			<td><img src="resources/images/photos/stills/still${ i }.jfif"></td>
		        		</c:forEach>
        			</c:when>
        			<c:otherwise>
		        		<c:forEach items="${ still_list }" var="imgS" end="4">
		        			<td><img src="${ imgS }"></td>
		        		</c:forEach>
        			</c:otherwise>
        		</c:choose>
        	</tr>
        </table>
    </div>

    <div id="photo_contents_posters" class="contents">
        <div id="posters_more_title" class="photo_titles">
            <h1><img class="bar" src="resources/images/Bar.svg">포스터</h1>
            <h3></h3>
            <input class="close_btns" type="button" data-target="#photo_contents_posters" data-end="1168" value="X">
        </div>
        <div class="photo_more_contents">
            <input class="slide_btn prev_btn" type="button" value="&lt;">
            <img id="big_posters">
            <input class="slide_btn next_btn" type="button" value="&gt;">
        </div>
    </div>

    <div id="photo_contents_stills" class="contents">
        <div id="stills_more_title" class="photo_titles">
            <h1><img class="bar" src="resources/images/Bar.svg">스틸컷</h1>
            <h3></h3>
            <input class="close_btns" type="button" data-target="#photo_contents_stills" data-end="1168" value="X">
        </div>
        <div class="photo_more_contents">
            <input class="slide_btn prev_btn" type="button" value="&lt;">
            <img id="big_stills">
            <input class="slide_btn next_btn" type="button" value="&gt;">
        </div>
    </div>

    <div id="grade_contents" class="contents">
        <div id="grade_title">
            <h1><img class="bar" src="resources/images/Bar.svg">평점</h1>
            <h2>★8.8점(10개)</h2>
        </div>
        <div id="write_comment">
            <div id="write_title">
                작성자 <input id="writer" class="is_write" name="작성자" type="text">
                암호 <input id="pw" class="is_write" name="암호" type="password">
                별점
                <div id="star_radio">
                    <input type="radio" name="start_select" value="1">
                    <input type="radio" name="start_select" value="2">
                    <input type="radio" name="start_select" value="3">
                    <input type="radio" name="start_select" value="4">
                    <input type="radio" name="start_select" value="5">
                    <input type="radio" name="start_select" value="6">
                    <input type="radio" name="start_select" value="7">
                    <input type="radio" name="start_select" value="8">
                    <input type="radio" name="start_select" value="9">
                    <input type="radio" name="start_select" value="10" checked>
                </div>
                <p id="write_star">★10</p><br>
            </div>
            <textarea id="write_text" class="is_write" name="댓글" rows="4" cols="80">댓글을 입력하세요.</textarea>
            <div id="write_end">
                <p id="text_th">0/100</p>
                <input id="write_btn" type="button" value="등록">
            </div>
        </div>
        <div id="comment_sort">
            <input class="sort_btn" data-target="date" id="sort_date_btn" type="button" value="최신순">
            <input class="sort_btn" data-target="star" type="button" value="별점순">
        </div>
        <ul id="comment_list"></ul>
    </div>

    <footer>
        <p>
            HAPPY MOVIE<br>
            대표 : 코딩이최고조 | 전화번호 : 010-1234-5678 | 주소 : Zoom 소회의실4
        </p>
    </footer>
</body>
</html>