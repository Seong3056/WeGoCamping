package com.camping.wego.pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.wego.pay.mapper.IPaymentMapper;
import com.camping.wego.vo.PayVO;
@Service
public class PaymentService implements IPaymentService {

	
	@Autowired
	private IPaymentMapper mapper;
	@Override
	public void insert(PayVO vo) {
		mapper.insert(vo);
	
	}
	@Override
	public PayVO loadPay(int payNum, String userId) {
		// TODO Auto-generated method stub
		return null;
	}
}
