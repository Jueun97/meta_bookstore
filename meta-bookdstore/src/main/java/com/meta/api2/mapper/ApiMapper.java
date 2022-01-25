package com.meta.api2.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.meta.api2.vo.ApiVo;


@Mapper
public interface ApiMapper {
	
	public int insert(ApiVo apiVo);
}
