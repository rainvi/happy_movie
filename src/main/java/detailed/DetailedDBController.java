package detailed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.CrewDTO;
import dto.ImageDTO;
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
	
	@RequestMapping("/detaileddbinsert")
	public String detailedDBInsert() {
		return "detailed/detailed_db_insert";
	}
	
	@RequestMapping("/detaileddbinsertimage")
	public ModelAndView detailedDBInsertImage(ImageDTO dto) {
		ModelAndView mv = new ModelAndView();
		
		if (dto != null && dto.getImg_url() != null) {
			service.insertImageTable(dto);
			mv.addObject("insertresult", "image_table insert 성공");			
		}
		
		mv.setViewName("detailed/detailed_db_insert");
		return mv;
	}
	
	@RequestMapping("/detaileddbinsertcrew")
	public ModelAndView detailedDBInsertCrew(CrewDTO dto) {
		ModelAndView mv = new ModelAndView();
		
		if (dto != null && dto.getProfile_url() != null) {
			service.insertCrewTable(dto);
			mv.addObject("insertresult", "crew_table insert 성공");			
		}
		
		mv.setViewName("detailed/detailed_db_insert");
		return mv;
	}
}
