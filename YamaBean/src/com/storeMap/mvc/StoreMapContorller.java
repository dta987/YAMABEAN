package com.storeMap.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.storeMap.dto.Store;

@Controller
public class StoreMapContorller {

	@Autowired
	private StoreMapService service;

	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public String moveStore(Model model) {
		System.out.println("==StoreMap이동==");
		List<Store> stores = service.findByList();
		
		model.addAttribute("stores", stores);
		
		System.out.println(stores.toString());
		
		
		return "storeMap";

	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createStore() {
		System.out.println("==Store추가==");

		Store store = new Store();

		store.setStore_name("알레그리아 건대 커피박스");
		store.setStore_phone("02-2122-1266");
		store.setStore_address("서울 광진구 아차산로 200");

		int cnt = service.addStore(store);

		if (cnt > 0) {
			System.out.println("성공");
		} else{
			System.out.println("실패");
		}
				

		return "storeMap";

	}
}
