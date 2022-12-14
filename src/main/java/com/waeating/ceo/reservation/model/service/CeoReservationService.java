package com.waeating.ceo.reservation.model.service;

import static com.waeating.common.mybatis.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waeating.ceo.reservation.model.dao.CeoWaitingRecordMapper;
import com.waeating.common.paging.SelectCriteria;
import com.waeating.waitingRecord.model.dto.WaitingRecordDTO;
import com.waeating.waitingRecord.model.dto.WaitingRefuseDTO;

public class CeoReservationService {
	
	private CeoWaitingRecordMapper ceoWaitingRecordMapper;

	public int selectTotalCount(Map<String, Object> searchMap) {
		
		SqlSession sqlSession = getSqlSession();
		ceoWaitingRecordMapper = sqlSession.getMapper(CeoWaitingRecordMapper.class);
		
		int totalCount = ceoWaitingRecordMapper.selectTotalCount(searchMap);
		
		sqlSession.close();
		
		return totalCount;
		
	}

	public List<WaitingRecordDTO> selectAllWaitingList(Map<String, Object> search) {

		SqlSession sqlSession = getSqlSession();
		ceoWaitingRecordMapper = sqlSession.getMapper(CeoWaitingRecordMapper.class);
		
		List<WaitingRecordDTO> waitingRecordList = ceoWaitingRecordMapper.selectAllWaitingList(search);
		
		sqlSession.close();
		
		return waitingRecordList;
	}

	public int updateWaitingRecord(WaitingRecordDTO waitingRecord) {
		
		SqlSession sqlSession = getSqlSession();
		
		ceoWaitingRecordMapper = sqlSession.getMapper(CeoWaitingRecordMapper.class);
		int result = ceoWaitingRecordMapper.updateWaitingRecord(waitingRecord);
		
		if(result > 0) {
			
			sqlSession.commit();
		} else {
			
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}

	public int insertWaitingRefuse(WaitingRefuseDTO waitingRefuse) {
		
		SqlSession sqlSession = getSqlSession();
		
		ceoWaitingRecordMapper = sqlSession.getMapper(CeoWaitingRecordMapper.class);
		int result = ceoWaitingRecordMapper.insertWaitingRefuse(waitingRefuse);
		
		if(result > 0) {
			
			sqlSession.commit();
		} else {
			
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}

	public List<WaitingRecordDTO> selectAllWaitingListDate(Map<String, Object> search) {
		
		SqlSession sqlSession = getSqlSession();
		ceoWaitingRecordMapper = sqlSession.getMapper(CeoWaitingRecordMapper.class);
		
		List<WaitingRecordDTO> waitingRecordList = ceoWaitingRecordMapper.selectAllWaitingListDate(search);
		
		sqlSession.close();
		
		return waitingRecordList;
	}

	public int selectTotalCountDate(Map<String, Object> searchMap) {
		
		SqlSession sqlSession = getSqlSession();
		ceoWaitingRecordMapper = sqlSession.getMapper(CeoWaitingRecordMapper.class);
		
		int totalCount = ceoWaitingRecordMapper.selectTotalCountDate(searchMap);
		
		sqlSession.close();
		
		return totalCount;
	}

}
