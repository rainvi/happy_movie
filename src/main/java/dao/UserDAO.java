package dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import dto.UserDTO;

@Repository("uer_mapper")
public class UserDAO implements UserDAOInt {
	
	SqlSession sqlSession;
	private static final String NAMESPACE = "mappers.user_mapper";
	@Override
	public void insertUser(UserDTO ud) {
		sqlSession.insert(NAMESPACE + ".insertUser", ud);
	}

	@Override
	public void updateUser(UserDTO ud) {
		sqlSession.update(NAMESPACE + ".updateUser", ud);
	}

	@Override
	public void deleteUser(String user_id) {
		sqlSession.delete(NAMESPACE + ".deleteUser", user_id);		
	}
	
	@Override
	public UserDTO selectUser(String user_id) throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".selectUser", user_id);
	}

	@Override
	public UserDTO selectUser(String user_id, String pw) throws Exception {
		Map<String, Object> data = new HashMap<>();
		data.put("user_id", user_id);
		data.put("pw", pw);
		return sqlSession.selectOne(NAMESPACE + ".selectUser", data);
	}

}
