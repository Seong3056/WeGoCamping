package com.camping.wego.camp.mapper;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.camping.wego.campsite.mapper.ICampsiteMapper;
import com.camping.wego.vo.CampsiteVO;

import lombok.extern.slf4j.Slf4j;
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/config/db-config.xml"
})
@Slf4j
public class CampMapperTest {
	@Autowired 
	private ICampsiteMapper mapper;
	
	@Test
	@DisplayName("캠핑장 주소 따오기")
	public void test() {
		CampsiteVO vo =  mapper.info(789);
		String addr = vo.getAddr();
		
		String ar[] = addr.split(" ");
		addr = ar[0];
		if(ar[0].contains("제주")) addr= "제주";
		else if(ar[0].contains("도")) {			
			addr = addr.substring(0, 1) + addr.substring( (addr.indexOf("도")-1),addr.indexOf("도") );			
		}
		log.info("----------------"+addr);
	}
	@Test
	@DisplayName("캠핑장 주소 따오기")
	public void testCity() {
		CampsiteVO vo =  mapper.info(491);
		String addr = vo.getAddr();
		
		String ar[] = addr.split(" ");
		
		log.info(ar[1].substring( 0,
				(ar[1].indexOf("군")>0?ar[1].indexOf("군"):ar[1].indexOf("시"))
				));
		
	}
	
	@Test
	@DisplayName("위치 코드")
	public void testWeather() {
		String code = mapper.addrCode("인제");
		log.info(code);
		
		StringBuilder sb = new StringBuilder();
		sb.append("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa");
		sb.append("?ServiceKey=");
		sb.append("JS7jeuof%2BpwfeEbRwoql%2BWry6jw2GgIJlD3GWpVjjxNvEQSSGIc6HaD90Rg3u48tnw6LVidKVigCK2YAxGc4Hw%3D%3D");
		sb.append("&pageNo=" + "1");
		sb.append("&numOfRows=" + "1000000");
		sb.append("dataType"+"json");
		sb.append("&regId=" + code);
		sb.append("&tmFc=" + "202306050600");
		
		URL url;
		try {
			url = new URL(sb.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다.*/
			BufferedReader rd;
			
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				
				log.info(rd.toString() );
		} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sba = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
				sba.append(line);
		}
		rd.close();
		conn.disconnect();
		
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	
	
	}
	
}
