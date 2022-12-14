<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>user_matzip_detail</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/user/user.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <jsp:include page="../user_header.jsp"/>

  <div id="wrap">
    <!-- 왼쪽 (메뉴) -->
    <section class="row container-fluid px-5">
      <aside class="float-start col-2 mt-4 ms-5 px-3">
        <!-- 메뉴 제목 -->
        <h4 class="mb-3 ms-1">맛집리스트</h4>
        <div class="list-group list-group-flush border-top border-bottom">
          <!-- 메뉴 세부 제목 -->
          <a href="${ pageContext.servletContext.contextPath }/user/matziplist/grade" class="list-group-item list-group-item-action py-3 select">평점별</a><!-- 상세 페이지에 select 클래스 넣어주기 -->
          <a href="${ pageContext.servletContext.contextPath }/user/matziplist/location" class="list-group-item list-group-item-action py-3">지역별</a>
          <a href="${ pageContext.servletContext.contextPath }/user/matziplist/category" class="list-group-item list-group-item-action py-3">종류별</a>
        </div>
       </aside>
       <!-- 오른쪽 (컨텐츠) -->
       <aside class="float-end col-9 mt-4 ms-3 border" style="min-height:700px;">
        <!-- 이미지 지우고 넣을 컨텐츠 써서 사용 -->

        <div class="img mx-4">
        <c:forEach var="image" items="${ requestScope.selectComImg }" >        
            <img src="${ pageContext.servletContext.contextPath }/resources/upload/com_info/${ image.fileName }" width="250" height="300">
        </c:forEach>
            <%-- <img src="${ pageContext.servletContext.contextPath }/resources/images/user/ddok2.jpg" width="250" height="300">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/user/ddok3.png" width="250" height="300">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/user/ddok4.jpg" width="250" height="300"> --%>
        </div><!--img-->
        
        <br>
        <br>
        <br>
        <h2 style="text-indent: 50px;">${ requestScope.selectCom.comName } &nbsp&nbsp&nbsp&nbsp <a style="text-indent: 20px; color:rgb(228, 106, 35);">${ requestScope.selectAvgRatings.avgRatings }</a> </h2> 
        <br>
        <hr>

   
        
        <table>
           <tr>
                <th>주소</th>
                <td>${ requestScope.selectCom.comAddress }</td>
            </tr>
            <tr>
                 <th>전화번호</th>
                 <td>${ requestScope.selectCom.comPhone }</td>
            </tr>
           <tr>
                <th>영업시간</th>
                <td>${ requestScope.selectCom.workTime }</td>
           </tr>
           <tr>
                <th>휴무</th>
                <td>${ requestScope.selectCom.holiday }</td>
           </tr>
           <tr>
                <th>카테고리</th>
                <td>${ requestScope.selectCom.category }</td>
           </tr>
           <tr>
                <th	valign="top">메뉴</th>
                
                <td>
                	<c:forEach var="com" items="${ requestScope.selectComMenu }">
                	<div class="mb-2">${ com.comMenu.menuName } : ${ com.comMenu.price } 원<br></div>
                		
                	</c:forEach>
                </td> 
                
           </tr>
        </table>

        
        <hr>

       <div class="container mt-3">
          <br>
          <!-- Nav tabs -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" data-bs-toggle="tab" href="#home" >리뷰</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#menu1">공지사항</a>
            </li>
          </ul>
        
          <!-- Tab panes -->
          <div class="tab-content">
            <div id="home" class="container tab-pane active"><br>
            <c:forEach var="review" items="${ requestScope.selectReview }">

                <div class="review my-2 m-2" style=" min-height: 150px ">
      
                  <div class="user float-start" style="width:19%">
                 
                    <img src="${ pageContext.servletContext.contextPath }/resources/upload/user_profile/${ review.userInfoAttach.fileName }" alt="user_profile" >
                    <p>${ review.memberInfo.id }</p>
                    
                  </div>
                  <div class="content float-end" style="width:77%">
                    
                    <div class="content_header">
                      <p class="date">${ review.waitingRecord.useDate }</p>
                      <c:if test="${ review.ratings eq 1 }">                      
                      <p class="point text-warning">★☆☆☆☆</p>
                      </c:if>
                      <c:if test="${ review.ratings eq 2 }">                      
                      <p class="point text-warning">★★☆☆☆</p>
                      </c:if>
                      <c:if test="${ review.ratings eq 3 }">                      
                      <p class="point text-warning">★★★☆☆</p>
                      </c:if>
                      <c:if test="${ review.ratings eq 4 }">                      
                      <p class="point text-warning">★★★★☆</p>
                      </c:if>
                      <c:if test="${ review.ratings eq 5 }">                      
                      <p class="point text-warning">★★★★★</p>
                      </c:if>
                      
                    </div>
                    <div class="content_body">
                      <p>
                        ${ review.reviewContent }
                      </p>
                      <c:forEach var="reviewImg" items="${ review.reviewAttach }">
                        <c:if test="${ reviewImg.fileName ne null  }">
                      	<img src="${ pageContext.servletContext.contextPath }/resources/upload/review/origin/${ reviewImg.fileName }" alt="">
                      	</c:if>
                      </c:forEach>
                      <!-- <img src="../1_front/images/ddok1.png" alt="">
                      <img src="../1_front/images/ddok1.png" alt="">     -->      
                    </div>
                    
                  </div><!--content-->
                  <div style="width:1000px;" class="d-flex justify-content-center">
                    <c:if test="${ review.reviewAns.ansContent ne null}">
	                  <div class="reply my-2  mx-5 " style="border-radius: 8px; background-color: rgb(221, 220, 220); height: auto; width:700px; ">
		                  <div style="min-height:80px; width:50px; float:left; ">
		                    <img src="${ pageContext.servletContext.contextPath }/resources/images/user/right-arrow.png" alt="right-arrow" style="width:30px; height:30px; ">
		                  </div>
		                  <p style="">
		                   ${ review.reviewAns.ansContent }
		                  </p>
	                  </div><!--reply-->
                    </c:if>
                  </div>
                </div><!--review-->
         
            </c:forEach>
            </div>
            <div id="menu1" class="container tab-pane fade"><br>
            
			 <div id="accordion">
            <c:forEach var="notice" items="${ requestScope.selectComNotice }" varStatus="stu"> 
			   <div class="card">
			      <div class="card-header">
			        <a class="btn" data-bs-toggle="collapse" href="#collapse${ stu.count }" >
			          <h5 style="float:left;">${ notice.noticeTitle } </h5> <br> 
			        </a>
			        <div id="collapse${ stu.count }" class="collapse" data-bs-parent="#accordion">
			        <div class="card-body ms-3" style="clear:both;color:gray;">
			          ${ notice.noticeContent }
			          <p style="color: gray; float: right;">${ notice.regDate }</p>
				    </div><!-- collapsOne -->
			        </div><!-- card-body -->
			      </div><!-- card-header -->
			   </div><!-- card -->
            </c:forEach>
			 </div> <!-- accordion -->
             
            </div>
          </div>
        </div>

        
       
        
       <!--  <p class="more">더보기</p> -->

        
      </aside>
    </section>
    
	<jsp:include page="../user_footer.jsp"/>

  </div>

</body>
</html>