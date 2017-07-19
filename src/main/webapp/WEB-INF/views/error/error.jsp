<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/layoutTop.jsp" flush="true" />
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Error</title>
</head>
<body>
<div class="error-div">
    <div class="error-image"></div>
    <div class="error-title">ERROR</div>
    <div class="error-message">
        오류가 발생했습니다.<br>
        관리자에게 문의해주세요.</div>
    <div class="error-footer">ERROR_CODE</div>
</div>

<jsp:include page="/WEB-INF/views/include/layoutBottom.jsp" flush="true" />
