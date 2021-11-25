package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.AllWorkCriteria;
import kr.or.gw.dto.JobRcvVO;

public class JobRcvDAOImpl implements JobRcvDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<JobRcvVO> selectSearchJobRcvList(AllWorkCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<JobRcvVO> jobrcvList =
				session.selectList("JobRcv-Mapper.selectJobRcvList", cri, rowBounds);
		
		return jobrcvList;
	}
	
	@Override
	public int selectSearchJobRcvListCount(AllWorkCriteria cri) throws SQLException {
		int count = session.selectOne("JobRcv-Mapper.selectJobRcvListCount", cri);
		return count;
	}
	
	@Override
	public JobRcvVO selectJobRcvByJobIn(String job_index) throws SQLException {
		
		JobRcvVO job = session.selectOne("JobRcv-Mapper.selectJobByJobIn", job_index);
		
		return job;
	}
	@Override
	public List<JobRcvVO> selectJobRcvByJobNo(String job_no) throws SQLException {
		
		List<JobRcvVO> jobRcvList = session.selectList("JobRcv-Mapper.selectJobByJobNo", job_no);
		
		return jobRcvList;
	}

	@Override
	public void insertJobRcv(JobRcvVO job) throws SQLException {
		session.update("JobRcv-Mapper.insertJobRcv", job);
	}

	@Override
	public void updateJobRcv(JobRcvVO job) throws SQLException {
		session.update("JobRcv-Mapper.updateJobRcv", job);
	}

	@Override
	public void deleteJobRcv(String job_no) throws SQLException {
		session.update("JobRcv-Mapper.deleteJobRcv", job_no);
	}

	@Override
	public String selectJobRcvSequenceNextValue() throws SQLException {
		
		String seqNum =
				"jrcv"+session.selectOne("JobRcv-Mapper.selectJobRcvSequenceNextValue");
		
		return seqNum;
	}

}
