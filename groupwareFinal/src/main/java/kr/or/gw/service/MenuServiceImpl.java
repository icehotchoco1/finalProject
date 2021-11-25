package kr.or.gw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.gw.dao.MenuDAO;
import kr.or.gw.dto.MenuVO;

public class MenuServiceImpl implements MenuService {

	private MenuDAO menuDAO;// = new MenuDAOImpl();

	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	@Override
	public List<MenuVO> getMainMenuList() throws SQLException {

		List<MenuVO> menuList = null;

		menuList = menuDAO.selectMainMenu();

		return menuList;
	}

	@Override
	public List<MenuVO> getSubMenuList(String mCode) throws SQLException {
		List<MenuVO> menuList = null;

		menuList = menuDAO.selectSubMenu(mCode);

		return menuList;
	}

	@Override
	public MenuVO getMenuByMcode(String mCode) throws SQLException {
		MenuVO menu = null;

		menu = menuDAO.selectMenuByMcode(mCode);

		return menu;
	}

	@Override
	public MenuVO getMenuByMname(String mName) throws SQLException {
		MenuVO menu = null;

		menu = menuDAO.selectMenuByMname(mName);

		return menu;
	}

	@Override
	public List<MenuVO> getLevelTwoMenuList() throws SQLException {
		List<MenuVO> LevelTwoMenuList = null;

		LevelTwoMenuList = menuDAO.selectLevelTwoMenu();

		return LevelTwoMenuList;
	}

	@Override
	public List<MenuVO> getLevelThreeMenuList() throws SQLException {
		List<MenuVO> LevelThreeMenuList = null;

		LevelThreeMenuList = menuDAO.selectLevelThreeMenu();

		return LevelThreeMenuList;
	}

	@Override
	public List<MenuVO> getLevelTwoMenuListByMcode(String mCode) throws SQLException {
		List<MenuVO> levelTwoMenuListByMcode = null;
		levelTwoMenuListByMcode =  menuDAO.selectLevelTwoMenuByMcode(mCode);
		return levelTwoMenuListByMcode;
	}

	@Override
	public List<MenuVO> getLevelThreeMenuListByMcode(String mCode) throws SQLException {
		List<MenuVO> levelThreeMenuListByMcode = null;
		levelThreeMenuListByMcode = menuDAO.selectLevelThreeMenuByMcode(mCode);
		return levelThreeMenuListByMcode;
	}

	@Override
	public List<MenuVO> getSubSubMenuList(String mCode) throws SQLException {
		List<MenuVO> subSubMenu = null;
		subSubMenu  = menuDAO.selectSubSubMenuByMcode(mCode);
		return subSubMenu ;
	}

}
