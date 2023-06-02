package com.team4.happymovie;

import dao.UserDAO;
import dto.UserDTO;

public class userdaotest {
	UserDAO ud;
	
	public void test() throws Exception{
		UserDTO ut = new UserDTO();
		ut.setUser_id("test");
		ut.setName("test");
		ut.setPhone("01023452345");
		ut.setPw("test");
		ut.setEmail("test@test");
		ut.setAddress("test");
		
		ud.insertUser(ut);
	}
	public void test2() throws Exception{
		System.out.println(ud.selectUser("test"));
		System.out.println(ud.selectUser("test", "test"));
		System.out.println(ud.selectUser("admin", "admin"));
	}

}
