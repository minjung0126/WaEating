package com.waeating.com.model.dao;

import java.util.List;
import java.util.Map;

import com.waeating.com.model.dto.ComBoardAttachDTO;
import com.waeating.com.model.dto.ComInfoDTO;
import com.waeating.com.model.dto.ComNoticeDTO;
import com.waeating.common.paging.SelectCriteria;

public interface ComInfoMapper {

	/* 관리자 용도 */
	int adminSelectTotalCount(Map<String, String> searchMap);

	List<ComInfoDTO> adminSelectCompanyList(SelectCriteria selectCriteria);

	ComInfoDTO adminSelectCompanyDetail(Map<String, String> searchMap);

	int updateCompanyStatus(Map<String, String> updateRecordMap);

	int deleteCompany(String comNo);

	int refuseCompanyStatus(Map<String, String> searchMap);
	
	int accessCompanyStatus(Map<String, String> searchMap);
	
	int updateCompany(Map<String, String> updateCompanyMap);
	
	/* 회원 정보 찾기 용도 */
	List<ComInfoDTO> selectCom(SelectCriteria selectCriteria);

	int selectAllCount(Map<String, String> searchMap);

	List<ComInfoDTO> selectComByGrade(SelectCriteria selectCriteria);
	
	ComInfoDTO selectComDetail(int comNo);

	List<ComInfoDTO> selectComMenu(int comNo);

	List<ComBoardAttachDTO> selectComImg(int comNo);

	ComInfoDTO selectComName(String comNo);

	int selectComCountByGrade();



	/* 업체 용도 */


}
