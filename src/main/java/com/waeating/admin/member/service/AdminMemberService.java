package com.waeating.admin.member.service;

import static com.waeating.common.mybatis.Template.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.waeating.common.paging.SelectCriteria;
import com.waeating.member.model.dao.MemberMapper;
import com.waeating.member.model.dto.MemberDTO;
import com.waeating.member.model.dto.UserInfoAttachDTO;

public class AdminMemberService {
	
	private MemberMapper memberMapper;

	/**
	 * <pre>
	 * 	페이징 처리를 위한 전체 게시물 수 조회용 메소드
	 * </pre>
	 * @param searchMap
	 * @return
	 */
	public int selectTotalCount(Map<String, String> searchMap) {
		
		SqlSession sqlSession = getSqlSession();
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		int totalCount = memberMapper.selectTotalCount(searchMap);
		
		sqlSession.close();
		
		return totalCount;
	}

	/**
	 * <pre>
	 * 	회원 전체 조회용 메소드
	 * </pre>
	 * @param selectCriteria
	 * @return
	 */
	public List<MemberDTO> selectMemberList(SelectCriteria selectCriteria) {
		
		SqlSession sqlSession = getSqlSession();
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		List<MemberDTO> memberList = memberMapper.selectMemberList(selectCriteria);
		
		sqlSession.close();
		
		return memberList;
	}

	/**
	 * <pre>
	 * 	회원 정보 상세보기용 메소드
	 * </pre>
	 * @param searchMap
	 * @return
	 */
	public MemberDTO selectMemberDetail(Map<String, String> searchMap) {

		SqlSession sqlSession = getSqlSession();
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		MemberDTO member = memberMapper.selectMemberDetail(searchMap);
		
		sqlSession.close();
		
		return member;
	}

	/**
	 * <pre>
	 * 	회원 정보 수정용 메소드(member범위)
	 * </pre>
	 * @param updateMemberMap
	 * @return
	 */
	public int updateMember(Map<String, String> updateMemberMap) {

		SqlSession sqlSession = getSqlSession();
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		int result = memberMapper.adminUpdateMember(updateMemberMap);
		
		if(result > 0) {
			
			sqlSession.commit();
		} else {
			
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}

	/**
	 * <pre>
	 * 	회원 정보 수정용 메소드(user범위)
	 * </pre>
	 * @param updateUserMap
	 * @return
	 */
	public int updateUser(Map<String, String> updateUserMap) {
		
		SqlSession sqlSession = getSqlSession();
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		int result = memberMapper.adminUpdateUser(updateUserMap);
		
		if(result > 0) {
			
			sqlSession.commit();
		} else {
			
			sqlSession.rollback();
		}

		sqlSession.close();
		
		return result;
	}

	/**
	 * <pre>
	 * 	회원정보 삭제용 메소드
	 * </pre>
	 * @param id
	 * @return
	 */
	public int deleteMember(String id) {
		
		SqlSession sqlSession = getSqlSession();
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		int result= memberMapper.deleteMember(id);
		
		if(result > 0) {
			
			sqlSession.commit();
		} else {
			
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}

	/**
	 * <pre>
	 *   회원 첨부파일 정보 조회용 메소드
	 * </pre>
	 * @param searchMap
	 * @return
	 */
	public UserInfoAttachDTO selectUserAttach(Map<String, String> searchMap) {

		SqlSession sqlSession = getSqlSession();
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		UserInfoAttachDTO attach = memberMapper.selectUserAttach(searchMap);
		
		sqlSession.close();
		
		return attach;
	}

	/**
	 * <pre>
	 * 	관리자 회원가입용 메소드
	 * </pre>
	 * @param adminMap
	 * @return
	 */
	public int insertAdmin(Map<String, String> adminMap) {
		
		SqlSession sqlSession = getSqlSession();
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		int result = memberMapper.insertAdmin(adminMap);
		
		if(result > 0) {
			
			sqlSession.commit();
		}else {
			
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return result;
	}

}
