<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "java.util.*"%>
<%

String [] temp0 = {"피아니스트의 전설", "잊지 않았어요", "21 브릿지: 테러 셧다운 "};
String [] temp1 = {"The Legend Of 1900","","21 Bridges"};
String [] temp2 = {"20200101","20200101","20200101" };
String [] temp3 = {"드라마,판타지,뮤지컬","기타","스릴러,드라마,범죄"};
String [] temp4 = {"15세관람가", "15세이상관람가", "15세이상관람가"};
String [] temp5 = {"20124722", "20190549", "20191408"};
String[] temp6 = {
		"http://shop1.phinf.naver.net/20191126_144/1574743831817cdTUC_JPEG/12106165370947282_694873456.jpg",
		"http://post.phinf.naver.net/MjAyMDExMTRfMjkz/MDAxNjA1MzQyODU0NjA4.KXhzwpxdk4_wH2PR8dA04n0Ki8JUYO8Zx5N5XRVWJScg._JXpgzdFHWQxX8qjzrszRkbj_JcpMG98J3RWzmbOoNQg.PNG/IAKqyiH2hCD8ef_1L3YHuJrAFhDI.jpg",
		"http://post.phinf.naver.net/MjAyMDA5MjFfMjYg/MDAxNjAwNjcxMDQ3MDcy.EgTABvaI4Vuz1HEiFhpQVi-LH9JBXVQ1o46c3ZkLo7sg.3Mw9dTE0xe6vO-UUi3TkNnjO2pxcAQERJtuYhkBaFh0g.JPEG/I7gNxiQTPXK3gUYJNK01a8XmjXwQ.jpg"
};
int searchCnt = temp0.length;	//검색 결과 (페이징 필요)

List<String> SearchTitle = new ArrayList<>();
List<String> SearchEnTitle = new ArrayList<>();
List<String> SearchDate = new ArrayList<>();
List<String> SearchGenre = new ArrayList<>();
List<String> SearchAge = new ArrayList<>();
List<String> SearchId = new ArrayList<>();
List<String> SearchImg = new ArrayList<>();

for (int i = 0; i < searchCnt; i++){
	SearchTitle.add(temp0[i]);
	SearchEnTitle.add(temp1[i]);
	SearchDate.add(temp2[i]);
	SearchGenre.add(temp3[i]);
	SearchAge.add(temp4[i]);
	SearchId.add(temp5[i]);
	SearchImg.add(temp6[i]);
}

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SEARCH | HAPPYMOVIE</title>
    <link href = "resources/images/MainIcon.ico" rel = "shortcut icon">
    <link rel = "stylesheet" href = "resources/css/search.css">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>  
     $(document).ready(function() {
        // search
        let sInput = $("#search .inputValue");
        let sBtn = $("#search .searchImg");
        let sForm = $("#search #searchForm");
        let sSearch = $("#searchText");

        window.onpageshow = function(event){
            if ( event.persisted || (window.performance && window.performance.navigation.type == 2))
            sInput.val("");
        };

        $.urlParam = function(name){
            var result = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
            if (result == null) return null;
            else return result[1] || 0;
        }
        var dedata =  decodeURIComponent(decodeURIComponent($.urlParam('query')));
        sSearch.text("'"+dedata+"'");
        sInput.val(""); 

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
            if(sInput.val() === "" || sInput.val().match(rule)|| sInput.val() === 0){
                    alert("검색어를 입력하세요");              
                    event.preventDefault();
                    return;
                }
            var data = encodeURIComponent(sInput.val());
            sInput.val(data);
            sInput.css("color", "rgb(0,0,0)");
            sform.submit();
        }); 
     });
    </script>
</head>
<body>
    <header class = "search_head">
        <div class = "search_top">
            <div class = "search_logo">
                <a href = "/happymovie/main" class = "link_main">
                    <img src = "resources/images/logo.svg" class = "search_main" alt = "Main">
                </a>
            </div>
            <div class = "login">
                <button id = "button_login" type = "button" onclick = "location.href = 'finalLogin.html'">LOGIN</button>
            </div>
            <div id ="search">
                <form id = "searchForm" method = "GET" action = "./search" accept-charset="UTF-8">
                    <input type="text" class = "inputValue" name = "query" placeholder="영화 제목">
                    <input type="image" type = "submit" src="resources/images/searchIcon.svg" class = "searchImg">
                </form>
            </div>
        </div>
    </header>

    <div class = "search_page" style = "position: absolute; top: 80px;">
        
        <div class = "search_text" style = "position : relative; left: 40px; width : 85%; top: 20px;">
            <h2 style = "color: #BC6FF1; display : inline;" id = "searchText">
                ' '
            </h2>
            <h2 style = " display : inline;">검색 결과 </h2>
            <h4 style = "color:darkgray; display : inline;"><%=searchCnt %></h4>
        </div>
        
        <hr color = "#3F3F3F" style = "position : relative; top : 30px; margin-left : 20px; width : 1350px">

        <ul class = "search_list">
        <%for (int i = 0; i < searchCnt; i++){
        	%>
            <li>
                <div class = "slistItem">
                    <a href = "./detailed?movie_id=<%=SearchId.get(i) %>">
                        <img src = "<%=SearchImg.get(i) %>" alt = "movieImg" class = "itemImg">
                    </a>
                    <div class = "itemDetail" >
                        <strong class = "itemTitle" >
                            <a href = "./detailed?movie_id=<%=SearchId.get(i) %>"><%=SearchTitle.get(i) %></a>
                        </strong>
                        <span class = "itemEngTitle"><%=SearchEnTitle.get(i) %></span>
                        <dl><dt>제작</dt><dd><%=SearchDate.get(i) %></dd></dl>
                        <dl><dt>장르</dt><dd><%=SearchGenre.get(i) %></dd></dl>
                        <dl><dt>등급</dt><dd><%=SearchAge.get(i) %></dd></dl>
                    </div>
                </div>
            </li>
            <%}%>
        </ul>

    </div>
<div class="page_wrap">
   <div class="page_nation">
      <a class="arrow prev" href="#">◀</a>
      <a href="#" class = "number 1 active" >1</a>
      <a href="#" class = "number 2" >2</a>
      <a href="#" class = "number 3" >3</a>
      <a href="#" class = "number 4" >4</a>
      <a href="#" class = "number 5" >5</a>
      <a class="arrow next" href="#">▶</a>
   </div>
</div>
<script>
$(document).ready(function(){
	
	const totalCnt =<%=searchCnt%>;	//전체 검색 결과 갯수
	let currentPage = 1;	//현재 페이지
	const pageCnt = 5;	//bar 하나 당 page 개수
	const limitData = 5;	//page 하나 당 검색 결과 개수

	let totalPage = Math.ceil(totalCnt/limitData); //  총 page 개수 	 
	let pageGroup = Math.ceil(currentPage / pageCnt); //현재 group 위치

	let lastNum = pageGroup*pageCnt;	//현재 group 마지막 번호
	if(lastNum > totalPage ){	//이게 마지막 페이지일 경우
		 lastNum = totalPage;
	}
	let firstNum = lastNum - (pageCnt - 1);	//현재 group 첫 번째 번호

	const next = lastNum + 1;	//next 버튼 눌렀을 때 마지막 번호
	const prev = firstNum - 1;	//prev 버튼 눌렀을 때 첫 번째 번호

	$(".number").click(function(){
		$(".active").removeClass('active');
		$(this).addClass('active');
	})
	$("arrow prev").click(function(){
		$(".number 1").text(prev);
	})
	$("arrow next").click(function(){
		$(".number 5").text(next);
	})
});


</script>
    
    <footer style = "top : 1600px;">
        <p>HAPPY MOVIE<br/>
            대표 : 코딩이최고조 | 전화번호 : 010-1234-5678 | 주소 : Zoom
            소회의실4
        </footer>
</body>
</html>