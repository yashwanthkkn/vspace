package com.dao;

import java.util.List;

import com.entities.Submissions;

public interface SubmissionsDAO {
	Submissions findById(int qid);
	 
    void saveSubmissions(Submissions submissions);
     
    void deleteSubmissionsById(int qid);
     
    List<Submissions> findAllSubmissionss();
}
