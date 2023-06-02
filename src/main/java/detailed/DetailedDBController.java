package detailed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.MovieDTO;
import dto.UserDTO;

@Controller
public class DetailedDBController {
	@Autowired
	DetailedService service;
	
	@RequestMapping("/detaileddbtest")
	public ModelAndView detailedDBTest() {
		List<UserDTO> list = service.userList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("userlist", list);
		mv.addObject("usercount", list.size());
		mv.setViewName("detailed/detailed_db_test");
		return mv;
	}
	
	@RequestMapping("/detailedapitest")
	public String detailedMovieTest() {
		return "detailed/detailed_api_test";
	}
	
	@GetMapping("/detaileddbmanagement")
	public String detailedDBManagementGet() {
		return "detailed/detailed_db_management";
	}
	
	@PostMapping("/detaileddbmanagement")
	public ModelAndView detailedDBManagementPost(String[] cds, String[] nms) {
		MovieDTO dto = new MovieDTO();
		int cnt = 0;
		
		for (int i = 0; i < cds.length; i++) {
			dto = service.oneMovie(cds[i]);
			
			if (dto == null) {
				dto.setMovie_id(cds[i]);
				dto.setKor_title(nms[i]);
				service.insertBoxMovie(dto);
				cnt++;
			}
			dto = null;
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("cnt", cnt);
		mv.setViewName("detailed/detailed_db_management_result");
		return mv;
	}
}
