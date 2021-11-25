package kr.or.gw.service;

import java.sql.SQLException;
import java.util.Map;

public interface IcommuteService {

   Map<String, Object> icommuteList(Map<String,String> paramMap) throws SQLException;
   Map<String, Object> getEmpInfo(int empno) throws SQLException;

}