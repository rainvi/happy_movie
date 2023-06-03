package dao;
import dto.UserDTO;

public interface UserDAOInt {
	/*
	 * 회원가입 - insert
	 * 회원수정 - update
	 * 회원탈퇴 - delete
	 * 회원조회 - select
	 */
	
	public void insertUser(UserDTO ud);
	public void updateUser(UserDTO ud);
	public void deleteUser(String user_id);
	public UserDTO selectUser(String user_id) throws Exception;
	public UserDTO selectUser(String user_id, String pw) throws Exception;
	
}
