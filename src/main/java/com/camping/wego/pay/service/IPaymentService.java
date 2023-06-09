package com.camping.wego.pay.service;

import java.util.List;

import com.camping.wego.vo.PayVO;

public interface IPaymentService {

	//결제내역 저장
	void insert(PayVO vo);
	
	//결제내역 불러오기
	PayVO loadPay(String payNum);
	
	//결제코드 조회
	int inPayNum(String payNum);
	
	//결제코드 조회(tid)
	PayVO loadTid(String tid);

	List<PayVO> getList(String userId);
}
