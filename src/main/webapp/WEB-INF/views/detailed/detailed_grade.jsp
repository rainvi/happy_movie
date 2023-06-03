<%@page import="dto.ReviewDTO"%>
<%@page import="dto.CrewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="resources/images/MainIcon.ico">
    <link href="resources/css/detailed/detailed_main.css" rel=stylesheet>
    <link href="resources/css/detailed/detailed_grade.css" rel=stylesheet>
    <script src="resources/js/jquery-3.6.4.min.js"></script>
    <script src="resources/js/KobisOpenAPIRestService.js"></script>
    <script src="resources/js/detailed/detailed_main.js"></script>
    <script>
		/// Model Data
		let movieCd = ${ movie_id };
		
		// Model-review Data
		// 리뷰 생성자
		function StarComm(seq, user_id, name, pw, comment, star, date){
			this.seq = seq;
			this.user_id = user_id;
			this.name = name;
			this.pw = pw;
			this.comment = comment;
			this.star = star;
		    this.date = new Date(date).toLocaleString('ko-KR', {
		        year: 'numeric', 
		        month: 'numeric', 
		        day: 'numeric', 
		        hour: '2-digit', 
		        minute:'2-digit',
		        hourCycle: 'h23'
		    });
		    this.print = function() {
		        return "<table>"
		            + "<tr>"
		                + "<td class='inner_name'>" + this.name + "</td>"
		                + "<td class='inner_date'>" + this.date + "</td>"
		                + "<td class='inner_star'>★" + this.star + "</td>"
		            + "</tr>"
		            + "<tr><td colspan='3'>" + this.comment + "</td></tr>"
		            + "<tr>"
		                + "<td class='inner_btn' colspan='3'>"
		                    + "<input class='comment_table_btn change_btn' data-seq=" + this.seq + " type='button' value='수정'>"
		                    + "<input class='comment_table_btn delete_btn' data-seq=" + this.seq + " type='button' value='삭제'>"
		                + "</td>"
		            + "</tr>"
		        + "</table>";
		    }
		};	// StarComm end
		
		<% List<ReviewDTO> reviewList = (List<ReviewDTO>)request.getAttribute("review_list"); %>
		let grade_arr = [
			<% if(reviewList != null) {
					for (ReviewDTO dto : reviewList) { %>
						new StarComm(<%= dto.getSeq() %>,
								"<%= dto.getUser_id() %>",
								"<%= dto.getName() %>",
								"<%= dto.getPw() %>",
								"<%= dto.getContents() %>",
								<%= dto.getRating_star() %>,
								"<%= dto.getWriting_time() %>"),
					<% }
				} %>
		];	// review data end
		
		// Function
		function tryLogin() {
        	alert("로그인이 필요합니다.");
    	};
    	
    	function AvgGrade() {
    	    // len
    	    let grade_len = grade_arr.length;

    	    // sum
    	    let grade_sum = 0;
    	    grade_arr.forEach(g => {grade_sum += g.star});

    	    // avg
    	    let grade_avg = (grade_sum / grade_len).toFixed(1);

    	    // update
    	    $("#main_grade").text("★" + grade_avg);
    	    $("#grade_title h2").text("★" + grade_avg + "(" + grade_len + "개)");
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
			        let companys = movieData.companys[0].companyNm;	// 제작사
			        
			        
			        $("#detailed_title").text(movieNm + "ㅣHAPPYMOVIE");
			        $("#movieNm").text(movieNm);
			        $("#movieNmEn").text(movieNmEn + ", " + openDt.substring(0, 4));
			        $("#showTm").text(showTm + "분");
			        $("#openDt").text(openDt.substring(0, 4) + "." + openDt.substring(4, 6) + "." + openDt.substring(6, 8));
			        $("#audits").text(audits);
			        $("#companys").text(companys);
			        
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
			        });
			        directorsNm = directorsNm.join(", ");
			        $("#directors").text(directorsNm);
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
			
		    /// Bookmark event
			$(".bookmark_img").click(function(){
				if (${ sessionid == null }) {
					tryLogin();
				}
				else {
					if($(this).attr("alt") == "bookmarkOn") {
						$(this).attr({
							"class": "bookmark_img b_off",
							"alt": "bookmarkOff",
							"src": "resources/images/bookmarkOff.svg"
						});
					}
					else {
						$(this).attr({
							"class": "bookmark_img b_on",
							"alt": "bookmarkOn",
							"src": "resources/images/bookmarkOn.svg"
						});
					}					
				}
			});	// bookmark event end
			
			/// Review event
			// write event
		    $("#star_radio *").on("click", function() {
		        $("#write_star").text("★" + $(this).val());
		    });
		    $("#write_text").on({
		        keyup: function() {
		            let text_len = $(this).val().length;
		            let text_max = 100;
		            if (100 - text_len > 0) {
		                $("#text_th").text(text_len + "/" + text_max);
		            }
		            else {
		                alert(text_max + "자 까지 입력할 수 있습니다.");
		                $(this).val($(this).val().slice(0, 99));
		                $("#text_th").text(text_len + "/" + text_max);
		            }
		        },
		        focusin: function() {
		            if ($(this).val() == "댓글을 입력하세요.")
		                $(this).val("");
		            $(this).css({
		                "color": "white",
		                "outline": "none"
		            });
		        },
		        focusout: function() {
		            if ($(this).val() == "") {
		                $(this).val("댓글을 입력하세요.");
		                $(this).css("color", "#5F5F5F");
		            }
		        }

		    });
		    $("#write_btn").on("click", function(e) {
		        let empty_inputs = $(".is_write").filter(function() {
		            if ($(this).attr("id") === "write_text")
		                return $(this).val() === "댓글을 입력하세요.";
		            else
		                return $(this).val() === ""; 
		        });
		        if (empty_inputs.length > 0) {
		            let result = empty_inputs.map(function() {return this.name}).get().join(", ");
		            alert(result + "을(를) 입력하세요.");
		        }
		        else {
		            let name = $("#writer").val();
		            let pw = $("#pw").val();
		            let comment = $("#write_text").val();
		            let star = parseInt($("#star_radio *:checked").val());
		            let temp = new StarComm(name, pw, comment, star);

		            grade_arr.push(temp);
		            $("#comment_list").prepend("<li id='c_li" + temp.seq + "' data-seq='" + temp.seq + "'>" + temp.print() + "</li>");

		            AvgGrade();

		            let end = grade_arr.length * 125 + 1000;
		            FooterTop(end);
		        };
		    });

		    // sort event
		    $(".sort_btn[data-target='" + "${ sort_type }" + "']").addClass("sort_active");
		    $(".sort_btn").on("click", function() {
		        window.location.href = "detailedgrade?sort_type=" + $(this).data("target");
		    });
	        grade_arr.forEach((g) => {
	            $("#comment_list").append("<li id='c_li" + g.seq + "' data-seq='" + g.seq + "'>" + g.print() + "</li>");
	        });

		    // comment table button event
		    let td, what_btn, this_seq, find_data, find_pw;

		    $(document).on("click", ".comment_table_btn", function() {
		        this_seq = $(this).closest("li").data("seq");
		        find_data = grade_arr.find(item => item.seq == this_seq);
		        find_pw = (find_data).pw;
		        td = $(this).closest("td");
		    });

		    // pw input create
		    $(document).on("click", ".change_btn, .delete_btn", function() {
		        what_btn = $(this).val();
		        td.html("암호 <input id='pw_confirm" + this_seq + "' class='pw_confirm' type='password'>"
		            + "<input class='comment_table_btn pw_btn' type='button' value='확인'>"
		        );
		    });

		    // pw confirm
		    $(document).on("click", ".pw_btn", function() {
		        if ($("#pw_confirm" + this_seq).val() == find_pw) {
		            if (what_btn == "수정") {
		                $(this).closest("table").html("<tr>"
		                        + "<td class='change_input'><input id='change_name' type='text' value='" + find_data.name + "'></td>"
		                        + "<td class='change_input'><input id='change_pw' type='password' value='" + find_data.pw + "'></td>"
		                        + "<td class='inner_star'>"
		                            + "<select id='change_star'>"
		                                + "<option value='1'>★1</option>"
		                                + "<option value='2'>★2</option>"
		                                + "<option value='3'>★3</option>"
		                                + "<option value='4'>★4</option>"
		                                + "<option value='5'>★5</option>"
		                                + "<option value='6'>★6</option>"
		                                + "<option value='7'>★7</option>"
		                                + "<option value='8'>★8</option>"
		                                + "<option value='9'>★9</option>"
		                                + "<option value='10'>★10</option>"
		                            + "</select>"
		                        + "</td>"
		                    + "</tr>"
		                    + "<tr>"
		                        + "<td colspan='3'>"
		                        	+ "<textarea id='change_comment' rows='4' cols='80'>" + find_data.comment + "</textarea>"
		                        + "</td>"
		                    + "</tr>"
		                    + "<tr>"
		                    	+ "<td class='inner_btn' colspan='3'>"
		                    		+ "<input class='comment_table_btn change_confirm_btn' type='button' value='수정완료'>"
		                        + "</td>"
		                    + "</tr>"
		                );
		                $("#change_star").val(find_data.star.toString()).prop("selected", true);
		            }
		            else if (what_btn == "삭제") {
		                let is_delete = confirm("정말 삭제하시겠습니까?");
		                if (is_delete) {
		                    grade_arr = grade_arr.filter(item => item.seq != this_seq);
		                    AvgGrade();
		                    $("#c_li" + this_seq).remove();

		                    let end = grade_arr.length * 125 + 1000;
		                    FooterTop(end);
		                }
		                else {
		                    td.html("<input class='comment_table_btn change_btn' type='button' value='수정'>"
		                        + "<input class='comment_table_btn delete_btn' type='button' value='삭제'>"
		                    );
		                }
		            }
		        }
		        else {
		            alert("암호가 틀렸습니다.");
		            td.html("<input class='comment_table_btn change_btn' type='button' value='수정'>"
		                + "<input class='comment_table_btn delete_btn' type='button' value='삭제'>"
		            );
		        }
		    });

		    // change confirm
		    $(document).on("click", ".change_confirm_btn", function() {
		        find_data.name = $("#change_name").val();
		        find_data.pw = $("#change_pw").val();
		        find_data.comment = $("#change_comment").val();
		        find_data.star = parseInt($("#change_star").val());
		        find_data.date = new Date().toLocaleString('ko-KR', {
		            year: 'numeric', 
		            month: 'numeric', 
		            day: 'numeric', 
		            hour: '2-digit', 
		            minute:'2-digit',
		            hour12: false});

		        $("#c_li" + this_seq).html(find_data.print());
		        AvgGrade();
		    }); // review event end
		});	// document end
    </script>
    <title id="detailed_title"></title>
</head>
<body>
    <header>
        <a href="main"><img id="logo" src="resources/images/logo.svg"></a>
        <input id="login" type="button" value="LOGIN" onclick = "location.href = 'login'">
        <div id="search">
            <form id="searchForm" method="GET" action="search" accept-charset="UTF-8">
                <input class="inputValue" name="query" type="text" value="영화 제목">
                <input class="searchImg" type="image" type="submit" src="resources/images/searchIcon.svg">
            </form>
        </div>
    </header>
	<div id="main">
		<c:choose>
			<c:when test="${ empty movie_dto.img_url }">
				<img id="main_poster" src="resources/images/photos/posters/poster0.jfif">
			</c:when>
			<c:otherwise>
				<img id="main_poster" src="${ movie_dto.img_url }">
			</c:otherwise>
	    </c:choose>
		<img class="bookmark_img b_off" src="resources/images/bookmarkOff.svg" alt="bookmarkOff">
		<div id="main_info">
			<h1 id="movieNm"></h1>
			<h3 id="movieNmEn"></h3>
	        <table id="main_table">
	            <tr>
	                <th>개봉</th><td id="openDt"></td>
	                <th>평점</th><td id="main_grade">★${ movie_dto.rating_star }</td>
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
    </div>

    <div id="main_btns">
        <input id="info_btn" class="main_btns" type="button" data-url="detailed" value="정보">
        <input id="person_btn" class="main_btns" type="button" data-url="detailedperson" value="인물">
        <input id="photo_btn" class="main_btns" type="button" data-url="detailedphoto" value="사진">
        <input id="grade_btn" class="main_btns active" type="button" data-url="detailedgrade" value="평점">
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
        <%
        	String sort_type = (String)request.getAttribute("sort_type");
        	int cnt = (Integer)request.getAttribute("cnt");
        	int divNum = (Integer)request.getAttribute("divNum");
        	int totalPage = cnt / divNum;
        	
        	if (cnt % divNum != 0)
        		totalPage++;
        	
        	for (int p = 1; p <= totalPage; p++)
        		out.println("<a href=\"detailedgrade?sort_type=" + sort_type + "&page=" + p + "\">" + p + "</a> ");
        %>
    </div>

    <footer>
        <p>
            HAPPY MOVIE<br>
            대표 : 코딩이최고조 | 전화번호 : 010-1234-5678 | 주소 : Zoom 소회의실4
        </p>
    </footer>
</body>
</html>