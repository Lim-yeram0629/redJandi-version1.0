package com.jandiFactoring.redJandi.findJandi.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jandiFactoring.redJandi.findJandi.model.dto.FindJandiDTO;

@Mapper
public interface FindJandiMapper {

	List<FindJandiDTO> selectAllFindJandiList();

}
