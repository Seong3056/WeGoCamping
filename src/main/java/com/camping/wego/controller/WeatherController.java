package com.camping.wego.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.camping.wego.campsite.service.ICampsiteService;
import com.camping.wego.vo.CampsiteVO;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class WeatherController {

	@Autowired
	private ICampsiteService service;

	@GetMapping("/weather/{cno}")
    public  List<Map<String,Object>> restRequest() {
        
        try {
             String serviceKey = URLEncoder.encode("JS7jeuof+pwfeEbRwoql+Wry6jw2GgIJlD3GWpVjjxNvEQSSGIc6HaD90Rg3u48tnw6LVidKVigCK2YAxGc4Hw==", "UTF-8");
                String pageNo = "1";
                String numOfRows = "1000000";
                String dataType = "JSON";
                String regId = "11D10201";
                String tmFc = "202306060600";

                StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa"); 
                urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + serviceKey); 
                urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNo);
                urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + numOfRows); 
                urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + dataType); 
                urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + regId); 
                urlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + tmFc);

                URL url = new URL(urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");

                BufferedReader rd;
                if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                } else {
                    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                }

                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = rd.readLine()) != null) {
                    sb.append(line);
                }
                rd.close();
                conn.disconnect();
                
                ObjectMapper mapper = new ObjectMapper();
                JsonNode node = mapper.readTree(sb.toString());

                // "item" 데이터 추출
                JsonNode itemNode = node.path("response").path("body").path("items").path("item");

                // JsonNode -> List 변환
                List<Map<String,Object>> itemList = mapper.convertValue(itemNode, new TypeReference<List<Map<String,Object>>>(){});

                
                return itemList;
                
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    
    }
}
