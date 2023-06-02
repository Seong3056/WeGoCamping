package com.camping.wego.util;

import java.net.URI;
import java.sql.PseudoColumnUsage;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
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
    
    
    
    public String kakaoPayReady(PayVO vo) {
 
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        
        log.info(String.valueOf(vo.getAmount()*vo.getQuantity()));
        
        LocalDate date = LocalDate.now();
        String payNum = String.valueOf(date.getYear()) +
        		String.valueOf(date.getMonthValue()) +
        		String.valueOf(date.getDayOfMonth());
        		
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", payNum);
        params.add("partner_user_id", vo.getPartnerUserId());
        params.add("item_name", vo.getItemName());
        params.add("quantity",  String.valueOf(vo.getQuantity()) );
        params.add("total_amount", String.valueOf(vo.getAmount()*vo.getQuantity()) );
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost/rsv/3");
        params.add("fail_url", "http://localhost/rsv/2");
        
        PayVO paySuccess = new PayVO();
        paySuccess.setAmount(vo.getAmount()*vo.getQuantity());
        paySuccess.setCno(vo.getCno());
        paySuccess.setItemName(vo.getItemName());
        paySuccess.setPartnerUserId(vo.getPartnerUserId());
        paySuccess.setQuantity(vo.getQuantity());
        paySuccess.setPayNum(payNum);
        
        payService.insert(paySuccess);
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("kakaopayReadyvo: " + kakaoPayReadyVO);
            log.info("next_redirect_pc_url: "+kakaoPayReadyVO.getNext_redirect_pc_url());
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (Exception e) {
            // TODO Auto-generated catch block
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
        headers.add("Authorization", "KakaoAK " + "");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "gorany");
        params.add("pg_token", pg_token);
        params.add("total_amount", "2100");
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
          
            return kakaoPayApprovalVO;
        
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return null;
    }
}
