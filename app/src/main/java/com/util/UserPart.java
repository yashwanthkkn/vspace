package com.util;

import com.entities.Participation;
import com.entities.User;

public class UserPart {
	private User user;
	private Participation participation;
	
	public UserPart(User user, Participation participation) {
		super();
		this.user = user;
		this.participation = participation;
	}
	@Override
	public String toString() {
		return "UserPart [user=" + user + ", participation=" + participation + "]";
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Participation getParticipation() {
		return participation;
	}
	public void setParticipation(Participation participation) {
		this.participation = participation;
	}
	
}
