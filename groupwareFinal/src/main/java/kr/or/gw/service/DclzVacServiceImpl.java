package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.VacCriteria;
import kr.or.gw.command.VacPageMaker;
import kr.or.gw.dao.CodeDAO;
import kr.or.gw.dao.DclzVacCodeDAO;
import kr.or.gw.dao.DclzVacDAO;
import kr.or.gw.dao.EscMngtDAO;
import kr.or.gw.dto.CodeVO;
import kr.or.gw.dto.DclzVacCodeVO;
import kr.or.gw.dto.DclzVacVO;
import kr.or.gw.dto.EccstSanctnMngtVO;

public class DclzVacServiceImpl implements DclzVacService{
	
	private DclzVacDAO dclzVacDAO;
	public void setDclzVacDAO(DclzVacDAO dclzVacDAO) {
		this.dclzVacDAO = dclzVacDAO;
	}
	private DclzVacCodeDAO dclzVacCodeDAO;
	public void setDclzVacCodeDAO(DclzVacCodeDAO dclzVacCodeDAO) {
		this.dclzVacCodeDAO = dclzVacCodeDAO;
	}
	private CodeDAO codeDAO;
	public void setCodeDAO(CodeDAO codeDAO) {
		this.codeDAO = codeDAO;
	}
	private EscMngtDAO escMngtDAO;
	public void setEscMngtDAO(EscMngtDAO escMngtDAO) {
		this.escMngtDAO = escMngtDAO;
	}
	
	@Override
	public DclzVacVO getVac(String vcatn_no) throws SQLException {
		DclzVacVO vac = dclzVacDAO.selectVac(vcatn_no);
		
		return vac;
	}

	@Override
	public Map<String, Object> getVacList(VacCriteria cri, int empno) throws SQLException {
		List<DclzVacVO> vacList = dclzVacDAO.selectVacList(cri, empno);
		int totalCount = dclzVacDAO.selectVacListCount(cri, empno);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		String code_cl="휴가";
		List<CodeVO> codeList = codeDAO.selectCodeByCodeCl(code_cl);
		dataMap.put("codeList", codeList);
		
		
		for (DclzVacVO vacVO : vacList) {
			String vcatn_code = vacVO.getVcatn_code();
			String vacCode = dclzVacCodeDAO.selectCodeNmByCode(vcatn_code);
			vacVO.setVcatn_code(vacCode);
			
			if(vacVO.getSanctn_no() != null) {
				String sanctn_no = vacVO.getSanctn_no();
				EccstSanctnMngtVO sanctnVO = escMngtDAO.selectEscMngtVacByNo(sanctn_no);
				vacVO.setSanctnVO(sanctnVO);
			}
		}
		
		VacPageMaker pm = new VacPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(totalCount);
		
		dataMap.put("vacList", vacList);
		dataMap.put("pageMaker",pm);
		
		return dataMap;
	}

	@Override
	public void modify(DclzVacVO vac) throws SQLException {
		dclzVacDAO.updateVac(vac);
	}

	@Override
	public Map<String, Object> selectDeptVacList(VacCriteria cri, int empno) throws SQLException {
		List<DclzVacVO> deptVacList = dclzVacDAO.selectDeptVacList(cri, empno);
		int totalCount = dclzVacDAO.selectDeptVacListCount(cri, empno);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		for (DclzVacVO vacVO : deptVacList) {
			if(vacVO.getSanctn_no() != null) {
				String sanctn_no = vacVO.getSanctn_no();
				EccstSanctnMngtVO sanctnVO = escMngtDAO.selectEscMngtVacByNo(sanctn_no);
				vacVO.setSanctnVO(sanctnVO);
			}
			String vcatn_no = vacVO.getVcatn_no();
			DclzVacCodeVO vcatn_code = dclzVacCodeDAO.selectVacCode(vcatn_no);
			vacVO.setVacCodeVO(vcatn_code);
		}
		
		VacPageMaker pageMaker = new VacPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("deptVacList", deptVacList);
		dataMap.put("pageMaker",pageMaker);
		
		return dataMap;
	}

	@Override
	public Float selectsumUseVac(int empno) throws SQLException {
		Float f = dclzVacDAO.selectsumUseVac(empno);
		return f;
	}

	@Override
	public void insertVac(DclzVacVO vac) throws SQLException {
		dclzVacDAO.insertVac(vac);
	}

	@Override
	public String selectVacSeqNextValue() throws SQLException {
		String vacno = dclzVacDAO.selectVacSeqNextValue();
		return vacno;
	}
}
