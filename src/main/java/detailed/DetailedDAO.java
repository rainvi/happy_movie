package detailed;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.CrewDTO;
import dto.ImageDTO;
import dto.MovieDTO;
import dto.UserDTO;

@Repository
public class DetailedDAO {
	@Autowired
	SqlSession session;
	
	// user_table 조회
	public List<UserDTO> userList() {
		return session.selectList("userList");
	}
	
	// image_table 조회
	public List<ImageDTO> imageList() {
		return session.selectList("imageList");
	}
	
	// crew_table 조회
	public List<CrewDTO> crewList() {
		return session.selectList("crewList");
	}
	
	// movie_id로 movie_table 조회
	public MovieDTO oneMovie(String movie_id) {
		return session.selectOne("oneMovie", movie_id);
	}
	
	// image_table insert
	public void insertImageTable(ImageDTO dto) {
		session.selectOne("insertImageTable", dto);
	}
	
	// image_table에서 포스터, 스틸컷 조회
	public List<String> imagePS(ImageDTO dto) {
		return session.selectList("imagePS", dto);
	}
	
	// crew_table insert
	public void insertCrewTable(CrewDTO dto) {
		session.selectOne("insertCrewTable", dto);
	}
	
	// crew_table에서 사람이름, 프로필 사진 조회
	public List<CrewDTO> crewProfile(String movie_id) {
		return session.selectList("crewProfile", movie_id);
	}
}
