package kr.or.gw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.gw.command.PageMaker;
import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dao.JobAnsDAO;
import kr.or.gw.dto.JobAnswerVO;

public class JobAnsServiceImpl implements JobAnsService {

	private JobAnsDAO jobAnsDAO;
	public void setJobAnsDAO(JobAnsDAO jobAnsDAO) {
		this.jobAnsDAO = jobAnsDAO;
	}

	@Override
	public Map<String, Object> getAnsList(String job_no, SearchCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<JobAnswerVO> ansList = jobAnsDAO.selectAnsListPage(job_no, cri);

		int count = jobAnsDAO.countAns(job_no);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);

		dataMap.put("ansList", ansList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void registAns(JobAnswerVO ans) throws SQLException {
		String ano = jobAnsDAO.selectAnsSeqNextValue();
		ans.setAnswer_no(ano);

		jobAnsDAO.insertAns(ans);

	}

	@Override
	public void modifyAns(JobAnswerVO ans) throws SQLException {

		jobAnsDAO.updateAns(ans);

	}

	@Override
	public void removeAns(String ano) throws SQLException {

		jobAnsDAO.deleteAns(ano);
	}

	@Override
	public int getAnsListCount(String job_no) throws SQLException {
		int count = jobAnsDAO.countAns(job_no);
		return count;
	}

}
