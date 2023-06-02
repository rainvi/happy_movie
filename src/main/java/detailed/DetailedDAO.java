package detailed;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.MovieDTO;
import dto.UserDTO;

@Repository
public class DetailedDAO {
	@Autowired
	SqlSession session;
	
	// user 조회
	public List<UserDTO> userList() {
		return session.selectList("userList");
	}
	
	// movie_id로 movie_table 조회
	public MovieDTO oneMovie(String movie_id) {
		return session.selectOne("oneMovie", movie_id);
	}
	
	// 일별 박스오피스 순위권 영화 movie_table에 저장
	public void insertBoxMovie(MovieDTO dto) {
		session.selectOne("insertBoxMovie", dto);
	}
}
