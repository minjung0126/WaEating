package com.waeating.notice.model.service;

import static com.waeating.common.mybatis.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waeating.common.paging.SelectCriteria;
import com.waeating.notice.model.dao.NoticeMapper;
import com.waeating.notice.model.dto.NoticeDTO;

public class NoticeService {
	
	private NoticeMapper noticeMapper;

	public NoticeDTO selectNoticeDetail(int no) { 
		
		SqlSession sqlSession = getSqlSession();
		noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		NoticeDTO noticeDetail = null;
		noticeDetail = noticeMapper.selectNoticeDeatail(no);
			
		sqlSession.close();
		return noticeDetail;
		
		
	}

	public List<NoticeDTO> selectAllNoticeList(SelectCriteria selectCriteria) {
		
		SqlSession sqlSession = getSqlSession();
		noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		List<NoticeDTO> noticeList = noticeMapper.selectAllNoticeList(selectCriteria);
		
		sqlSession.close();
		
		return noticeList;
	}

	public int selectTotalCount(Map<String, String> searchMap) {
		
		SqlSession sqlSession = getSqlSession();
		noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		
		int totalCount = noticeMapper.selectTotalCount(searchMap);
		
		sqlSession.close();
		
		return totalCount;
	}








}
