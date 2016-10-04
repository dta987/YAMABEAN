package com.storeMap.mapper;

import java.util.List;

import com.storeMap.dto.Store;

public interface StoreMapMapper {
	
	public int insertStoreMap(Store store);
	public List<Store> selectList();

}
