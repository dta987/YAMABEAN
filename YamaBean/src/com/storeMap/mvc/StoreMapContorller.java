package com.storeMap.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreMapContorller {
	
	@RequestMapping(value="/move", method=RequestMethod.GET)
	public String moveMenu() {
		System.out.println("==StoreMap¿Ãµø==");
		return "storeMap";
		
	}

}
