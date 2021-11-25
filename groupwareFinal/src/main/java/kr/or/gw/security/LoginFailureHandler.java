package kr.or.gw.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{

   @Override
   public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
         AuthenticationException exception) throws IOException, ServletException {
	   String msg = "";
	      if (exception instanceof AuthenticationServiceException || exception instanceof BadCredentialsException ) {
	      msg = exception.getMessage();
	   } else {
	      msg = "시스템 장애로인해 서비스가 불가합니다.";
	   }
	      
	      
	      response.setContentType("text/html;charset=utf-8");
	      PrintWriter out = response.getWriter();
	      
	      out.println("<script>");
	      out.println("alert('" + msg + "');");
	      out.println("history.go(-1)");
	      out.println("</script>");
	   }
}
//String username = request.getParameter(loginidname);
//String password = request.getParameter(loginpwdname);
//String errormsg = null;
//
//if(exception instanceof BadCredentialsException) {
//    errormsg = MessageUtils.getMessage("error.BadCredentials");
//} else if(exception instanceof InternalAuthenticationServiceException) {
//    errormsg = MessageUtils.getMessage("error.BadCredentials");
//} else if(exception instanceof DisabledException) {
//    errormsg = MessageUtils.getMessage("error.Disabled");
//} else if(exception instanceof CredentialsExpiredException) {
//    errormsg = MessageUtils.getMessage("error.CredentialsExpired");
//}
//
//request.setAttribute(loginidname, username);
//request.setAttribute(loginpwdname, password);
//request.setAttribute(errormsgname, errormsg);
//
//request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
//}


//if(exception instanceof BadCredentialsException) {
//    loginFailureCount(username);
//    errormsg = MessageUtils.getMessage("error.BadCredentials");
//}
//}
//
//protected void loginFailureCount(String username) {
//userSer.countFailure(username);
//int cnt = userSer.checkFailureCount(username);
//if(cnt==5) {
//    userSer.disabledUsername(username);
//}


