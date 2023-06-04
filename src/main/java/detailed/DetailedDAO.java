package detailed;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.CrewDTO;
import dto.ImageDTO;
import dto.MovieDTO;
import dto.ReviewDTO;
import dto.ReviewPagingDTO;
import dto.UserDTO;

@Repository
public class DetailedDAO {
	@Autowired
	SqlSession session;
	
	/// detailed 기능
	// movie_id로 movie_table 조회
	public MovieDTO oneMovie(String movie_id) {
		return session.selectOne("oneMovie", movie_id);
	}
	
	// crew_table에서 사람이름, 프로필 사진 조회
	public List<CrewDTO> crewProfile(String movie_id) {
		return session.selectList("crewProfile", movie_id);
	}
	
	// image_table에서 포스터, 스틸컷 조회
	public List<String> imagePS(ImageDTO dto) {
		return session.selectList("imagePS", dto);
	}
	
	// review count
	public int reviewCount(String movie_id) {
		return session.selectOne("reviewCount", movie_id);
	}
	
	// review_table 조회
	public List<ReviewDTO> reviewUserList(ReviewPagingDTO dto) {
		return session.selectList("reviewUserList", dto);
	}
	
	// review update
	public void reviewUpdate(ReviewDTO dto) {
		session.selectOne("reviewUpdate", dto);
	}
	
	// review rating_star avg
	public double reviewStarAvg(String movie_id) {
		return session.selectOne("reviewStarAvg", movie_id);
	}
	
	// movie star update
	public void reviewStarUpdate(MovieDTO dto) {
		session.selectOne("reviewStarUpdate", dto);
	}
	
	/// DB Test 기능
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
	
	// image_table insert
	public void insertImageTable(ImageDTO dto) {
		session.selectOne("insertImageTable", dto);
	}
	
	// crew_table insert
	public void insertCrewTable(CrewDTO dto) {
		session.selectOne("insertCrewTable", dto);
	}
	
	// review_table insert
	public void insertReviewTable(ReviewDTO dto) {
		session.selectOne("insertReviewTable", dto);
	}
}
