<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DetailedDBManagement</title>
	<script src="resources/js/jquery-3.6.4.min.js"></script>
	<script src="resources/js/KobisOpenAPIRestService.js"></script>
	<script>
		$(document).ready(function() {
			let key = "736697ae7e8ff21f7f31778b2d47a87d";
			
			// 어제 날짜
	        let yesterday = new Date();
	        yesterday.setDate(yesterday.getDate() - 1);
	        let options = {
	        		year: "numeric",
	        		month: "2-digit",
	        		day: "2-digit"
	        };
	        let targetDt = yesterday.toLocaleDateString('ko-KR', options).replace(/\./g, "").replace(/\s/g, "");
	        
			// 일별 박스오피스 순위 API data load
			$.ajax({
				type: "get",
				url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=" + key + "&targetDt=" + targetDt,
				success: function(data) {
					$("#boxH1").text(targetDt + " 박스오피스 순위");
					
					let boxData = data.boxOfficeResult.dailyBoxOfficeList;
					let movieCdArr = [];	// 영화 코드
					let movieNmArr = [];	// 영화 제목
					
					for (let i = 0; i < boxData.length; i++) {
						$("#boxForm").append("<input type='checkbox' id='cd" + (i+1) + "' name='cds' value='" 
								+ boxData[i].movieCd + "' checked />");
						$("#boxForm").append("<label for='cd" + (i+1) + "'>" + boxData[i].movieCd + "</label>&nbsp;");
						$("#boxForm").append("<input type='checkbox' id='nm" + (i+1) + "' name='nms' value='"
								+ boxData[i].movieNm + "' checked />");
						$("#boxForm").append("<label for='nm" + (i+1) + "'>" + boxData[i].movieNm + "</label><br>");
					}
				}	// success end
			});	// ajax end
		});	// document end
	</script>
</head>
<body>
	<h1 id="boxH1"></h1>
	<div id="boxForm"></div>
</body>
</html>