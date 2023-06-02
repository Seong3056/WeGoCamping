package com.camping.wego.pay.service;

import com.camping.wego.vo.PayVO;

public interface IPaymentService {

	//결제내역 저장
	void insert(PayVO vo);
	
	//결제내역 불러오기
	PayVO loadPay(int payNum, String userId);
	
	
}
