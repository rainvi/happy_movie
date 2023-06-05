package detailed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.CrewDTO;
import dto.ImageDTO;
import dto.MovieDTO;
import dto.UserDTO;

@Service
public class DetailedService {
	@Autowired
	DetailedDAO dao;
	
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
	
	// movie_id로 movie_table 조회
	public MovieDTO oneMovie(String movie_id) {
		return dao.oneMovie(movie_id);
	}
	
	// image_table insert
	public void insertImageTable(ImageDTO dto) {
		dao.insertImageTable(dto);
	}
	
	// image_table에서 포스터, 스틸컷 조회
	public List<String> imagePS(ImageDTO dto) {
		return dao.imagePS(dto);
	}
	
	// crew_table insert
	public void insertCrewTable(CrewDTO dto) {
		dao.insertCrewTable(dto);
	}
	
	// crew_table에서 사람이름, 프로필 사진 조회
	public List<CrewDTO> crewProfile(String movie_id) {
		return dao.crewProfile(movie_id);
	}
}