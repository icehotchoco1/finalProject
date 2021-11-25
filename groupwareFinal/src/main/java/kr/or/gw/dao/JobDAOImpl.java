package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.AllWorkCriteria;
import kr.or.gw.dto.JobMngtVO;

public class JobDAOImpl implements JobDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	//공통
	@Override
	public JobMngtVO selectJobByJno(String job_no) throws SQLException {
		JobMngtVO job = session.selectOne("JobMngt-Mapper.selectJobByJno", job_no);
		return job;
	}
	
	@Override
	public void deleteJob(String job_no) throws SQLException {
		session.update("JobMngt-Mapper.deleteJob", job_no);
	}

	@Override
	public String selectJobSeqNextValue() throws SQLException {
		String seqNum = "work"+session.selectOne("JobMngt-Mapper.selectJobSeqNextValue");
		return seqNum;
	}

	
	

	//전체
	@Override
	public List<JobMngtVO> selectSearchJobList(AllWorkCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<JobMngtVO> jobList =
				session.selectList("JobMngt-Mapper.selectSearchJobList", cri, rowBounds);
		
		return jobList;
	}

	@Override
	public int selectSearchJobListCount(AllWorkCriteria cri) throws SQLException {
		int count = session.selectOne("JobMngt-Mapper.selectSearchJobListCount", cri);
		return count;
	}

	@Override
	public void insertJob(JobMngtVO job) throws SQLException {
		session.update("JobMngt-Mapper.insertJob", job);
	}

	@Override
	public void updateJob(JobMngtVO job) throws SQLException {
		session.update("JobMngt-Mapper.updateJob", job);
	}



	//대기
	@Override
	public List<JobMngtVO> selectSearchJobWaitList(AllWorkCriteria cri, int rcver_empno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String,Object> param = new HashMap<String,Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("imcode", cri.getImcode());
		param.put("rcver_empno",rcver_empno);
		
		List<JobMngtVO> jobWaitList =
				session.selectList("JobMngt-Mapper.selectSearchJobWaitList", param, rowBounds);
		
		return jobWaitList;
	}
	
	@Override
	public int selectSearchJobWaitListCount(AllWorkCriteria cri, int rcver_empno) throws SQLException {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("imcode", cri.getImcode());
		param.put("rcver_empno",rcver_empno);
		
		int count = session.selectOne("JobMngt-Mapper.selectSearchJobWaitListCount", param);
		return count;
	}
	
	
	//받은 업무
	@Override
	public List<JobMngtVO> selectSearchJobRecList(AllWorkCriteria cri, int rcver_empno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		Map<String,Object> param = new HashMap<String,Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("imcode", cri.getImcode());
		param.put("rcver_empno",rcver_empno);
		
		List<JobMngtVO> jobList =
				session.selectList("JobMngt-Mapper.selectSearchJobRecList", param, rowBounds);
		
		return jobList;
	}
	
	@Override
	public int selectSearchJobRecListCount(AllWorkCriteria cri, int rcver_empno) throws SQLException {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("imcode", cri.getImcode());
		param.put("rcver_empno",rcver_empno);
		
		int count = session.selectOne("JobMngt-Mapper.selectSearchJobRecListCount", param);
		return count;
	}
	
	
	//지시
	@Override
	public List<JobMngtVO> selectSearchJobSendList(AllWorkCriteria cri, int drctr_empno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		Map<String,Object> param = new HashMap<String,Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("imcode", cri.getImcode());
		param.put("drctr_empno",drctr_empno);
		
		List<JobMngtVO> jobList =
				session.selectList("JobMngt-Mapper.selectSearchJobSendList", param, rowBounds);
		
		return jobList;
	}
	
	@Override
	public int selectSearchJobSendListCount(AllWorkCriteria cri, int drctr_empno) throws SQLException {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("imcode", cri.getImcode());
		param.put("drctr_empno",drctr_empno);
		
		int count = session.selectOne("JobMngt-Mapper.selectSearchJobSendListCount", param);
		return count;
	}
	
	//완료
	@Override
	public List<JobMngtVO> selectSearchJobCompletionList(AllWorkCriteria cri, int rcver_empno, int drctr_empno) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String,Object> param = new HashMap<String,Object>();
		
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("imcode", cri.getImcode());
		param.put("rcver_empno",rcver_empno);
		param.put("drctr_empno",drctr_empno);
		
		List<JobMngtVO> jobCompletionList =
				session.selectList("JobMngt-Mapper.selectSearchJobCompletionList", param, rowBounds);
		
		return jobCompletionList;
	}

	@Override
	public int selectSearchJobCompletionListCount(AllWorkCriteria cri, int rcver_empno, int drctr_empno) throws SQLException {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("keyword", cri.getKeyword());
		param.put("searchType", cri.getSearchType());
		param.put("perPageNum", cri.getPerPageNum());
		param.put("imcode", cri.getImcode());
		param.put("rcver_empno",rcver_empno);
		param.put("drctr_empno",drctr_empno);
		
		
		int count = session.selectOne("JobMngt-Mapper.selectSearchJobCompletionListCount", param);
		return count;
	}

}
