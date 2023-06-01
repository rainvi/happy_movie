package rank;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


public class searchImg {
	public String imgurl(String title) throws Exception {
        String clientId = "pkmvLTeLEPA0RC5iu8SS"; //애플리케이션 클라이언트 아이디
        String clientSecret = "8nXp1Im0rl"; //애플리케이션 클라이언트 시크릿

        String text = null;
        try {
            text = URLEncoder.encode(title + " 포스터", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }


        String apiURL = "https://openapi.naver.com/v1/search/image?query=" + text;    // JSON 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // XML 결과


        Map<String, String> requestHeaders = new HashMap();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        
        ModelAndView mv = new ModelAndView();
        
        ObjectMapper mapper = new ObjectMapper();
    	HashMap<String,Object> result = mapper.readValue(responseBody, HashMap.class);
    	String responseBody2 = ((ArrayList)result.get("items")).get(0).toString();
    	String[] parts = responseBody2.split(", ");
    	String link = null;
        for(String part : parts) {
            if(part.startsWith("link=")) {
                link = part.substring(5);  // "link=" 의 길이는 5 이므로        
            }
        }
        return link;
    }
	public String searchContent(String title) throws Exception {
        String clientId = "pkmvLTeLEPA0RC5iu8SS"; //애플리케이션 클라이언트 아이디
        String clientSecret = "8nXp1Im0rl"; //애플리케이션 클라이언트 시크릿

        String text = null;
        try {
            text = URLEncoder.encode(title , "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }


        String apiURL = "https://openapi.naver.com/v1/search/moive.xml?query=" + text;    // JSON 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // XML 결과


        Map<String, String> requestHeaders = new HashMap();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        
        ModelAndView mv = new ModelAndView();
        
        ObjectMapper mapper = new ObjectMapper();
    	HashMap<String,Object> result = mapper.readValue(responseBody, HashMap.class);
    	String responseBody2 = ((ArrayList)result.get("items")).get(0).toString();
    	String[] parts = responseBody2.split(", ");
    	String link = null;
    	return responseBody2;
		/*for(String part : parts) {
		    if(part.startsWith("link=")) {
		        link = part.substring(5);  // "link=" 의 길이는 5 이므로        
		    }
		}
		return link;*/
    }



    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 오류 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
        }
    }
}
