package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.gw.command.SearchCriteria;
import kr.or.gw.dto.JobAnswerVO;

public class JobAnsDAOImpl implements JobAnsDAO {
	

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertAns(JobAnswerVO ans) throws SQLException {
		session.update("JobAns-Mapper.insertAns", ans);

	}

	@Override
	public void updateAns(JobAnswerVO ans) throws SQLException {
		session.update("JobAns-Mapper.updateAns", ans);
	}

	@Override
	public void deleteAns(String answer_no) throws SQLException {
		session.update("JobAns-Mapper.deleteAns", answer_no);
	}

	@Override
	public void deleteAllAns(String jno) throws SQLException {
		session.update("JobAns-Mapper.deleteAllAns", jno);
	}

	@Override
	public List<JobAnswerVO> selectAnsListPage(String job_no, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<JobAnswerVO> ansList = session.selectList("JobAns-Mapper.selectAnsList", job_no, rowBounds);
		return ansList;
	}

	@Override
	public int countAns(String job_no) throws SQLException {
		int count = session.selectOne("JobAns-Mapper.countAns", job_no);
		return count;
	}

	@Override
	public String selectAnsSeqNextValue() throws SQLException {
		String answer_no = "jans"+session.selectOne("JobAns-Mapper.selectAnsSeqNextValue");
		return answer_no;
	}


}
