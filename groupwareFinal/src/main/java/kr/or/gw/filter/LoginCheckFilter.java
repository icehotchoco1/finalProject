package kr.or.gw.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.gw.dto.OrgnztEmpMngtVO;

public class LoginCheckFilter implements Filter {
	
	private List<String> exURLs = new ArrayList<String>();
	
	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpServletResponse httpResp = (HttpServletResponse) response;
		
		//제외할 url 확인
		String reqUrl = httpReq.getRequestURI().substring(httpReq.getContextPath().length());
		//여기에 있는 키워드가 사용자에게 요청한 URL에 있는 지 확인해야함
		
		if(excludeCheck(reqUrl)) {
			chain.doFilter(request, response);
			return;
		}
		
		// login check
		HttpSession session = httpReq.getSession();
		OrgnztEmpMngtVO loginUser = (OrgnztEmpMngtVO) session.getAttribute("loginUser");
		
		//login 확인
		if(loginUser==null) { //비로그인 상태
			httpResp.setContentType("text/html;charset=utf-8");
			PrintWriter out = httpResp.getWriter();
			out.println("<script>");
			out.println("alert('로그인은 필수입니다.');");
			out.println("if(window.opener){window.close();window.opener.parent.location.href='"
					+httpReq.getContextPath()
					+"/';}else{");
			out.println("window.parent.location.href='"+httpReq.getContextPath()+"/';");
			out.println("}");
			out.println("</script>");
			out.close();
		}else { //로그인
			chain.doFilter(request, response); //통과
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
		String excludeURLNames = fConfig.getInitParameter("exclude");
		
		StringTokenizer st = new StringTokenizer(excludeURLNames, ",");
		while (st.hasMoreTokens()) {
			exURLs.add(st.nextToken().trim());
		}
	}
	
	//check를 제외시킴
	private boolean excludeCheck(String url) { // url : 사용자가 요청한 url 
		boolean result = false;
		
		result = result | url.length() <= 1;
		
		for (String exURL : exURLs) {
			result = result | url.contains(exURL);
		}
		return result;
	}
	
	
	
}
