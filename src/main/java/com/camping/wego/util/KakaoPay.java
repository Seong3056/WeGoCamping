package com.camping.wego.util;

import java.net.URI;
import java.sql.PseudoColumnUsage;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.camping.wego.pay.service.IPaymentService;
import com.camping.wego.vo.KakaoPayApprovalVO;
import com.camping.wego.vo.KakaoPayReadyVO;
import com.camping.wego.vo.PayVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class KakaoPay {
private static final String HOST = "https://kapi.kakao.com";
    

    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    
    @Autowired
    private IPaymentService payService;
    
    @Value("${kakao.adminkey}")
    private String adminkey;
    
    public String kakaoPayReady(PayVO vo) {
 
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        log.info("adminkey"+adminkey);
        headers.add("Authorization", "KakaoAK " + adminkey);
//        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        
        log.info(String.valueOf(vo.getAmount()*vo.getQuantity()));
        String payNum="";
        while (true) {
        	LocalDate date = LocalDate.now();
            Random r = new Random();
            payNum = 
            		String.valueOf(date.getMonthValue()) +
            		String.valueOf(date.getDayOfMonth()) +
            		String.valueOf(date.getYear()) + 
            		String.valueOf(r.nextInt(999999));
            
            int x = payService.inPayNum(payNum);
      
            if(x==0) break;
          
		}
        
        
    
        		
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", payNum);
        params.add("partner_user_id", vo.getPartnerUserId());
        params.add("item_name", vo.getItemName());
        params.add("quantity",  String.valueOf(vo.getQuantity()) );
        params.add("total_amount", String.valueOf(vo.getAmount()*vo.getQuantity()) );
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost/kakaoPaySuccess/");
        params.add("cancel_url", "http://localhost/rsv/3");
        params.add("fail_url", "http://localhost/rsv/2");
        
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
                  
            PayVO paySuccess = new PayVO();
            paySuccess.setAmount(vo.getAmount()*vo.getQuantity());
            paySuccess.setCno(vo.getCno());
            paySuccess.setItemName(vo.getItemName());
            paySuccess.setPartnerUserId(vo.getPartnerUserId());
            paySuccess.setQuantity(vo.getQuantity());
            paySuccess.setPayNum(payNum);
            paySuccess.setTid(kakaoPayReadyVO.getTid());
            
            payService.insert(paySuccess);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (Exception e) {
         
            e.printStackTrace();
        } 
        
        return "/pay";
        
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
 
        log.info("KakaoPayInfoVO............................................");
        log.info("-----------------------------");
        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        
        headers.add("Authorization", "KakaoAK " + adminkey);
//        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        
        
        
//        tid	String	결제 고유번호, 결제 준비 API 응답에 포함	O
//        partner_order_id	String	가맹점 주문번호, 결제 준비 API 요청과 일치해야 함	O
//        partner_user_id	String	가맹점 회원 id, 결제 준비 API 요청과 일치해야 함	O
//        pg_token	String	결제승인 요청을 인증하는 토큰
//        사용자 결제 수단 선택 완료 시, approval_url로 redirection해줄 때 pg_token을 query string으로 전달	O
//        payload	String	결제 승인 요청에 대해 저장하고 싶은 값, 최대 200자	X
//        total_amount	Integer	상품 총액, 결제 준비 API 요청과 일치해야 함	X
        
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        
        PayVO vo = new PayVO();

        vo = payService.loadTid(kakaoPayReadyVO.getTid());
        
        log.info("vovovovo"+vo.toString());
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", vo.getPayNum());
        params.add("partner_user_id", vo.getPartnerUserId());
        params.add("pg_token", pg_token);
        
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
         
            return kakaoPayApprovalVO;
        
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return null;
    }
}
