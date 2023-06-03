package detailed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dto.CrewDTO;
import dto.ImageDTO;
import dto.MovieDTO;
import dto.ReviewDTO;
import dto.ReviewPagingDTO;

@Controller
public class DetailedController {
	@Autowired
	DetailedService service;
	
	// @RequestMapping("/detailed")
//	public ModelAndView detailed(@RequestParam(value="movie_id", required=false, defaultValue="20226411") String movie_id) {
//		// MovieDTO 생성
//		MovieDTO movie_dto = service.oneMovie(movie_id);
//		
//		// poster_list 생성
//		ImageDTO posterdto = new ImageDTO();
//		posterdto.setMovie_id(movie_id);
//		posterdto.setImg_type('p');		
//		List<String> poster_list = service.imagePS(posterdto);
//		
//		// still_list 생성
//		ImageDTO stilldto = new ImageDTO();
//		stilldto.setMovie_id(movie_id);
//		stilldto.setImg_type('s');
//		List<String> still_list = service.imagePS(stilldto);
//		
//		// crew_list 생성
//		List<CrewDTO> crew_list = service.crewProfile(movie_id);
//		
//		// review_list 생성
//		List<ReviewDTO> review_list = service.reviewUserList(movie_id);
//		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("movie_id", movie_id);
//		mv.addObject("movie_dto", movie_dto);
//		mv.addObject("poster_list", poster_list);
//		mv.addObject("still_list", still_list);
//		mv.addObject("crew_list", crew_list);
//		mv.addObject("review_list", review_list);
//		mv.setViewName("detailed/detailed");
//		return mv;
//	}
	
	@RequestMapping("/detailed")
	public ModelAndView detailedInfo(@RequestParam(value="movie_id", required=false, defaultValue="20226411") String movie_id) {
		// MovieDTO 생성
		MovieDTO movie_dto = service.oneMovie(movie_id);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("movie_id", movie_id);
		mv.addObject("movie_dto", movie_dto);
		mv.setViewName("detailed/detailed_info");
		return mv;
	}
	
	@RequestMapping("/detailedperson")
	public ModelAndView detailedPerson(@RequestParam(value="movie_id", required=false, defaultValue="20226411") String movie_id) {
		// MovieDTO 생성
		MovieDTO movie_dto = service.oneMovie(movie_id);
		
		// crew_list 생성
		List<CrewDTO> crew_list = service.crewProfile(movie_id);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("movie_id", movie_id);
		mv.addObject("movie_dto", movie_dto);
		mv.addObject("crew_list", crew_list);
		mv.setViewName("detailed/detailed_person");
		return mv;
	}
	
	@RequestMapping("/detailedphoto")
	public ModelAndView detailedPhoto(@RequestParam(value="movie_id", required=false, defaultValue="20226411") String movie_id) {
		// MovieDTO 생성
		MovieDTO movie_dto = service.oneMovie(movie_id);
		
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
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("movie_id", movie_id);
		mv.addObject("movie_dto", movie_dto);
		mv.addObject("poster_list", poster_list);
		mv.addObject("still_list", still_list);
		mv.setViewName("detailed/detailed_photo");
		return mv;
	}
	
	@RequestMapping("/detailedgrade")
	public ModelAndView detailedGrade(@RequestParam(value="movie_id", required=false, defaultValue="20226411") String movie_id,
			@RequestParam(value="sort_type", required=false, defaultValue="date") String sort_type,
			@RequestParam(value="page", required=false, defaultValue="1") int page) {
		// MovieDTO 생성
		MovieDTO movie_dto = service.oneMovie(movie_id);
		
		// ReviewPaginDTO 생성
		ReviewPagingDTO paging_dto = new ReviewPagingDTO();
		
		int cnt = service.reviewCount(movie_id);
		int divNum = 5;
		
		paging_dto.setMovie_id(movie_id);
		paging_dto.setStart((page - 1) * divNum);
		paging_dto.setEnd(divNum);
		
		if (sort_type.equals("star")) {
			paging_dto.setSort_type("rating_star");
		}
		else {
			paging_dto.setSort_type("writing_time");
		}
		
		// review_list 생성
		List<ReviewDTO> review_list = service.reviewUserList(paging_dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("movie_id", movie_id);
		mv.addObject("movie_dto", movie_dto);
		mv.addObject("review_list", review_list);
		mv.addObject("sort_type", sort_type);
		mv.addObject("page", page);
		mv.addObject("cnt", cnt);
		mv.addObject("divNum", divNum);
		mv.setViewName("detailed/detailed_grade");
		return mv;
	}
}
