package com.waeating.ceo.restInfo.model.service;

import static com.waeating.common.mybatis.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waeating.ceo.restInfo.model.dao.ComInfoMapper;
import com.waeating.com.model.dto.ComBoardAttachDTO;
import com.waeating.com.model.dto.ComInfoDTO;
import com.waeating.com.model.dto.ComMenuDTO;

public class ComInfoService {
	
	private ComInfoMapper comInfoMapper;

	public ComInfoDTO comSelectOneComInfo(int comNo) {
		
		SqlSession sqlSession = getSqlSession();
		
		comInfoMapper = sqlSession.getMapper(ComInfoMapper.class);
		ComInfoDTO comInfo = comInfoMapper.comSelectOneComInfo(comNo);
		
		sqlSession.close();
		
		return comInfo;
	}

	public List<ComInfoDTO> comSelectOneComMenu(int comNo) {
		
		SqlSession sqlSession = getSqlSession();
		
		comInfoMapper = sqlSession.getMapper(ComInfoMapper.class);
		List<ComInfoDTO> comMenu = comInfoMapper.comSelectOneComMenu(comNo);
		
		sqlSession.close();
		
		return comMenu;
	}

	public int updateComInfo(Map<String, Object> updateComInfo) {
		
		SqlSession sqlSession = getSqlSession();
		
		comInfoMapper = sqlSession.getMapper(ComInfoMapper.class);
		int result = comInfoMapper.updateComInfo(updateComInfo);
		
		if(result > 0) {
			
			sqlSession.commit();
		} else {
			
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}

	public int insertComMenu(List<ComMenuDTO> comMenuList) {
		
		SqlSession sqlSession = getSqlSession();
		
		comInfoMapper = sqlSession.getMapper(ComInfoMapper.class);
		int result = 0;
		for(int i = 0; i < comMenuList.size(); i++) {
			
			result += comInfoMapper.insertComMenu(comMenuList.get(i));
		}
		
		if(result == comMenuList.size()) {
			
			sqlSession.commit();
		} else {
			
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}

	public int deleteComMenu(int comNo) {
		
		SqlSession sqlSession = getSqlSession();
		
		comInfoMapper = sqlSession.getMapper(ComInfoMapper.class);
		int result = comInfoMapper.deleteComMenu(comNo);
		
		if(result > 0) {
			
			sqlSession.commit();
		} else {
			
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}

	public int insertComInfoImg(ComInfoDTO insertComInfoImg) {
		
		SqlSession sqlSession = getSqlSession();
		
		comInfoMapper = sqlSession.getMapper(ComInfoMapper.class);
		int result = 0; 
		
        List<ComBoardAttachDTO> fileList = insertComInfoImg.getComBoardAttach();
        
        int attachResult = 0;
        for(int i = 0; i < fileList.size(); i++) {
        	attachResult += comInfoMapper.insertComInfoImg(fileList.get(i));
        }
        
		if(attachResult == fileList.size()) {
			
			sqlSession.commit();
			result = 1;
		} else {
			
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}

	public List<ComBoardAttachDTO> comSelectBoardImage(int comNo) {
		
		SqlSession sqlSession = getSqlSession();
		
		comInfoMapper = sqlSession.getMapper(ComInfoMapper.class);
		
		List<ComBoardAttachDTO> com = comInfoMapper.comSelectBoardImage(comNo);
		
		sqlSession.close();
		
		return com;
	}

	

	
	
	
}
