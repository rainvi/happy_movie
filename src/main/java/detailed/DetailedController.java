package detailed;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DetailedController {
	@Autowired
	DetailedService service;
	
	@RequestMapping("/detailed")
	public ModelAndView detailed(@RequestParam(value="movie_id", required=false, defaultValue="20227890") String movie_id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("movie_id", movie_id);
		mv.setViewName("detailed/detailed");
		return mv;
	}
}
