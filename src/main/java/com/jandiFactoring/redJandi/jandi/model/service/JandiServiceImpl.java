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
	public JandiDTO selectJandiInformation(JandiDTO jandi) {
		return jandiMapper.selectJandiInformation(jandi);
	}

	@Override
	public List<FindClassDTO> selectJandiClassList(JandiDTO jandi) {
		return jandiMapper.selectJandiClassList(jandi);
	}

	@Override
	public boolean modifyJandiNickName(JandiDTO jandi) {
		return jandiMapper.modifyJandiNickName(jandi);
	}

}
