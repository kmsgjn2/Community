<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="${path }/js/join.js"></script>
<title>커뮤니티-회원가입</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<main class="container">
  <h3 class="text-center m-3">회원가입</h3>
  <div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4 mt-3 mb-3">
      <form action="${path }/member/join" method="post" onsubmit="return checks()">
        <div class="mb-3">
          <input type="text" class="form-control" id="name" name="member_name" placeholder="이름">
		  <div id="name_check"></div>
        </div>
        <div class="row mb-3">
          <div class="col-lg-8">
            <input type="text" class="form-control" id="id" name="member_id" placeholder="아이디" onkeydown="idCheckReset()">
            <div id="id_check"></div>
          </div>
          <div class="col-lg-4">
          	<input type="hidden" id="idCheckStatus" name="idCheckStatus" value="false">
            <button type="button" class="btn btn-primary w-100" onclick="idCheck()">중복확인</button>
          </div>
        </div>
        <div class="mb-3">
          <input type="password" class="form-control" id="pw" name="member_pw" placeholder="비밀번호">
          <div id="pw_check"></div>
        </div>
        <div class="mb-3">
        </div>
        <button type="submit" class="btn btn-dark w-100">Join</button>
      </form>
    </div>
    <div class="col-md-4"></div>
  </div>
</main>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>