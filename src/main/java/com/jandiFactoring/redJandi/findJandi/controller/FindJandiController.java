package com.jandiFactoring.redJandi.findJandi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jandiFactoring.redJandi.common.paging.Pagenation;
import com.jandiFactoring.redJandi.common.paging.dto.SelectCriteria;
import com.jandiFactoring.redJandi.findJandi.model.dto.FindJandiDTO;
import com.jandiFactoring.redJandi.findJandi.model.service.FindJandiService;

@Controller
@RequestMapping("/findJandi/*")
public class FindJandiController {
	
	private FindJandiService findJandiService;
	
	@Autowired
	public FindJandiController(FindJandiService findJandiService) {
		this.findJandiService = findJandiService;
	}
	
	@GetMapping("findAllJandiMain")
	public void findAllJandiMain(Model model, SelectCriteria selectCriteria) {
		
		System.out.println(selectCriteria);
		
		selectCriteria.setLimit(9);
		selectCriteria.setButtonAmount(5);
		selectCriteria.setTotalCount(findJandiService.selectFindAllJandiTotalCount(selectCriteria));
		
		selectCriteria = Pagenation.getSelectCriteria(selectCriteria);
		List<FindJandiDTO> findJandiList = findJandiService.searchFindAllJandiList(selectCriteria);
		
		model.addAttribute("findJandiList", findJandiList);
		model.addAttribute("selectCriteria", selectCriteria);
	}

}
