package kr.or.gw.dto;


/**
 * @author 장하늘
 * 메뉴VO
 */

public class MenuVO {
	
	private String menu_code; //메뉴코드
	private String menu_nm; //메뉴이름
	private String url; //URL
	private String upper_menu_code; //상위메뉴코드
	private int menu_level; //메뉴레벨
	private int is_nav; //네비게이션바표시여부
	private int ssmenu_ex; //최하위메뉴 포함여부
	
	
	
	public int getSsmenu_ex() {
		return ssmenu_ex;
	}
	public void setSsmenu_ex(int ssmenu_ex) {
		this.ssmenu_ex = ssmenu_ex;
	}
	public String getMenu_code() {
		return menu_code;
	}
	public void setMenu_code(String menu_code) {
		this.menu_code = menu_code;
	}
	public String getMenu_nm() {
		return menu_nm;
	}
	public void setMenu_nm(String menu_nm) {
		this.menu_nm = menu_nm;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUpper_menu_code() {
		return upper_menu_code;
	}
	public void setUpper_menu_code(String upper_menu_code) {
		this.upper_menu_code = upper_menu_code;
	}
	public int getMenu_level() {
		return menu_level;
	}
	public void setMenu_level(int menu_level) {
		this.menu_level = menu_level;
	}
	public int getIs_nav() {
		return is_nav;
	}
	public void setIs_nav(int is_nav) {
		this.is_nav = is_nav;
	}

	
}
