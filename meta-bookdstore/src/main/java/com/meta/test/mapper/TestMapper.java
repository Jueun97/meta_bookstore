package com.meta.test.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.meta.test.vo.TestVo;


//이곳은 우리가 Spring으로만 구성했던 프로젝트쪽에서
//Dao쪽을 맡은 부분.
//mybatis를 사용하기에 mybatis의 mapper개념을
//이용해서 Dao의 명칭을 mapper로 변경하여 사용하기로 결정.

@Mapper
public interface TestMapper {
	//interface로 구성하고 함수명과 반환 
	//객체를 선언할 뿐. 
	//하지만 위에 @Mapper라는 어노테이션이
	//이를 스캔하고 src/main/resources 하위의
	//mapper패키지 안의 mapper.xml들과 매칭.
	
	//즉, mapper.xml안에서 정의한 sql문의 id값과 
	//선언한 함수의 이름이 동일해야한다.
	
	//현재 이 테스트는 jblog 프로젝트 구성시 사용했던 DB를 이용
	//board 테이블을 출력하고자 함.
	public List<TestVo> test();
}
