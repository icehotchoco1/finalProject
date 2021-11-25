package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.MenuVO;

public interface MenuService {
	
	

	List<MenuVO> getMainMenuList()throws SQLException;
	
	List<MenuVO> getLevelTwoMenuList()throws SQLException;
	
	List<MenuVO> getLevelTwoMenuListByMcode(String mCode)throws SQLException;
	List<MenuVO> getLevelThreeMenuListByMcode(String mCode)throws SQLException;
	
	List<MenuVO> getLevelThreeMenuList()throws SQLException;
	List<MenuVO> getSubSubMenuList(String mCode)throws SQLException;
	
	List<MenuVO> getSubMenuList(String mCode)throws SQLException;
	
	MenuVO getMenuByMcode(String mCode)throws SQLException;
	
	MenuVO getMenuByMname(String mName)throws SQLException;

	
}
