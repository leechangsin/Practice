<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result}">
    <script>
    alert("<%=session.getAttribute("username") %> 님 환영합니다 ^^.");
    location.href="/main";
    </script>
</c:if>
<c:if test="${not result}">
    <script>
    alert("로그인에 실패하셨습니다. 비밀번호를 확인하세요");
    location.href="/";
    </script>
</c:if>