package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.MenuVO;

public class MenuDAOImpl implements MenuDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<MenuVO> selectMainMenu() throws SQLException {
		List<MenuVO> menuList = session.selectList("Menu-Mapper.selectMainMenu");
		return menuList;
	}

	@Override
	public List<MenuVO> selectSubMenu( String mCode) throws SQLException {
		List<MenuVO> menuList = session.selectList("Menu-Mapper.selectSubMenu",mCode);
		return menuList;
	}

	@Override
	public MenuVO selectMenuByMcode( String mCode) throws SQLException {
		MenuVO menu = session.selectOne("Menu-Mapper.selectMenuByMcode",mCode);
		return menu;
	}
	
	@Override
	public MenuVO selectMenuByMname( String mName) throws SQLException {
		MenuVO menu = session.selectOne("Menu-Mapper.selectMenuByMname",mName);
		return menu;
	}

	@Override
	public List<MenuVO> selectLevelTwoMenu() throws SQLException {
		List<MenuVO> levelTwoMenuList = session.selectList("Menu-Mapper.selectLevelTwoMenu");
		return levelTwoMenuList;
	}

	@Override
	public List<MenuVO> selectLevelThreeMenu() throws SQLException {
		List<MenuVO> levelThreeMenuList = session.selectList("Menu-Mapper.selectLevelThreeMenu");
		return levelThreeMenuList;
	}

	@Override
	public List<MenuVO> selectLevelTwoMenuByMcode(String mCode) throws SQLException {
		List<MenuVO> levelTwoMenuListByMcode = session.selectList("Menu-Mapper.selectLevelTwoMenuByMcode",mCode);
		return levelTwoMenuListByMcode;
	}

	@Override
	public List<MenuVO> selectLevelThreeMenuByMcode(String mCode) throws SQLException {
		List<MenuVO> levelThreeMenuListByMcode = session.selectList("Menu-Mapper.selectLevelThreeMenuByMcode",mCode);
		return levelThreeMenuListByMcode;
	}

	@Override
	public List<MenuVO> selectSubSubMenuByMcode(String mCode) throws SQLException {
		List<MenuVO> subSubMenu = session.selectList("Menu-Mapper.selectSubSubMenuByMcode",mCode);
		
		return subSubMenu;
	}


}
