package com.entities;

import java.io.Serializable;

import javax.persistence.Embeddable;
@Embeddable
public class CompKey_Submissions implements Serializable{
	
	private int uid;
	private int tid;
	private int qid;
	public final int getUid() {
		return uid;
	}
	public final void setUid(int uid) {
		this.uid = uid;
	}
	public final int getTid() {
		return tid;
	}
	public final void setTid(int tid) {
		this.tid = tid;
	}
	public final int getQid() {
		return qid;
	}
	public final void setQid(int qid) {
		this.qid = qid;
	}
	

}
