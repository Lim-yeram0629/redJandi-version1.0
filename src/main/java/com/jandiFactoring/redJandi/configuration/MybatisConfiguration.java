package com.jandiFactoring.redJandi.configuration;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "com.jandiFactoring.redJandi", annotationClass = Mapper.class)
public class MybatisConfiguration {
	
}
