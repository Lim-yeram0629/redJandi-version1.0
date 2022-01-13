package com.jandiFactoring.redJandi.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;
import com.jandiFactoring.redJandi.main.model.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService{
	
	private MainDAO mainDAO;
	
	@Autowired
	public MainServiceImpl(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}

	@Override
	public List<ClassDTO> popularClass() {
		return mainDAO.selectPopularClass();
	}

	@Override
	public List<JandiDTO> popularJandi() {
		return mainDAO.selectPupularJandi();
	}

	@Override
	public List<ClassDTO> viewClass() {
		return mainDAO.selectViewClass();
	}

	@Override
	public List<ClassDTO> newestClass() {
		return mainDAO.selectNewestClass();
	}

	@Override
	public List<ClassDTO> deadlineClass() {
		return mainDAO.selectDeadlineClass();
	}

	@Override
	public List<ClassDTO> highScoreClass() {
		return mainDAO.selectHighScoreClass();
	} 

/*	@Override
	public List<ClassDTO> selectAllClassList() {
		return mainDAO.selectAllClassList();
	} */
	
	

}
