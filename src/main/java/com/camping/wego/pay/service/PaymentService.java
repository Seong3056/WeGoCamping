package com.camping.wego.pay.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.wego.pay.mapper.IPaymentMapper;
import com.camping.wego.vo.PayVO;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class PaymentService implements IPaymentService {

	
	@Autowired
	private IPaymentMapper mapper;
	@Override
	public void insert(PayVO vo) {
		mapper.insert(vo);
	
	}
	@Override
	public PayVO loadPay(String payNum) {		
		return mapper.loadPay(payNum);
	}
	
	@Override
	public int inPayNum(String payNum) {		
		return mapper.inPayNum(payNum);
	}
	
	@Override
	public PayVO loadTid(String tid) {
		log.info("-------------------------service"+mapper.loadTid(tid));
		return mapper.loadTid(tid);
	}
	@Override
	public List<PayVO> getList(String userId) {		
		return mapper.getList(userId);
	}
}
