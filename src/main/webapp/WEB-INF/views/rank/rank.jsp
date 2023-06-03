<%@page import="rank.ApiSearch"%>
<%@page import="rank.movieList"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	
	String targetDt = request.getParameter("targetDt")==null?"20230530":request.getParameter("targetDt");			//조회일자
	String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");		//결과row수
	String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");		//“Y” : 다양성 영화 “N” : 상업영화 (default : 전체)
	String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");			//“K: : 한국영화 “F” : 외국영화 (default : 전체)
	String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");				//“0105000000” 로서 조회된 지역코드
	String curPage = request.getParameter("curPage")==null?"1":request.getParameter("curPage");					//현재페이지
	String movieNm = request.getParameter("movieNm")==null?"":request.getParameter("movieNm");						//영화명
	String directorNm = request.getParameter("directorNm")==null?"":request.getParameter("directorNm");				//감독명
	String openStartDt = request.getParameter("openStartDt")==null?"2020":request.getParameter("openStartDt");			//개봉연도 시작조건 ( YYYY )
	String openEndDt = request.getParameter("openEndDt")==null?"2022":request.getParameter("openEndDt");				//개봉연도 끝조건 ( YYYY )	
	String prdtStartYear = request.getParameter("prdtStartYear")==null?"":request.getParameter("prdtStartYear");	//제작연도 시작조건 ( YYYY )
	String prdtEndYear = request.getParameter("prdtEndYear")==null?"":request.getParameter("prdtEndYear");			//제작연도 끝조건    ( YYYY )
	String[] movieTypeCdArr = request.getParameterValues("movieTypeCdArr")==null? null:request.getParameterValues("movieTypeCdArr");	//영화형태코드 배열 (공통코드서비스에서 '2201'로 조회된 영화형태코드)
	String genreNm = request.getParameter("genreNm")==null?"없음":request.getParameter("genreNm");
	String genre_text = request.getParameter("genre_text") == null?"액션":request.getParameter("genre_text");

	request.setAttribute("genre_text", genre_text);
	// 발급키 3000회 제한
	String key = "b3a0415f8ef2c7923070066015819d92";
	/* String key = "bf2271f675c761c477ce7afc3b47bee1"; */
	/* String key = "478bf317e87507fd04843638f4a1ea4a"; */
	// KOBIS 오픈 API Rest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
 	// 영화코드조회 서비스 호출 (boolean isJson, String curPage, String itemPerPage,String directorNm, String movieCd, String movieNm, String openStartDt,String openEndDt, String ordering, String prdtEndYear, String prdtStartYear, String repNationCd, String[] movieTypeCdArr)
    String movieCdResponse = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);
	
 	// 일일 박스오피스 서비스 호출 (boolean isJson, String targetDt, String itemPerPage,String multiMovieYn, String repNationCd, String wideAreaCd)
    String dailyResponse = service.getDailyBoxOffice(true,targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd);
	
	// Json 라이브러리를 통해 Handling
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String,Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
	request.setAttribute("dailyResult",dailyResult);
	
	HashMap<String,Object> result = mapper.readValue(movieCdResponse, HashMap.class);
	request.setAttribute("result",result);
    /* System.out.println(result); */
	// KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson, String comCode )
	String codeResponse = service.getComCodeList(true,"0105000000");
	HashMap<String,Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
	request.setAttribute("codeResult",codeResult);
	
	String nationCdResponse = service.getComCodeList(true,"2204");
	HashMap<String,Object> nationCd = mapper.readValue(nationCdResponse, HashMap.class);
	request.setAttribute("nationCd",nationCd);

	String movieTypeCdResponse = service.getComCodeList(true,"2201");
	HashMap<String,Object> movieTypeCd = mapper.readValue(movieTypeCdResponse, HashMap.class);
	request.setAttribute("movieTypeCd",movieTypeCd);
%>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="referrer" content="no-referrer" />
	<title>RANK | HAPPYMOVIE</title>
	<link href = "resources/images/MainIcon.ico" rel = "shortcut icon">
	<link href = "resources/css/rank.css?v=3" rel = "stylesheet">
	<script src="resources/js/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {
		
		});
	</script>
	<script type="text/javascript">
	<%String movieTypeCds = "[";
		if(movieTypeCdArr!=null){
			for(int i=0;i<movieTypeCdArr.length;i++){
				movieTypeCds += "'"+movieTypeCdArr[i]+"'";
				if(i+1<movieTypeCdArr.length){
					movieTypeCds += ",";
				}
			}
			movieTypeCds += "]";%>
	
	$(function(){
		var movieTypeCd = <%=movieTypeCds%>;
		$(movieTypeCd).each(function(){
			$("input[name='movieTypeCdArr'][value='"+this+"']").prop("checked",true);
		});
	});
	
	<%}%>
	</script>
</head>
<body>
	<%movieList movielist = new movieList(); %>
	

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
<%
ApiSearch apiSearch = new ApiSearch();

%>
</header>
    <div class="wrap"> 
        <div class="choice">
            <span id="reservation" class="link purple">예매율순 </span>| <span id="grade" class="link">평점순</span> | <span id="genre" class="link">장르별</span>
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
        	<table class="reservation active table"> 
        	<tr>
        	<% ArrayList totalArray = new ArrayList(); %>
        		<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}">
					<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="0" end="4">
					<%HashMap boxOfficeMap = (HashMap) pageContext.getAttribute("boxoffice"); %>
					
					<%-- <%= img.searchContent((String)boxOfficeMap.get("movieNm")) %> --%>
							<td>
								<div class="rank">
									<c:out value="${boxoffice.rank }"/>
								</div>
								<a href="detailed?movie_id=${boxoffice.movieCd}" >
								<div class='inner_wrap'>
		                            <div class="inner_text">
		                            
		                            <%String contents = apiSearch.searchContent((String)boxOfficeMap.get("movieNm")); %>
		                                <span class="back"> <%=contents%></span>
		                            </div>
		                        </div> 
		                        </a>
		                        <div class='img_wrap'>
		                        <%String img_url = apiSearch.imgurl((String)boxOfficeMap.get("movieNm")); %>
		                        		<img referrerpolicy="no-referrer" src="<%=img_url%>" alt="영화포스터" class="img">
		                        </div>
		                        <h3><a href="detailed?movie_id=${boxoffice.movieCd}" ><c:out value="${boxoffice.movieNm }"/></a></h3>
		                        <%String grade =apiSearch.searchGrade((String)boxOfficeMap.get("movieNm"));  %>
		                        <%boxOfficeMap.put("grade", grade); %>
		                        <%boxOfficeMap.put("imgurl", img_url); %>
		                        <%boxOfficeMap.put("contents", contents); %>
		                        <p>평점 <span class='score'><%=grade%></span> 예매율 <c:out value="${boxoffice.salesShare }"/>%</p>
		                        <p>개봉 <c:out value="${boxoffice.openDt }"/></p>
							</td>
							<%totalArray.add(boxOfficeMap); %>
					</c:forEach>
				</c:if>
        	</tr>

        	<tr>
        	
        		<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}">
					<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice" begin="5" end="10">
					<%HashMap boxOfficeMap = (HashMap) pageContext.getAttribute("boxoffice"); %>
							<td>
								<div class="rank">
									<c:out value="${boxoffice.rank }"/>
								</div>
								<a href="detailed?movie_id=${boxoffice.movieCd}" >
								<div class='inner_wrap'>
		                            <div class="inner_text">
		                                <%String contents = apiSearch.searchContent((String)boxOfficeMap.get("movieNm")); %>
		                                <span class="back"> <%=contents%></span>
		                            </div>
		                        </div> 
		                        </a>
		                        <div class='img_wrap'>
		                        <%String img_url = apiSearch.imgurl((String)boxOfficeMap.get("movieNm")); %>
		                                <img referrerpolicy="no-referrer" src="<%=img_url%>" alt="영화포스터" class="img">
		                        </div>
		                        <h3><a href="detailed?movie_id=${boxoffice.movieCd}" ><c:out value="${boxoffice.movieNm }"/></a></h3>
		                        <%String grade =apiSearch.searchGrade((String)boxOfficeMap.get("movieNm"));  %>
		                        <%boxOfficeMap.put("grade", grade); %>
		                        <%boxOfficeMap.put("imgurl", img_url); %>
		                        <%boxOfficeMap.put("contents", contents); %>
		                        <p>평점 <span class='score'><%=grade%></span> 예매율 <c:out value="${boxoffice.salesShare }"/>%</p>
		                        <p>개봉 <c:out value="${boxoffice.openDt }"/></p>
							</td>
							<%totalArray.add(boxOfficeMap); %>
					</c:forEach>
				</c:if>
        	</tr>
        	<%Collections.sort(totalArray, new Comparator<Map<String, Object>>() {
        	    public int compare(Map<String, Object> m1, Map<String, Object> m2) {
        	        Double grade1 = Double.parseDouble((String) m1.get("grade"));
        	        Double grade2 = Double.parseDouble((String) m2.get("grade"));
        	        return grade2.compareTo(grade1); // Descending order
        	        // Use the following for ascending order
        	        // return grade1.compareTo(grade2); 
        	    }
        	}); %>
			<%session.setAttribute("totalArray", totalArray); %>
		
        	</table>
            <table class="grade table">
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
    <script type="text/javascript" src="resources/js/rank.js?v=3"></script>
</body>
</html>
