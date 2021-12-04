package com.dao;

import java.util.List;

import com.entities.Test;

public interface TestDAO {
	Test findById(int tid);
	 
    void saveTest(Test test);
     
    void deleteTestById(int tid);
     
    List<Test> findAllTests();
 
    Test findTestByTestName(String tname);
}
