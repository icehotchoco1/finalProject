package kr.or.gw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.gw.dto.DclzVacCodeVO;

public class DclzVacCodeDAOImpl implements DclzVacCodeDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	@Override
	public List<DclzVacCodeVO> selectVacCodeList() throws SQLException {
		List<DclzVacCodeVO> vacCodeList = session.selectList("DclzVacCode-Mapper.selectVacCodeList");
		return vacCodeList;
	}
	@Override
	public DclzVacCodeVO selectVacCode(String vcatn_no) throws SQLException {
		DclzVacCodeVO vacCode = session.selectOne("DclzVacCode-Mapper.selectVacCode",vcatn_no);
		return vacCode;
	}
	@Override
	public void insertVacCode(DclzVacCodeVO vacCode) throws SQLException {
		session.update("DclzVacCode-Mapper.insertVacCode",vacCode);
	}
	@Override
	public String selectVacCodeSeqNextValue() throws SQLException {
		String seqNum = "vcde"+session.selectOne("DclzVacCode-Mapper.selectVacSeqNextValue");
		return seqNum;
	}
	@Override
	public String selectCodeNmByCode(String vcatn_code) throws SQLException {
		String codeNm = session.selectOne("DclzVacCode-Mapper.selectCodeNmByCode",vcatn_code);
		return codeNm;
	}
}
