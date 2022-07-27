<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/user/user-mypage/user-update.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <!-- header -->
 
 <jsp:include page="../user_header.jsp"/>

  <div id="wrap">
    <!-- 왼쪽 (메뉴) -->
    <section class="row container-fluid px-5">
      <aside class="float-start col-2 mt-4 ms-5 px-3">
        <!-- 메뉴 제목 -->
        <h4 class="mb-3 ms-1">마이페이지</h4>
        <div class="list-group list-group-flush border-top border-bottom">
          <!-- 메뉴 세부 제목 -->
          <a href="#" class="list-group-item list-group-item-action py-3">즐겨찾기</a><!-- 상세 페이지에 select 클래스 넣어주기 -->
          <a href="#" class="list-group-item list-group-item-action py-3">고객센터</a>
          <a href="${ pageContext.servletContext.contextPath }/check/password/user" class="list-group-item list-group-item-action py-3 select">회원 정보 수정</a>
        </div>
       </aside>
       <!-- 오른쪽 (컨텐츠) -->
       <aside class="float-end col-9 mt-4 ms-3 border">
        <div id="container">
        <h1>회원 정보 수정</h1>
        <hr id="con_hr">
        <form action="" id="user_update">
            <div class="profile">
              <div class="profile_img">
                <img src="../img/profile.png" alt="프로필">
              </div>
              <input type="file" accept=".jpg,.jpeg,.png" name="upload" id="upload">
            </div>

            <label for="id">아이디</label>
            <input type="text" name="id" id="id" value="userId" readonly="readonly"><br>

            <label for="name">이름</label>
            <input type="text" name="name" id="name" placeholder="홍길동" ><br>

            
            <table class="update_pwd">
              <tr>
                <td  rowspan="3"><label for="password" style="margin-bottom: 0;">비밀번호</label></td>
              </tr>
              <tr>
                <td><input type="password" name="password" class="pw" placeholder="새 비밀번호를 입력하세요" style="margin-bottom: 3px;"><br></td>
              </tr>
              <tr>
                <td><input type="password" name="password" class="pw" placeholder="새 비밀번호를 다시 입력하세요"><br></td>
              </tr>
            </table>
           
            <label for="phone">전화번호</label>
            <input type="tel" name="phone" id="phone" placeholder="010-1234-5678" ><br>
            

            <label for="email">이메일</label>
            <input type="email" name="email" id="email" placeholder="abcd@naver.com"><br>

            <label for="birth">생년월일</label>
            <input type="text" name="birth" id="birth" value="2000-01-01" readonly="readonly">

            <input type="submit" value="회원수정" id="updatebtn">
        </form>

       </aside>
    </section>
   
	<jsp:include page="../user_footer.jsp"/>
  </div>
  

</body>
</html>