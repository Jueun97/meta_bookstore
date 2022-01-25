package com.meta.api2.service;


import org.springframework.stereotype.Service;

import com.meta.api2.mapper.ApiMapper;
import com.meta.api2.vo.ApiVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ApiService {
	
	private final ApiMapper mapper;
	
	public int insert(ApiVo apiVo) {
		//System.out.println("in service" + apiVo.toString());
		return mapper.insert(apiVo);
	}
}
