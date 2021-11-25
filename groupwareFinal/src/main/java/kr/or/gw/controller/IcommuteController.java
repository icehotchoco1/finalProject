package kr.or.gw.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.or.gw.dto.OrgnztEmpMngtVO;
import kr.or.gw.service.IcommuteService;


@Controller
@RequestMapping("/attendance")
public class IcommuteController {
   
   @Autowired
   private IcommuteService icommuteService;

   @RequestMapping(value="/department/icommute",method = RequestMethod.GET)
   public ModelAndView list(ModelAndView mnv, String startDate) throws SQLException {
      
      String url = "attendance/department/icommute";
      
      HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
       HttpSession session = request.getSession();
       OrgnztEmpMngtVO emp = (OrgnztEmpMngtVO) session.getAttribute("loginUser");

       if(startDate == null || startDate.equals("")) {
          startDate= "sysdate";
    
       } 
       
       Map<String, String> paramMap = new HashMap<String, String>();
       paramMap.put("startDate", startDate);
       paramMap.put("empno", String.valueOf(emp.getEmpno()));
       Map<String,Object> dataMap = icommuteService.icommuteList(paramMap);
       
       Map<String,Object> empInfo = icommuteService.getEmpInfo(emp.getEmpno());
       
       
       mnv.addObject("dataMap",dataMap);
       mnv.addObject("empInfo",empInfo);
      
      List<OrgnztEmpMngtVO> icomList = (List<OrgnztEmpMngtVO>)dataMap.get("icomlist");
      List<OrgnztEmpMngtVO> empList = (List<OrgnztEmpMngtVO>)empInfo.get("empList");
      
      System.out.println(icomList.size()+"sava");
      System.out.println(empList.size()+"sava");
      


      
//      mnv.addObject("startDate",startDate);
//      mnv.addObject("endDate",endDate);
//      mnv.addObject("paramMap",paramMap);
      mnv.setViewName(url);
      
      
      
      return mnv;
   }

   

}