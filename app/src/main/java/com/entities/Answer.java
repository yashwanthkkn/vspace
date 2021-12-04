package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Answer {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int oid;
	private int qid;
	private String options;
	public  int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public  String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	
	public Answer()
	{
		
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
}
