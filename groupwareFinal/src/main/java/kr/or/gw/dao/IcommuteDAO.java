package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.gw.dto.DclzComVO;
import kr.or.gw.dto.OrgnztEmpMngtVO;


public interface IcommuteDAO {
   
   List<OrgnztEmpMngtVO> selectIcommuteList(Map<String,String> paramMap) throws SQLException;
   List<OrgnztEmpMngtVO> selectEmpInfo(int empno) throws SQLException;
}