package detailed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dto.CrewDTO;
import dto.ImageDTO;

@Controller
public class DetailedController {
	@Autowired
	DetailedService service;
	
	@RequestMapping("/detailed")
	public ModelAndView detailed(@RequestParam(value="movie_id", required=false, defaultValue="20226411") String movie_id) {
		// poster_list 생성
		ImageDTO posterdto = new ImageDTO();
		posterdto.setMovie_id(movie_id);
		posterdto.setImg_type('p');		
		List<String> poster_list = service.imagePS(posterdto);
		
		// still_list 생성
		ImageDTO stilldto = new ImageDTO();
		stilldto.setMovie_id(movie_id);
		stilldto.setImg_type('s');
		List<String> still_list = service.imagePS(stilldto);
		
		// crew_list 생성
		List<CrewDTO> crew_list = service.crewProfile(movie_id);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("movie_id", movie_id);
		mv.addObject("poster_list", poster_list);
		mv.addObject("still_list", still_list);
		mv.addObject("crew_list", crew_list);
		mv.setViewName("detailed/detailed");
		return mv;
	}
}
