<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="referrer" content="no-referrer" />
	<title>RANK | HAPPYMOVIE</title>
	<link href = "resources/images/MainIcon.ico" rel = "shortcut icon">
	<link href = "resources/css/rank.css?v=5" rel = "stylesheet">
	<script src="resources/js/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {
		
		});
	</script>

</head>
<body>
	

<header class="top"> 
    <div class="main_logo">
        <a href="main.html"><img src="resources/images/logo.svg" alt="Main" id="logo"></a>
    </div>
    <div class = "login">
        <button id = "button_login" type = "button">LOGIN</button>
    </div>

    <div id="search">
        <input type="text" placeholder="영화 제목" class = 'search_input'/>
        <a href="search.html"><img src="resources/images/searchIcon.svg" /></a> 
    </div>
</header>
    <div class="wrap"> 
        <div class="choice">
            <span id="reservation" class="link"><a href="rank">예매율순 </a></span>| <span id="grade" class="link purple" ><a href="grade">평점순</a></span> | <span id="genre" class="link">장르별</span>
        </div>
        <div class="genre_choice">
		<%-- 영화명:<input type="text" name="movieNm" value="<%=movieNm %>"> <br/>
		개봉연도조건:<input type="text" name="openStartDt" value="<%=openStartDt %>"> ~ <input type="text" name="openEndDt" value="<%=openEndDt %>">
		제작연도조건:<input type="text" name="prdtStartYear" value="<%=prdtStartYear %>"> ~ <input type="text" name="prdtEndYear" value="<%=prdtEndYear %>"> --%>		
		<%-- 영화형태:
			<c:forEach items="${movieTypeCd.codes}" var="code" varStatus="status">
			<input type="checkbox" name="movieTypeCdArr" value="<c:out value="${code.fullCd}"/>" id="movieTpCd_<c:out value="${code.fullCd}"/>"/> <label for="movieTpCd_<c:out value="${code.fullCd}"/>"><c:out value="${code.korNm}"/></label>
			<c:if test="${status.count %4 eq 0}"><br/></c:if>
			</c:forEach>
			<br/> --%>
            <span id="action" class="genre_text" ><a href="genrelist?genre=action">액션</a></span>
            <span id="comedy" class="genre_text" ><a href="genrelist?genre=comedy">코미디</a></span>
            <span id="thriller" class="genre_text" ><a href="genrelist?genre=thriller">스릴러</a></span>
            <span id="romance" class="genre_text" ><a href="genrelist?genre=romance">로맨스</a></span>
            <span id="fantasy" class="genre_text"><a href="genrelist?genre=fantasy">판타지</a></span>
		</div>
        
        
        <div class="content">
<%ArrayList totalArray = (ArrayList)session.getAttribute("totalArray"); %>
<%-- <%request.setAttribute("totalArray", totalArray); %> --%>
<%-- <%System.out.println(totalArray); %> --%>
<table class="grade table active">
            <%int num = 1; %>
            <tr>
            <c:forEach items="${totalArray}" var="boxoffice" begin="0" end="4">
				<td>
					<div class="rank">
						<%=num %>
					</div>
					<a href="detailed?movie_id=${boxoffice.movieCd}" >
					<div class='inner_wrap'>
                           <div class="inner_text">
                               <span class="back"> <c:out value="${boxoffice.contents }"></c:out> </span>
                           </div>
                       </div> 
                       </a>
                       <div class='img_wrap'>
                               <img referrerpolicy="no-referrer" src="${boxoffice.imgurl}" alt="영화포스터" class="img">
                       </div>
                       <h3><a href="detailed?movie_id=${boxoffice.movieCd}" ><c:out value="${boxoffice.movieNm }"/></a></h3>
                       <p>평점 <span class='score'>${boxoffice.grade}</span> 예매율 <c:out value="${boxoffice.salesShare }"/>%</p>
                       <p>개봉 <c:out value="${boxoffice.openDt }"/></p>
				</td>	
			<%num++; %>
			</c:forEach>
			</tr>
			<tr>
			<c:forEach items="${totalArray}" var="boxoffice" begin="5" end="10">
				<td>
					<div class="rank">
						<%=num %>
					</div>
					<a href="detailed?movie_id=${boxoffice.movieCd}" >
					<div class='inner_wrap'>
                           <div class="inner_text">
                               <span class="back"> <c:out value="${boxoffice.contents }"></c:out> </span>
                           </div>
                       </div> 
                       </a>
                       <div class='img_wrap'>
                               <img referrerpolicy="no-referrer" src="${boxoffice.imgurl}" alt="영화포스터" class="img">
                       </div>
                       <h3><a href="detailed?movie_id=${boxoffice.movieCd}" ><c:out value="${boxoffice.movieNm }"/></a></h3>
                       <p>평점 <span class='score'>${boxoffice.grade}</span> 예매율 <c:out value="${boxoffice.salesShare }"/>%</p>
                       <p>개봉 <c:out value="${boxoffice.openDt }"/></p>
				</td>	
			<%num++; %>
			</c:forEach>
			</tr>
          	</table>
        </div>
    </div>   
    <footer id="foot">

        <p>HAPPY MOVIE<br/>
            대표 : 코딩이최고조 | 전화번호 : 010-1234-5678 | 주소 : Zoom 소회의실4
        </P>
    
    </footer>
    <script type="text/javascript" src="resources/js/rank.js?v=9"></script>
</body>
</html>
