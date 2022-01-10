package com.jandiFactoring.redJandi.findJandi.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jandiFactoring.redJandi.findJandi.model.dao.FindJandiMapper;
import com.jandiFactoring.redJandi.findJandi.model.dto.FindJandiDTO;

@Service
public class FindJandiServiceImpl implements FindJandiService{

	private FindJandiMapper findJandiMapper;
	
	@Autowired
	public FindJandiServiceImpl(FindJandiMapper findJandiMapper) {
		this.findJandiMapper = findJandiMapper;
	}

	@Override
	public List<FindJandiDTO> searchFindJandiList() {
		
		return findJandiMapper.selectAllFindJandiList();
	}

}
