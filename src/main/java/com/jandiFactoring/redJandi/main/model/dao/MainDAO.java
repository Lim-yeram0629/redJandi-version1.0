package com.jandiFactoring.redJandi.main.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;

@Mapper
public interface MainDAO {

	List<ClassDTO> selectAllClassList();

}
