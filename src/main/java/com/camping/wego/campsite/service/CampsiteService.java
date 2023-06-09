package com.camping.wego.campsite.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.wego.campsite.mapper.ICampsiteMapper;
import com.camping.wego.vo.CampsiteVO;
import com.camping.wego.vo.PageVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CampsiteService implements ICampsiteService {

	@Autowired
	private ICampsiteMapper mapper;

	@Override
	public void readOpenStoresFromJson(int num) {
        List<CampsiteVO> campsiteList = new ArrayList<>();

        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(new File("C:/work/campsite info_" + num + "_1000.json"));
            JsonNode responseNode = rootNode.get("response");
            JsonNode bodyNode = responseNode.get("body");
            JsonNode itemNode = bodyNode.get("items").get("item");

            if(itemNode.isArray()) {
                for(JsonNode node : itemNode) {
                    CampsiteVO campsite = objectMapper.convertValue(node, CampsiteVO.class);
                    campsiteList.add(campsite);
                }
            }

            campsiteList.stream().forEach(vo -> {
            	if(vo.getTel().equals("")) {
            		vo.setTel(null);
            	}
            });



        } catch (IOException e) {
            e.printStackTrace();
        }

        for(CampsiteVO vo : campsiteList) {
            mapper.insert(vo);
        }
	}
	
	@Override
	public void inputAmount() {
		int count = mapper.getCount();
		
		Random r = new Random();
		
		for(int i =0;i<count;i++) {
			
			int ran =(r.nextInt(80)+40)*1000;
			
			Map<String, Integer> map = new HashMap<>();
			map.put("amount", ran);
			map.put("cno", i+1);
			
			log.info("cno: "+(i+1)+"amount: "+ran);
			mapper.inputAmount( map );
		}
		
	}
	
	@Override
	public List<CampsiteVO> getList() {
		return mapper.getList();
	}
	

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

	@Override
	public CampsiteVO info(int cno) {
		return mapper.info(cno);
	}

	@Override
	public String[] addr(int cno) {

		String addr = mapper.info(cno).getAddr();		
		String ar[] = addr.split(" ");		
		return ar;
	}
	
	@Override 
	public List<CampsiteVO> getList(Map<String, String> map) {
		if(map.get("location").equals("")) {
			map.put("addr1", "");
			map.put("addr2", "");
		}else {
		map.put("addr1", map.get("location").substring(0,1));
		map.put("addr2", map.get("location").substring(1,2));
		}
		
		log.info(map.toString());
		return mapper.selectSearch(map);
	}
	
	@Override 
	public List<CampsiteVO> getList(Map<String, String> map, PageVO vo) {
		String addr1,addr2;
		if(map.get("location").equals("")) {
			addr1 = "";
			addr2 = "";
		}else {
		addr1 = map.get("location").substring(0,1);
		addr2 = map.get("location").substring(1,2);
		}
		String theme = map.get("theme");
		log.info(addr1+"       "+addr2);
		log.info(map.toString());
		int pageStart = vo.getPageStart();
		int cpp = vo.getCpp();
		return mapper.selectSearchPage(addr1,addr2,theme,pageStart,cpp);
	}
	
	@Override
	public String addrCode(String addrName) {
		return mapper.addrCode(addrName);
	}
	
	

}
