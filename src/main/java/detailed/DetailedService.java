package detailed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.MovieDTO;
import dto.UserDTO;

@Service
public class DetailedService {
	@Autowired
	DetailedDAO dao;
	
	// user 조회
	public List<UserDTO> userList() {
		return dao.userList();
	}
	
	// movie_id로 movie_table 조회
	public MovieDTO oneMovie(String movie_id) {
		return dao.oneMovie(movie_id);
	}
	
	// 일별 박스오피스 순위권 영화 movie_table에 저장
	public void insertBoxMovie(MovieDTO dto) {
		dao.insertBoxMovie(dto);
	}
}