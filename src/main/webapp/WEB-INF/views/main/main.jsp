<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "java.util.*"%>
<% 
				//외부 데이터
				String[] temp = {"436456403", "436630194", "436812015", "435981212", "435447130", "435661653"};
				String[] temp2 = {"제비 | 오늘을 살아가기 위한 뜨거운 외침", "드림 | 못 보던 거 보여 '드림'", "킬링로멘스 | 스타의 탄생", "소울메이트 | 다름으로 가까워지는 영화", "민족 | 역사의 끝에 남겨진 그들의 이야기", "카운트 | 긍정 파워 풀충전!"};
				int videoCnt = temp.length;
				
				String[] temp3 = {"뮤지컬 청춘소음","스프린터", "남은 인생 10년", "트랜스포머: 비스트의 서막", "스크림6"};
				double[] temp4 = {9.4, 9.1, 9, 8.7, 8.3};
				String[] temp5 ={
						"http://imgnews.naver.net/image/003/2022/12/19/NISI20221219_0001156685_web_20221219135911_20221219140607093.jpg",
						"http://imgnews.naver.net/image/5249/2023/04/23/0000156462_001_20230423135402891.jpg",
						"http://imgnews.naver.net/image/5575/2023/04/27/0000374087_001_20230427081202868.jpeg",
						"https://img.extmovie.com/files/attach/images/135/376/540/090/451856d47bd2091e3c346812843ea12d.jpg",
						"https://img.extmovie.com/files/attach/images/135/553/357/090/08f507f2e0e61c7a0f71e2d6cd38e81c.jpg"};
				String[] temp6 = {
						"20232051", "20211541", "20231677", "20232025", "20231843"
				};
				
				
				String[] temp7 = {"피아니스트의 전설", "잊지 않았어요", "21 브릿지: 테러 셧다운 ","파바로티", "청춘빌라 살인사건","알.이.엠","알라딘-램프의 신"};
				
				Double[] temp8 = {9.2, 6.5, 7.5, 8.3, 6.5, 6.5, 6.0};
				String[] temp9 = {
						"http://shop1.phinf.naver.net/20191126_144/1574743831817cdTUC_JPEG/12106165370947282_694873456.jpg",
						"http://post.phinf.naver.net/MjAyMDExMTRfMjkz/MDAxNjA1MzQyODU0NjA4.KXhzwpxdk4_wH2PR8dA04n0Ki8JUYO8Zx5N5XRVWJScg._JXpgzdFHWQxX8qjzrszRkbj_JcpMG98J3RWzmbOoNQg.PNG/IAKqyiH2hCD8ef_1L3YHuJrAFhDI.jpg",
						"http://post.phinf.naver.net/MjAyMDA5MjFfMjYg/MDAxNjAwNjcxMDQ3MDcy.EgTABvaI4Vuz1HEiFhpQVi-LH9JBXVQ1o46c3ZkLo7sg.3Mw9dTE0xe6vO-UUi3TkNnjO2pxcAQERJtuYhkBaFh0g.JPEG/I7gNxiQTPXK3gUYJNK01a8XmjXwQ.jpg",
						"http://post.phinf.naver.net/MjAxOTEyMDVfMjk4/MDAxNTc1NDgwMjk3MzY1.JZsY3Lh-HV8BmD2eAYO8bzzK1BYo_05LhvZ4i86TRKEg.iVjD2P5ynbwj_faNEiBUvekMRNreOJBJYN7E5cBhTKsg.JPEG/IqkyaWvfNE7_CMELQY4G_VX4gjZo.jpg",
						"http://imgnews.naver.net/image/5348/2019/12/30/30_609119_70005_20191230174247897.jpg",
						"http://imgnews.naver.net/image/5033/2018/07/19/0001639285_006_20180719084007004.jpg",
						"http://image.kyobobook.co.kr/newimages/music/large/0925/2529093.jpg"
				};
				String[] temp10 = {
						"20124722", "20190549", "20191408", "20196412", "20186647", "20191625", "20192577"
				};
				int bookmarkCnt = temp7.length;
				
				//video 관련

				List<String> movieList = new ArrayList<>();
				for (int i = 0; i < videoCnt; i++){
					movieList.add(temp[i]);
				}
           
                List<String> movieText = new ArrayList<>();
                for (int i = 0; i < videoCnt; i++){
                	movieText.add(temp2[i]);
				}
                
                
                int mIndex = (int)((Math.random()*10000)%videoCnt);	//0~5 사이 숫자
                String muteB = "1"; //동영상 뮤트 여부
                
                //전체 영화 랭킹 제목 / 별점 / 포스터
                List<String> RankingTitle = new ArrayList<>();
                List<Double> RankingStar = new ArrayList<>();
                List<String> RankingImg = new ArrayList<>();
                List<String> RankingId = new ArrayList<>();
                
                for (int i = 0; i < 5; i ++){
                	RankingTitle.add(temp3[i]);
                	RankingStar.add(temp4[i]);
                	RankingImg.add(temp5[i]);
                	RankingId.add(temp6[i]);
                }
                
                //북마크 관리
                List<String> BookmarkTitle = new ArrayList<>();
                List<Double> BookmarkStar = new ArrayList<>();
                List<String> BookmarkImg = new ArrayList<>();
                List<String> BookmarkId = new ArrayList<>();
                
                for (int i = 0; i < bookmarkCnt; i ++){
                	BookmarkTitle.add(temp7[i]);
                	BookmarkStar.add(temp8[i]);
                	BookmarkImg.add(temp9[i]);
                	BookmarkId.add(temp10[i]);
                }
                
%>

<!DOCTYPE html>
<html></html>
<head>
    <meta charset="UTF-8">
    <title>MAIN | HAPPYMOVIE</title>
    <link href = "resources/images/MainIcon.ico"" rel = "shortcut icon">
    <link rel = "stylesheet" href = "resources/css/main.css">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>  
        $(document).ready(function() {
        	
        	
            // video slide       
            let mainView = [$('#main_video1'), $('#main_video2'), $('#main_video3')];
            let slideView = mainView[0];
            function mainView1(){
                if ($('#slide1').prop('checked')){
                    slideView = mainView[0];
                }
                else if ($('#slide2').prop('checked')){
                	slideView = mainView[1];
                }
                else if ($('#slide3').prop('checked')){
                    slideView = mainView[2];
                }
            };
         // video volume
            $("#volumeMuted").hover(function(){
                if($(this).attr("src") === "resources/images/volumeMuted.svg")
                    $(this).attr("src","resources/images/volumeMuted2.svg");
                else $(this).attr("src","resources/images/volumeUnmuted2.svg");
                $(this).css("width", "60px")
                $(this).css("height", "60px")
                $(this).css("transition","0.2s");
            },function(){
                if($(this).attr("src") === "resources/images/volumeMuted2.svg")
                    $(this).attr("src","resources/images/volumeMuted.svg");
                else $(this).attr("src","resources/images/volumeUnmuted.svg");
                $(this).css("width", "50px")
                $(this).css("height", "50px")
                $(this).css("transition","0.2s");
            });
			
         // chrome 정책상? 자동재생과 음소거 해제 동시에 불가능하다고 함..
            $("#volumeMuted").click(function(){
                mainView1();
                if($(this).attr("src") === "resources/images/volumeMuted2.svg"){
                    $(this).attr("src","resources/images/volumeUnmuted2.svg");
                    <%muteB = "0"; %>
                    if ($('#slide1').prop('checked')){
                    	slideView.attr("src","https://play-tv.kakao.com/embed/player/cliplink/"+<%= movieList.get(mIndex) %>+"?autoplay="+<%=muteB %>+"&mute="+<%=muteB %>+"&profile=HIGH&loop=1&playlist="+<%= movieList.get(mIndex) %>+"&controls=0");
                    }
                    else if ($('#slide2').prop('checked')){
                    	slideView.attr("src","https://play-tv.kakao.com/embed/player/cliplink/"+<%= movieList.get((mIndex+1)%videoCnt) %>+"?autoplay="+<%=muteB %>+"&mute="+<%=muteB %>+"&profile=HIGH&loop=1&playlist="+<%= movieList.get((mIndex+1)%videoCnt) %>+"&controls=0");
                    }
                    else if ($('#slide3').prop('checked')){
                    	slideView.attr("src","https://play-tv.kakao.com/embed/player/cliplink/"+<%= movieList.get((mIndex+2)%videoCnt) %>+"?autoplay="+<%=muteB %>+"&mute="+<%=muteB %>+"&profile=HIGH&loop=1&playlist="+<%= movieList.get((mIndex+2)%videoCnt) %>+"&controls=0");
                    }
                }
                else{
                    $(this).attr("src","resources/images/volumeMuted2.svg");
                    <%muteB = "1"; %>
                    if ($('#slide1').prop('checked')){
                    	slideView.attr("src","https://play-tv.kakao.com/embed/player/cliplink/"+<%= movieList.get(mIndex) %>+"?autoplay="+<%=muteB %>+"&mute="+<%=muteB %>+"&profile=HIGH&loop=1&playlist="+<%= movieList.get(mIndex) %>+"&controls=0");
                    }
                    else if ($('#slide2').prop('checked')){
                    	slideView.attr("src","https://play-tv.kakao.com/embed/player/cliplink/"+<%= movieList.get((mIndex+1)%videoCnt) %>+"?autoplay="+<%=muteB %>+"&mute="+<%=muteB %>+"&profile=HIGH&loop=1&playlist="+<%= movieList.get((mIndex+1)%videoCnt) %>+"&controls=0");
                    }
                    else if ($('#slide3').prop('checked')){
                    	slideView.attr("src","https://play-tv.kakao.com/embed/player/cliplink/"+<%= movieList.get((mIndex+2)%videoCnt) %>+"?autoplay="+<%=muteB %>+"&mute="+<%=muteB %>+"&profile=HIGH&loop=1&playlist="+<%= movieList.get((mIndex+2)%videoCnt) %>+"&controls=0");
                    }
                }
            });

            // video slide
            let slideL = $('.video_slide_left');
            let slideR = $('.video_slide_right');
            let slideT = $('.video_caption');

            function slideText1(){
                slideT.animate({opacity : -100}, 150, function(){
                    if ($('#slide1').prop('checked')){
                    slideT.text("<%= movieText.get(mIndex) %>");
                }
                else if ($('#slide2').prop('checked')){
                	 slideT.text("<%= movieText.get((mIndex+1)%videoCnt) %>");
                }
                else if ($('#slide3').prop('checked')){
                	 slideT.text("<%= movieText.get((mIndex+2)%videoCnt) %>");
                }
                });
                
                slideT.animate({opacity : 100}, 150);
            };

            function muteSlide(){
            	<%muteB = "1"; %>
                $("#volumeMuted").attr("src","resources/images/volumeMuted.svg");
                if ($('#slide1').prop('checked')){
                	slideView.attr("src","https://play-tv.kakao.com/embed/player/cliplink/"+<%= movieList.get(mIndex) %>+"?autoplay="+<%=muteB %>+"&mute="+<%=muteB %>+"&profile=HIGH&loop=1&playlist="+<%= movieList.get(mIndex) %>+"&controls=0");
                }
                else if ($('#slide2').prop('checked')){
                	slideView.attr("src","https://play-tv.kakao.com/embed/player/cliplink/"+<%= movieList.get((mIndex+1)%videoCnt) %>+"?autoplay="+<%=muteB %>+"&mute="+<%=muteB %>+"&profile=HIGH&loop=1&playlist="+<%= movieList.get((mIndex+1)%videoCnt) %>+"&controls=0");
                }
                else if ($('#slide3').prop('checked')){
                	slideView.attr("src","https://play-tv.kakao.com/embed/player/cliplink/"+<%= movieList.get((mIndex+2)%videoCnt) %>+"?autoplay="+<%=muteB %>+"&mute="+<%=muteB %>+"&profile=HIGH&loop=1&playlist="+<%= movieList.get((mIndex+2)%videoCnt) %>+"&controls=0");
                }
            };
            
            slideL.click(function(){
                if($('#slide1').prop('checked')) $('#slide3').prop('checked', true);
                else if($('#slide2').prop('checked')) $('#slide1').prop('checked', true);
                else if($('#slide3').prop('checked')) $('#slide2').prop('checked', true);
                muteSlide();
                slideText1();
                //slideView.get(0).currentTime = 0;
            });
            slideR.click(function(){
                if($('#slide1').prop('checked')) $('#slide2').prop('checked', true);
                else if($('#slide2').prop('checked')) $('#slide3').prop('checked', true);
                else if($('#slide3').prop('checked')) $('#slide1').prop('checked', true);
                muteSlide();
                slideText1();
                //slideView.get(0).currentTime = 0;
            });
            
            // search
            let sInput = $("#search .inputValue");
            let sBtn = $("#search .searchImg");
            let sForm = $("#search #searchForm");
        
            window.onpageshow = function(event){
            if ( event.persisted || (window.performance && window.performance.navigation.type == 2))
            sInput.val("");
        };

            sInput.focusin(function() {
                sInput.css({
                    "color": "white",
                    "outline": "none"
                });
            });
            var rule = /^\s+$/
            sForm.submit(function(event){                
                if(sInput.val() === "" || sInput.val().match(rule) || sInput.val() === 0){
                    alert("검색어를 입력하세요");                
                    event.preventDefault();
                    return;
                }
            });
            sBtn.click(function(){
                if(sInput.val() === "" || sInput.val().match(rule) || sInput.val() === 0){
                    alert("검색어를 입력하세요");                
                    event.preventDefault();
                    return;
                }
                var data = encodeURIComponent(sInput.val());
                sInput.val(data);
                sInput.css("color", "rgb(0,0,0)");
                sform.submit();    
            });
            setTimeout(function(){
                sInput.val('');
            });  
        });
    </script>
    <style></style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>

    <div class = "main_page">
        <header class = "main_head">
            <div class = "main_top">
                <div class = "main_logo">
                    <a href = "/happymovie/main" class = "link_main">
                        <img src = "resources/images/logo.svg" class = "logo_main" alt = "Main">
                    </a>
                </div>
                <div class = "login">
                    <button id = "button_login" type = "button" onclick = "location.href = '/finalLogin'">LOGIN</button>
                </div>
            </div>
        </header>
        
        <div class ="main_video_container">
            <div class = "main_view_list">
                <input type = "radio" name = "slide" id = "slide1" checked>
                <input type = "radio" name = "slide" id = "slide2">
                <input type = "radio" name = "slide" id = "slide3">
                
                <div class = "slideView">
                    <ul class= "slideList">
                        <li>
                            <a>
                            <iframe id = "main_video1" allow="autoplay; fullscreen; encrypted-media" 
                            allowfullscreen="" 
                            src="https://play-tv.kakao.com/embed/player/cliplink/
                            <%= movieList.get(mIndex) %>?autoplay=<%=muteB %>&mute=<%=muteB %>&profile=HIGH&loop=1&playlist=
                            <%= movieList.get(mIndex) %>&controls=0">
                            </iframe>
                            </a>
                        </li>
                        <li>
                            <a>
                                <iframe id = "main_video2" allow="autoplay; fullscreen; encrypted-media" 
                            allowfullscreen="" 
                            src="https://play-tv.kakao.com/embed/player/cliplink/
                            <%= movieList.get((mIndex+1)%videoCnt) %>?autoplay=<%=muteB %>&mute=<%=muteB %>&profile=HIGH&loop=1&playlist=
                            <%= movieList.get((mIndex+1)%videoCnt) %>&controls=0">
                            </iframe>
                            </a>
                        </li>
                        <li>
                            <a>
                                <iframe id = "main_video3" allow="autoplay; fullscreen; encrypted-media" 
                            allowfullscreen="" 
                            src="https://play-tv.kakao.com/embed/player/cliplink/
                            <%= movieList.get((mIndex+2)%videoCnt) %>?autoplay=<%=muteB %>&mute=<%=muteB %>&profile=HIGH&loop=1&playlist=
                            <%= movieList.get((mIndex+2)%videoCnt) %>&controls=0">
                            </iframe>
                            </a>
                        </li>
                    </ul>
                    <!-- 
                    <video autoplay loop muted id = "main_video3" oncontextmenu="return false">
                                    <source src = "resources/video/슈퍼 마리오 브라더스 공식 2차 예고편.mp4" type = "video/mp4">
                                    <strong>해당 브라우저에서는 영상을 지원하지 않습니다.</strong>
                                </video>
                     -->
                </div>
            </div>
            
            <div class = "video_caption" >
            <%=movieText.get(mIndex) %>
            </div> 
            
            <div class = "video_slide_left">
                <img src = "resources/images/videoSlideLeft.svg" id = "videoSlideLeft" alt = "videoSlideLeft">
            </div>
            <div class = "video_slide_right">
                <img src = "resources/images/videoSlideRight.svg" id = "videoSlideRight" alt = "videoSlideRight">
            </div>
            <div class = "video_volume_button">
                <img src = "resources/images/volumeMuted.svg" alt = "ImgButton" id = "volumeMuted">
            </div>
        </div>

        <div class = "main_search">
            <div id ="search">
                <form id = "searchForm" method = "GET" action = "/happymovie/search" accept-charset="UTF-8">
                    <input type="text" class = "inputValue" name = "query" placeholder="영화 제목">
                    <input type="image" type = "submit" src="resources/images/searchIcon.svg" class = "searchImg">
                </form>
            </div>
        </div>

        <div class = "main_menu">
            <nav id = "main_menu">
                <ul>
                    <li><a class = "menulink" id = "actionL" href = "/happymovie/rank?action">액션<br>TOP 10</a></li>
                    <li><a class = "menulink" id = "comedyL" href = "/happymovie/rank?comedy">코미디<br>TOP 10</a></li>
                    <li><a class = "menulink" id = "thrillerL" href = "/happymovie/rank?thriller">스릴러<br>TOP 10</a></li>
                    <li><a class = "menulink" id = "romanceL" href = "/happymovie/rank?romance">로맨스<br>TOP 10</a></li>
                    <li><a class = "menulink" id = "fantasyL" href = "/happymovie/rank?fantasy">판타지<br>TOP 10</a></li>
                </ul>
            </nav>
        </div>

        <div class = "main_ranking_text">
            <h2> <img src = "resources/images/Bar.svg" alt = "" style = "position : absolute; top:40px; left : -20px; width : 10px; height : 45px;">
                전체 영화 랭킹 TOP5</h2>
        </div>

        <div class = "main_ranking_5">
            <nav id = "main_ranking_5">
            <%!
            public String testStar (double star) throws Exception {
            	String result = "star50.svg";
            	if (9.0 <= star && star < 10.0) result = "star45.svg";
            	else if (8.0 <= star && star < 9.0) result = "star40.svg";	
            	else if (7.0 <= star && star < 8.0) result = "star35.svg";	
            	else if (6.0 <= star && star < 7.0) result = "star30.svg";	
            	else if (5.0 <= star && star < 6.0) result = "star25.svg";	
            	else if (4.0 <= star && star < 5.0) result = "star20.svg";	
            	else if (3.0 <= star && star < 4.0) result = "star15.svg";
            	else if (2.0 <= star && star < 3.0) result = "star10.svg";	
            	else if (1.0 <= star && star < 2.0) result = "star05.svg";	
            	else result = "star00.svg";
            return result;
            }
            %>
                <ul>
                    <li><a class = "ranking5link" href = "/happymovie/detailed?movie_id=<%=RankingId.get(0) %>">
                        <h3>1
                            <img src = "resources/images/star/<%=testStar(RankingStar.get(0)) %>" alt = "star" class = "star">
                        </h3>
                        <img src = "<%=RankingImg.get(0) %>" onerror="this.src = 'resources/images/NoMovie.png'""	alt = "movie1"><br>
                        <h6><%=RankingTitle.get(0) %></h6>
                    </a></li>
                    <li><a class = "ranking5link" href = "/happymovie/detailed?movie_id=<%=RankingId.get(1) %>">
                        <h3>2
                            <img src = "resources/images/star/<%=testStar(RankingStar.get(1)) %>" alt = "star" class = "star">
                        </h3>
                        <img src = "<%=RankingImg.get(1) %>" onerror="this.src = 'resources/images/NoMovie.png'" alt = "movie2"><br>
                        <h6><%=RankingTitle.get(1) %></h6>
                    </a></li>
                    <li><a class = "ranking5link" href = "/happymovie/detailed?movie_id=<%=RankingId.get(2) %>">
                        <h3>3
                            <img src = "resources/images/star/<%=testStar(RankingStar.get(2)) %>" alt = "star" class = "star">
                        </h3>
                        <img src = "<%=RankingImg.get(2) %>" onerror="this.src = 'resources/images/NoMovie.png'"" alt = "movie3"><br>
                        <h6><%=RankingTitle.get(2) %></h6>
                    </a></li>
                    <li><a class = "ranking5link" href = "/happymovie/detailed?movie_id=<%=RankingId.get(3) %>">
                        <h3>4
                            <img src = "resources/images/star/<%=testStar(RankingStar.get(3)) %>" alt = "star" class = "star">
                        </h3>
                        <img src = "<%=RankingImg.get(3) %>" onerror="this.src = 'resources/images/NoMovie.png'"" alt = "movie4"><br>
                        <h6><%=RankingTitle.get(3) %></h6>
                    </a></li>
                    <li><a class = "ranking5link" href = "/happymovie/detailed?movie_id=<%=RankingId.get(4) %>">
                        <h3>5
                            <img src = "resources/images/star/<%=testStar(RankingStar.get(4)) %>" alt = "star" class = "star">
                        </h3>
                        <img src = "<%=RankingImg.get(4) %>" onerror="this.src = 'resources/images/NoMovie.png'" alt = "movie5"><br>
                        <h6><%=RankingTitle.get(4) %></h6>
                    </a></li>
                </ul>
            </nav>
        </div>

		<div class = "main_ranking_text">
            <h2> <img src = "resources/images/Bar.svg" alt = "" style = "position : absolute; top:40px; left : -20px; width : 10px; height : 45px;">
                전체 영화 랭킹 TOP5</h2>
        </div>
        <div class = "main_bookmark_text">
            <h2> <img src = "resources/images/Bar.svg" alt = "" style = "position : absolute; top:40px; left : -20px; width : 10px; height : 45px;">
                나의 북마크</h2>
        </div>

        <div class = "main_bookmark">
            <nav id = "main_bookmark">
                <ul>
                <%for (int i = 0; i < bookmarkCnt; i++ ){ 
                		String mid = BookmarkId.get(i);
                %>
                    <li>
                    	<a class = "bookmark" href = "/happymovie/detailed?movie_id=<%= BookmarkId.get(i) %>">
                        <img src = "<%= BookmarkImg.get(i) %>" alt = "movie"><br>
                        <h6><%= BookmarkTitle.get(i) %></h6>
                    </a>
                    <img src = "resources/images/bookmarkOn.svg" alt = "<%=mid %>" class = "bookmarkButton">
                    </li>
                     <%} %>
                </ul>
            </nav>
        </div>
        
        <script>
        $(document).ready(function() {
        	//bookmark button
        	
        	$(".bookmarkButton").click(function(){
        		if($(this).attr("src") === "resources/images/bookmarkOn.svg"){
                    $(this).attr("src","resources/images/bookmarkOff.svg");
                    const movie_id = $(this).attr("alt");
                  //bookmark db에서 movie_id의 bookmark를 삭제
        		}        		
        	});
        	$(".bookmarkButton").hover(function(){
        		if($(this).attr("src") === "resources/images/bookmarkOff.svg"){
        			$(this).css("transform","scale(1.0)");
        		}
        	});
        });
        </script>
        
        <footer>
            <p>HAPPY MOVIE<br/>
                대표 : 코딩이최고조 | 전화번호 : 010-1234-5678 | 주소 : Zoom
                소회의실4
            </footer>
    </div>
</body>
