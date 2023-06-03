package detailed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.CrewDTO;
import dto.ImageDTO;
import dto.MovieDTO;
import dto.ReviewDTO;
import dto.ReviewPagingDTO;
import dto.UserDTO;

@Service
public class DetailedService {
	@Autowired
	DetailedDAO dao;
	
	/// detailed 기능
	// movie_id로 movie_table 조회
	public MovieDTO oneMovie(String movie_id) {
		return dao.oneMovie(movie_id);
	}
	
	// crew_table에서 사람이름, 프로필 사진 조회
	public List<CrewDTO> crewProfile(String movie_id) {
		return dao.crewProfile(movie_id);
	}
	
	// image_table에서 포스터, 스틸컷 조회
	public List<String> imagePS(ImageDTO dto) {
		return dao.imagePS(dto);
	}
	
	// review count
	public int reviewCount(String movie_id) {
		return dao.reviewCount(movie_id);
	}
	
	// review_table 조회
	public List<ReviewDTO> reviewUserList(ReviewPagingDTO dto) {
		return dao.reviewUserList(dto);
	}
	
	// review update
	public void reviewUpdate(ReviewDTO dto) {
		dao.reviewUpdate(dto);
	}
	
	
	/// DB Test 기능
	// user_table 조회
	public List<UserDTO> userList() {
		return dao.userList();
	}
	
	// image_table 조회
	public List<ImageDTO> imageList() {
		return dao.imageList();
	}
	
	// crew_table 조회
	public List<CrewDTO> crewList() {
		return dao.crewList();
	}
	
	// image_table insert
	public void insertImageTable(ImageDTO dto) {
		dao.insertImageTable(dto);
	}
	
	// crew_table insert
	public void insertCrewTable(CrewDTO dto) {
		dao.insertCrewTable(dto);
	}
	
	// review_table insert
	public void insertReviewTable(ReviewDTO dto) {
		dao.insertReviewTable(dto);
	}
}