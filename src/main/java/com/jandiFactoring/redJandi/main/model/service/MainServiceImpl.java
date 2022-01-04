package com.jandiFactoring.redJandi.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.main.model.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService{
	
	private MainDAO mainDAO;
	
	@Autowired
	public MainServiceImpl(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}

	@Override
	public List<ClassDTO> selectAllClassList() {
		return mainDAO.selectAllClassList();
	}
	
	

}
