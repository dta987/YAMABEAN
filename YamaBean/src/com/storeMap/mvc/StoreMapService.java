package com.storeMap.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.storeMap.dto.Store;
@Service
public class StoreMapService {

	@Autowired
	private StoreMapRepository repository;

	public int addStore(Store store) {
		
		int cnt = repository.insertStoreMap(store);

		return cnt;

	}

	public List<Store> findByList() {
		
		List<Store> stores = repository.selectList();
		
		return stores;
	}

}
