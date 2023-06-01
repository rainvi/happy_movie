package detailed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.UserDTO;

@Service
public class DetailedService {
	@Autowired
	DetailedDAO dao;
	
	public List<UserDTO> userList() {
		return dao.userList();
	}
}