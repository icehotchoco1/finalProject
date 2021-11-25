package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dto.MenuVO;

public interface MenuDAO {

	// 메인메뉴
	List<MenuVO> selectMainMenu() throws SQLException;

	// 서브메뉴
	List<MenuVO> selectSubMenu(String mCode) throws SQLException;
	
	//레벨2 서브메뉴
	List<MenuVO> selectLevelTwoMenu() throws SQLException;
	List<MenuVO> selectLevelTwoMenuByMcode(String mCode) throws SQLException;
	//레벨3 서브메뉴
	List<MenuVO> selectLevelThreeMenu() throws SQLException;
	List<MenuVO> selectLevelThreeMenuByMcode(String mCode) throws SQLException;
	List<MenuVO> selectSubSubMenuByMcode(String mCode) throws SQLException;

	// 메뉴정보
	MenuVO selectMenuByMcode(String mCode) throws SQLException;
	MenuVO selectMenuByMname(String mName) throws SQLException;
}







