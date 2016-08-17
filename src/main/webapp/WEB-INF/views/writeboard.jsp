<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-striped">
	<tr>
		<td>한줄 수다</td>
		<td>작성자</td>
	</tr>
	<!-- status .. -->
	<c:forEach items="${board_List}" var="list" varStatus="status">
		<tr>
			<td>${list.content}</td>
			<td>${list.id}</td>
		</tr>
	</c:forEach>
</table>