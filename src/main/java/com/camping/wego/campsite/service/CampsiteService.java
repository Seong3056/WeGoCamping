package com.camping.wego.campsite.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.wego.campsite.mapper.ICampsiteMapper;
import com.camping.wego.vo.CampsiteVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
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

}
