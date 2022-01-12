package com.jandiFactoring.redJandi.jandi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jandiFactoring.redJandi.jandi.model.service.JandiService;

@RestController
@RequestMapping("/jandi/*")
public class JandiRestController {
	
	private final JandiService jandiService;
	
	@Autowired
	public JandiRestController(JandiService jandiService){
		this.jandiService = jandiService;
	}
	
//	@PatchMapping("nickName/{email}")
//	public String ModifyJandiNickName(RedirectAttributes rttr) {
//		
//		return "";
//	}

}
