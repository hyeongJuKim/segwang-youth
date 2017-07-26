<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="ko">
<% //TODO 에러페이지 적용시키기 %>
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
        관리자에게 문의하십시오.</div>
    <div class="error-footer">${error}</div>
</div>

