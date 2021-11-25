package kr.or.gw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commute")
public class CommuteController {
	
	@RequestMapping("/main") 
	public String main() {
		String url = "/common/main_commute";
		return url;
	}
	
/*	@RequestMapping("/gowork") 
	public String gowork() {
		String url = "/common/gowork";
		return url;
	}
	@RequestMapping("/gohome") 
	public String gohome() {
		String url = "/common/gohome";
		return url;
	}
	*/
}
  