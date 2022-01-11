package com.jandiFactoring.redJandi.findJandi.model.service;

import java.util.List;

import com.jandiFactoring.redJandi.common.paging.dto.SelectCriteria;
import com.jandiFactoring.redJandi.findJandi.model.dto.FindJandiDTO;

public interface FindJandiService{

	/**
	 * 전체 잔디 보기 페이징 처리를 위한 전체 행 개수
	 * @author 임예람
	 */
	int selectFindAllJandiTotalCount(SelectCriteria selectCriteria);

	/**
	 * 전체 잔디 보기 페이징 처리한 잔디 리스트를 반환
	 * @author 임예람
	 */
	List<FindJandiDTO> searchFindAllJandiList(SelectCriteria selectCriteria);

}
