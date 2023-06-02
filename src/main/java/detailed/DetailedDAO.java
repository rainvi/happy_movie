package detailed;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.UserDTO;

@Repository
public class DetailedDAO {
	@Autowired
	SqlSession session;
	
	public List<UserDTO> userList() {
		return session.selectList("userList");
	}
}
