package rank;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.ApiDAO;
import dto.ApiDTO;

@Controller
public class RankController {
	
	@Autowired
	ApiService service;
	
	@RequestMapping("/rank")
	public String rank() {
		return "rank/rank";
	}
	@RequestMapping("/grade")
	public String grade() {
		return "rank/grade";
	}
	
	@RequestMapping("genrelist")
	public ModelAndView genrelist(@RequestParam(value="page", required=false, defaultValue="1") int page,String genre) {
		
		//전체 게시물 갯수 (9) 가져와서 몇페이지까지 (1페이지당 4개 게시물) -  1 2 3
		int totalGenre = 0;
				
		
		//page번호 해당 게시물 4개 리스트 조회 
		int limitcount = 10;
		int limitindex = (page-1)*limitcount;
		int limit [] = new int[2];
		limit[0] = limitindex;
		limit[1] = limitcount;
		
		/*  1.  List<BoardDTO> -- 서비스 메소드 (limitindex,  limitcount);
		 *  2.  board-mapping.xml
		 * select * from board order by writingtime desc limit 배열[0],배열[1]
		 *  3. 1번 결과를 모델로 추가 저장
		 *  4. 뷰 3번 모델 저장 테이블 태그 출력
		 * */
		List<ApiDTO> list = null;
		switch (genre) {
		case "action":
			totalGenre = service.getTotalGenre("액션");
			list = service.actionList(limit);
			break;
		case "comedy":
			totalGenre = service.getTotalGenre("코미디");
			list = service.comedyList(limit);
			break;
		case "thriller":
			totalGenre = service.getTotalGenre("스릴러");
			list = service.thrillerList(limit);
			break;
		case "romance":
			totalGenre = service.getTotalGenre("로맨스");
			list = service.romanceList(limit);
			break;
		case "fantasy":
			totalGenre = service.getTotalGenre("판타지");
			list = service.fantasyList(limit);
			break;
		}
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("page",page);
		mv.addObject("genre",genre);
		mv.addObject("totalGenre", totalGenre);
		mv.addObject("genreList", list);
		mv.setViewName("rank/genre");
		return mv;
	}
	
}
