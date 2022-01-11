package com.jandiFactoring.redJandi.findJandi.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jandiFactoring.redJandi.common.paging.dto.SelectCriteria;
import com.jandiFactoring.redJandi.findJandi.model.dto.FindJandiDTO;

@Mapper
public interface FindJandiMapper {

	int selectFindAllJandiTotalCount(SelectCriteria selectCriteria);
	
	List<FindJandiDTO> selectFindAllJandiList(SelectCriteria selectCriteria);

}
