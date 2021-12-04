package com.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.entities.User;
import com.util.HibernateConfiguration;

@Repository("userDao")
public class UserDAOImpl extends AbstractDAO<Integer, User> implements UserDAO{

	@Override
	public User findById(int uid) {
		return getByKey(uid);
	}

	@Override
	public void saveUser(User user) {
		persist(user);
		
	}

	@Override
	public void deleteUserById(int uid) {
		Criteria criteria =  createEntityCriteria();
       User user=(User)criteria.add(Restrictions.eq("uid", uid)).uniqueResult();
        delete(user);
		
	}

	@Override
	public List<User> findAllUsers() {
		Criteria criteria = createEntityCriteria();
        return (List<User>) criteria.list();
	}

	@Override
	public User findUserByEmailid(String emailid) {
		Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("emailid", emailid));
        
        return (User) criteria.uniqueResult();
	}
	
		
	

}
