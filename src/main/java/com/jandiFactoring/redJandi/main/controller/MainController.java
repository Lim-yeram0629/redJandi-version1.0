package com.jandiFactoring.redJandi.main.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jandiFactoring.redJandi.classRoom.model.dto.ClassDTO;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;
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
	public String main(Model model) {
		
		
	/*	List<ClassDTO> classDTOList = mainService.selectAllClassList();
		
		System.out.println("classDTOList : " + classDTOList); */
		
		List<ClassDTO> popularClass = mainService.popularClass();
		System.out.println("=========================================================");
		System.out.println("popularClass : " + popularClass);
		Collections.shuffle(popularClass); 
		
		List<JandiDTO> popularJandi = mainService.popularJandi();
		Collections.shuffle(popularJandi);
		
		List<ClassDTO> viewClass = mainService.viewClass();
		
		List<ClassDTO> newestClass = mainService.newestClass();
		
		List<ClassDTO> deadlineClass = mainService.deadlineClass();
		
		List<ClassDTO> highScoreClass = mainService.highScoreClass();
		
		model.addAttribute("popularClass", popularClass);
		model.addAttribute("popularJandi", popularJandi);
		model.addAttribute("viewClass", viewClass);
		model.addAttribute("newestClass", newestClass);
		model.addAttribute("deadlineClass", deadlineClass);
		model.addAttribute("highScoreClass", highScoreClass);
		
		return "main/main";
	}
	
}
