package dao;
import dto.UserDTO;

public interface UserDAOInt {
	/*
	 * ȸ������ - insert
	 * ȸ������ - update
	 * ȸ��Ż�� - delete
	 * ȸ����ȸ - select
	 */
	
	public void insertUser(UserDTO ud);
	public void updateUser(UserDTO ud);
	public void deleteUser(String user_id);
	public UserDTO selectUser(String user_id) throws Exception;
	public UserDTO selectUser(String user_id, String pw) throws Exception;
	
}
