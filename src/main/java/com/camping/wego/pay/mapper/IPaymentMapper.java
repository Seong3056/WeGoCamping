package com.camping.wego.pay.mapper;

import com.camping.wego.vo.PayVO;

public interface IPaymentMapper {
	
	
		//결제내역 저장
		void insert(PayVO vo);
		
		//결제내역 불러오기
		PayVO loadPay(String payNum);
		
		//결제코드 조회
		int inPayNum(String payNum);

		//결제코드 조회(tid)
		PayVO loadTid(String tid);
}
