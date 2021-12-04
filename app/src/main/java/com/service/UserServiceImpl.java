package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UserDAO;
import com.entities.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO dao;
	@Override
	public User findById(int uid) {
		return dao.findById(uid);
	}

	@Override
	public void saveUser(User user) {
		dao.saveUser(user);
		
	}

	@Override
	public void updateUser(User user) {
		User entity = dao.findById(user.getUid());
		if(entity!=null) {
			entity.setEmailid(user.getEmailid());
			entity.setName(user.getName());
			entity.setPassword(user.getPassword());
			entity.setClaim(user.getClaim());
		}
	}

	@Override
	public void deleteUserById(int uid) {
		dao.deleteUserById(uid);
		
	}

	@Override
	public List<User> findAllUsers() {
		return dao.findAllUsers();
	}

	@Override
	public User findUserByEmailid(String emailid) {
		return dao.findUserByEmailid(emailid);
	}

	

}
