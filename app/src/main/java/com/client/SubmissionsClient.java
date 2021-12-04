package com.client;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.dao.AnswerDAO;
import com.dao.AnswerDAOImpl;
import com.dao.QuestionDAO;
import com.dao.QuestionDAOImpl;
import com.dao.SubmissionsDAO;
import com.dao.TestDAO;
import com.dao.TestDAOImpl;
import com.dao.UserDAO;
import com.dao.UserDAOImpl;
import com.entities.Answer;
import com.entities.CompKey_Submissions;
import com.entities.Question;
import com.entities.Submissions;
import com.entities.Test;
import com.entities.User;
import com.service.UserService;
import com.service.UserServiceImpl;


@SpringBootApplication(exclude = HibernateJpaAutoConfiguration.class)
@ComponentScan(basePackages = {"com"})
public class SubmissionsClient {

	public static void main(String[] args) {
		ConfigurableApplicationContext ctx =  SpringApplication.run(SubmissionsClient.class, args);
		CompKey_Submissions comp=new CompKey_Submissions();
		comp.setQid(1);
		comp.setTid(1);
		comp.setUid(1);
		Submissions sub=new Submissions();
		sub.setCompkey(comp);
		sub.setChoice("Choice_Correct");
		sub.setMark(200);
		sub.setState("Wrong");
		sub.setRightanswer("HEllo");
		SubmissionsDAO dao = ctx.getBean("SubmissionsDAO",SubmissionsDAO.class);
		dao.saveSubmissions(sub);
	}

}
