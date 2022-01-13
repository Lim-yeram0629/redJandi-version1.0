package com.jandiFactoring.redJandi.jandi.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jandiFactoring.redJandi.findClass.model.dto.FindClassDTO;
import com.jandiFactoring.redJandi.jandi.model.dao.JandiMapper;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;

@Transactional(rollbackFor = Exception.class)
@Service
public class JandiServiceImpl implements JandiService{
	
	private JandiMapper jandiMapper;
	
	@Autowired
	public JandiServiceImpl(JandiMapper jandiMapper) {
		this.jandiMapper = jandiMapper;
	}
	
	@Override
	public JandiDTO selectJandiInformation(JandiDTO jandiDTO) {
		return jandiMapper.selectJandiInformation(jandiDTO);
	}

	@Override
	public List<FindClassDTO> selectJandiClassList(JandiDTO jandiDTO) {
		return jandiMapper.selectJandiClassList(jandiDTO);
	}

	@Override
	public boolean modifyJandiNickName(JandiDTO jandiDTO) {
		return jandiMapper.modifyJandiNickName(jandiDTO);
	}

	@Override
	public boolean modifyProfile(JandiDTO jandiDTO) {
		return jandiMapper.modifyProfile(jandiDTO);
	}

}
