package com.admin.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.admin.mapper.AdminMapper;

@Repository
public class AdminRepository {
	
	@Autowired
	private AdminMapper mapper;

}
