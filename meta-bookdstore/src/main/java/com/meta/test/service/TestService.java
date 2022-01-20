package com.meta.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meta.test.mapper.TestMapper;
import com.meta.test.vo.TestVo;

//Service는 기존의 비즈니스 로직을 controller 또는
//Dao에서 같이 묶어서 병행했다면 Service를 통해
//우리가 하고자하는 비즈니스 로직을 구성하는 곳.

@Service
public class TestService {

	@Autowired
	private TestMapper mapper;
	
	
	public List<TestVo> test() {
		return mapper.test();
	}
	
}
