package com.jandiFactoring.redJandi.main.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.main.model.service.MainService;

@Controller
@RequestMapping("/*")
public class MainController {
	
	private MainService mainService;
	
	@Autowired
	public MainController(MainService mainService) {
		this.mainService = mainService;
	}
	
	@GetMapping(value = {"/", "/main"})
	public String main() {
				List<ClassDTO> classDTOList = mainService.selectAllClassList();
		
		System.out.println("classDTOList : " + classDTOList);
		
	/*	List<ClassDTO> popularClass = mainService.popularClass();
		Collections.shuffle(popularClass); */
		
		return "main/main";
	}
	
}
