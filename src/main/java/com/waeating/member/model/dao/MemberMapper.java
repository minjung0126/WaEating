package com.waeating.member.model.dao;

import com.waeating.member.model.dto.MemberDTO;
import com.waeating.member.model.dto.UserDTO;
import com.waeating.member.model.dto.UserInfoAttachDTO;

import java.util.List;
import java.util.Map;

import com.waeating.common.paging.SelectCriteria;

public interface MemberMapper {

	String selectEncryptedPwd(MemberDTO requestMember);

	MemberDTO selectLoginAdmin(MemberDTO requestMember);

	int selectTotalCount(Map<String, String> searchMap);

	List<MemberDTO> selectMemberList(SelectCriteria selectCriteria);

	MemberDTO selectMemberDetail(Map<String, String> searchMap);

	int adminUpdateMember(Map<String, String> updateMemberMap);

	int adminUpdateUser(Map<String, String> updateUserMap);

	int deleteMember(String id);

	UserInfoAttachDTO selectUserAttach(Map<String, String> searchMap);

	int insertAdmin(Map<String, String> adminMap);
	
	/* user-login */
	MemberDTO selectMemberLogin(MemberDTO requestMember);
	
	int insertUser(UserDTO requestUser);
	
	int insertMember(MemberDTO requestMember);

	int dubleCkId(String userId);

	MemberDTO selectFindIdForEmail(MemberDTO requestMember);

	MemberDTO selectFindIdForPhone(MemberDTO requestMember);

	MemberDTO checkFindPwForEmail(MemberDTO requestMember);

	int updateNewPwd(MemberDTO requestMember);

	MemberDTO checkFindPwForPhone(MemberDTO requestMember);

	int updateUserInformation(MemberDTO requestMember);

}
