package com.storeMap.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.storeMap.dto.Store;
import com.storeMap.mapper.StoreMapMapper;

@Repository
public class StoreMapRepository {

	@Autowired
	private StoreMapMapper mapper;
	
	public int insertStoreMap(Store store) {
		
		int cnt = mapper.insertStoreMap(store);
		
		
		return cnt;
		
		
	}

	public List<Store> selectList() {
		
		List<Store> stores = mapper.selectList();
		
		
		return stores;
	}

}
