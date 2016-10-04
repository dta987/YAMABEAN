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
		System.out.println("==StoreMap�̵�==");
		List<Store> stores = service.findByList();
		
		model.addAttribute("stores", stores);
		
		System.out.println(stores.toString());
		
		
		return "storeMap";

	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createStore() {
		System.out.println("==Store�߰�==");

		Store store = new Store();

		store.setStore_name("�˷��׸��� �Ǵ� Ŀ�ǹڽ�");
		store.setStore_phone("02-2122-1266");
		store.setStore_address("���� ������ ������� 200");

		int cnt = service.addStore(store);

		if (cnt > 0) {
			System.out.println("����");
		} else{
			System.out.println("����");
		}
				

		return "storeMap";

	}
}
