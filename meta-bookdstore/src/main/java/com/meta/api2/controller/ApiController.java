package com.meta.api2.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.meta.api2.service.ApiService;
import com.meta.api2.vo.ApiVo;
import com.meta.stock.service.StockService;

@Controller
public class ApiController {

	@Autowired
	private ApiService apiService;
	@Autowired
	private StockService stockService;

	@RequestMapping("api/insert/book/{no}")
	public void main(@PathVariable int no) {
		String clientId = "YIvIdiFc5N3WNOGUZEGZ"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "L9nI9wDgfv"; // 애플리케이션 클라이언트 시크릿값"

		@SuppressWarnings("unused")
		String text = "";
		try {
			text = URLEncoder.encode("그린팩토리", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		// 책api요청쿼리
		// d_catg=카테고리넘버, d_title=책제목, display=출력
		// json 결과
		String apiURL = "https://openapi.naver.com/v1/search/book_adv.json?d_catg=" + no + "&d_titl=a&display=20";

		// api요청
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);
		JSONObject object = null;
		JSONArray jsonArray = new JSONArray();

		try {
			Gson gson = new Gson();
			object = new JSONObject(responseBody);
			jsonArray = (JSONArray) object.get("items");
			// System.out.println(jsonArray);

			int index = 0;
			while (index < jsonArray.length()) {
				//출력한 책 정보 json데이터를 ApiVo로 변환 
				ApiVo apiVo = gson.fromJson(jsonArray.get(index).toString(), ApiVo.class);
				
				//카테고리 넘버입력(파라미터에서 값 받아옴) 
				apiVo.setCate_no(no);
				String scrappingUrl = apiVo.getLink();
				try {
				
				Document document = Jsoup.connect(scrappingUrl).get();
				Elements container = document.getElementById("bookIntroContent").getElementsByTag("p");
				String description = container.toString();
				
				apiVo.setDescription(description);

				//데이터 DB삽입 
			
				}catch(Exception e) {
					System.out.println("error : " + scrappingUrl);
					apiVo.setDescription("");
				}finally{
					index++;
					apiService.insert(apiVo);
					stockService.initializeStock(apiVo.getBook_no());
				}

			
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

}