package com.ezen.spring.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.spring.dao.UserDAO;
import com.ezen.spring.domain.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service
public class UserServiceImpl implements UserService{
	
	private final UserDAO udao;

	@Transactional
	@Override
	public int register(UserVO uvo) {
		// TODO Auto-generated method stub
		int isOk = udao.insert(uvo);
		return udao.insertAuthInit(uvo.getEmail());
	}
	
}
