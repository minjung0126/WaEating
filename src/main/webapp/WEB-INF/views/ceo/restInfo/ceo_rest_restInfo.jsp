<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/ceo/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/ceo/address.js"></script>
</head>
<body>
<jsp:include page="../common/ceo_header.jsp"/>

  <div id="wrap">
    <!-- 왼쪽 (메뉴) -->
    <section class="row container-fluid px-5">
      <aside class="float-start col-2 mt-4 ms-5 px-3">
        <!-- 메뉴 제목 -->
        <h4 class="mb-3 ms-1">가게 관리</h4>
        <div class="list-group list-group-flush border-top border-bottom">
          <!-- 메뉴 세부 제목 -->
          <a href="${ pageContext.servletContext.contextPath }/ceo/rest_restInfo" class="list-group-item list-group-item-action py-3 select">가게 정보 관리</a>
          <a href="${ pageContext.servletContext.contextPath }/ceo/rest_notice" class="list-group-item list-group-item-action py-3">공지 관리</a>
          <a href="${ pageContext.servletContext.contextPath }/ceo/rest_review" class="list-group-item list-group-item-action py-3">리뷰 관리</a>
        </div>
       </aside>
       <!-- 오른쪽 (컨텐츠) -->
       <aside class="float-end col-9 mt-4 ms-3">
        <!-- 이미지 지우고 넣을 컨텐츠 써서 사용 -->
        <!-- <img src="img/visual.jpg" width="100%">  -->
        <div class="px-5 py-3">
          <div class="container-fluid">
            <div class="container my-3 d-flex justify-content-center">
              <img src="${ pageContext.servletContext.contextPath }/resources/images/ceo/rest1.jpg" class="mx-2" width="350px" height="300px">
              <img src="${ pageContext.servletContext.contextPath }/resources/images/ceo/rest2.jpg" class="mx-2" width="350px" height="300px">
              <img src="${ pageContext.servletContext.contextPath }/resources/images/ceo/rest3.jpg" class="mx-2" width="350px" height="300px">
            </div>
            <div class="d-flex justify-content-end pe-5">
              <button class="btn btn-primary" type="button">파일 선택</button>
            </div>
          </div>
            
            <div class="my-4 row mx-1 px-5">
              <form action="${ pageContext.servletContext.contextPath }/ceo/rest_restInfo" method="post">
                <table width="100%">
                  <tr>
                    <td class="col-1">가게명</td>
                    <td class="col-4"><input type="text" class="form-control my-3" placeholder="종로돈부리" name="restName" id="restName" readonly></td>
                    <td class="col-1"></td>
                    <td class="col-1">전화번호</td>
                    <td class="col-4"><input type="text" class="form-control" placeholder="02-722-2384" name="restPhone" id="restPhone"></td>
                  </tr>
                  <tr>
                    <td class="pb-3 col-1">주소</td>
                    <td class="pb-3 col-4">
                      <input type="text" id="address_kakao" class="form-control" placeholder="서울 종로구 삼일대로 385" name="restAddress" id="restAddress">
                      <!-- <div class="input-group">
                        <input type="text" id="address_kakao" class="form-control" placeholder="서울 종로구 삼일대로 385">
                        <button class="btn btn-primary" type="button" onclick="address_kakao()">주소 찾기</button>
                      </div> -->
                    </td>
                    <td class="col-1"></td>
                    <td class="pb-3 col-1">카테고리</td>
                    <td class="pb-3 col-4">
                      <select class="form-select" name="restCate" id="restCate">
                        <option>한식</option>
                        <option>분식</option>
                        <option>양식</option>
                        <option>일식</option>
                        <option>중식</option>
                        <option>기타</option>
                        <option>카페</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td class="pb-3 col-1">영업시간</td>
                    <td class="pb-3 col-4">
                      <div class="input-group">
                        <input type="time" class="form-control" name="restStart" id="restStart">
                        <input type="time" class="form-control" name="restEnd" id="restEnd">
                      </div>
                    </td>
                    <td class="col-1"></td>
                    <td class="pb-3 col-1">휴일</td>
                    <td class="pb-3 col-4">
                      <select class="form-select" name="restHol" id="restHol">
                        <option>월</option>
                        <option>화</option>
                        <option>수</option>
                        <option>목</option>
                        <option>금</option>
                        <option>토</option>
                        <option>일</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td class="pb-3" rowspan="100">메뉴</td>
                      <td class="pb-3">
                        <div id="menugroup">
                          <div class="input-group my-3" id="menu">
                              <input type="text" id="menuName" class="form-control" placeholder="메뉴명">
                              <input type="text" id="menuPrice" class="form-control" placeholder="가격">
                              <button class="btn btn-light border minus" type="button" id="minus">-</button>
                              <button class="btn btn-primary plus" type="button" id="plus">+</button>
                          </div>
                        </div>
                      </td>
                  </tr>
                </table>
                <div class="col d-flex justify-content-center mt-4">
                  <button class="btn btn-light border me-1" type="reset">취소</button>
                  <button class="btn btn-primary border ms-1" type="button" data-bs-toggle="modal" data-bs-target="#modalSubmit">수정</button>
                </div>
                <!-- Modal(수정) -->
                <div class="modal fade" id="modalSubmit">
                  <div class="modal-dialog">
                    <div class="modal-content">
                
                      <!-- Modal Header -->
                      <div class="modal-header">
                        <h4 class="modal-title">가게 정보 수정</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                      </div>
                
                      <!-- Modal body -->
                      <div class="modal-body">
                        가게 정보 수정이 완료되었습니다.
                      </div>
                
                      <!-- Modal footer -->
                      <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                      </div>
                
                    </div>
                  </div>
                </div>
              </form>
                  
            
                      
            </div>
            <script src="${ pageContext.servletContext.contextPath }/resources/js/ceo/addmenu.js"></script>
        </div>
       </aside>
    </section>
   
    <jsp:include page="../common/ceo_footer.jsp"/>

  </div>
</body>
</html>