package com.jandiFactoring.redJandi.jandi.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jandiFactoring.redJandi.findClass.model.dto.FindClassDTO;
import com.jandiFactoring.redJandi.jandi.model.dao.JandiMapper;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;

@Service
public class JandiServiceImpl implements JandiService{
	
	private JandiMapper jandiMapper;
	
	@Autowired
	public JandiServiceImpl(JandiMapper jandiMapper) {
		this.jandiMapper = jandiMapper;
	}

	@Override
	public JandiDTO selectJandiInformation(String email) {
		return jandiMapper.selectJandiInformation(email);
	}

	@Override
	public List<FindClassDTO> selectJandiClassList(String email) {
		return jandiMapper.selectJandiClassList(email);
	}

}
