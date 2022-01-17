package com.jandiFactoring.redJandi.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;
import com.jandiFactoring.redJandi.main.model.dao.MainMapper;

@Service
public class MainServiceImpl implements MainService{
	
	private MainMapper mainMapper;
	
	@Autowired
	public MainServiceImpl(MainMapper mainMapper) {
		this.mainMapper = mainMapper;
	}

	@Override
	public List<ClassDTO> popularClass() {
		return mainMapper.selectPopularClass();
	}

	@Override
	public List<JandiDTO> popularJandi() {
		return mainMapper.selectPupularJandi();
	}

	@Override
	public List<ClassDTO> viewClass() {
		return mainMapper.selectViewClass();
	}

	@Override
	public List<ClassDTO> newestClass() {
		return mainMapper.selectNewestClass();
	}

	@Override
	public List<ClassDTO> deadlineClass() {
		return mainMapper.selectDeadlineClass();
	}

	@Override
	public List<ClassDTO> highScoreClass() {
		return mainMapper.selectHighScoreClass();
	} 

/*	@Override
	public List<ClassDTO> selectAllClassList() {
		return mainMapper.selectAllClassList();
	} */
	
	

}
