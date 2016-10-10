package com.order.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.menu.dto.MenuEntity;
import com.order.mapper.OrderMapper;

@Repository
public class OrderRepository {

	@Autowired
	private OrderMapper mapper;

	public List<MenuEntity> selectList() {
		
		return mapper.selectList();
	}

}
