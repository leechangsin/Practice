<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${subject_List}" var="list">
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">${list.subject}</a></li>
</c:forEach>