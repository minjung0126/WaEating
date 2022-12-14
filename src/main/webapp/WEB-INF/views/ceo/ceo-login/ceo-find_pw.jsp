<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>업주 비밀번호 변경</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/ceo/ceo-login/ceo-find_pw.css">
</head>
<body>
    <div class="wrap">
    	<label for="title">업주 비밀번호 변경</label>
        <div id="f_phone" class="find">
            <a href="${ pageContext.servletContext.contextPath }/member/ceo/findpw/phone">
                <img src="${ pageContext.servletContext.contextPath }/resources/images/login-img/phone2.png" alt="전화번호로 찾기">
                <p>전화번호로 변경</p>
            </a>
        </div>
        <div id="f_email" class="find">
            <a href="${ pageContext.servletContext.contextPath }/member/ceo/findpw/email">
                <img src="${ pageContext.servletContext.contextPath }/resources/images/login-img/email.png" alt="이메일로 찾기">
                <p>이메일로 변경</p>
            </a>
        </div>
        <a href="${ pageContext.servletContext.contextPath }/member/ceo/login"><button type="button" id="backBtn">뒤로가기</button></a>
    </div>
</body>
</html>