<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.js"
        integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Bootstrap Core JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- air-datepicker -->
<link href="/air-datepicker/css/datepicker.css" rel="stylesheet" type="text/css">
<script src="/air-datepicker/js/datepicker.js"></script>

<!-- Include English language -->
<script src="/air-datepicker/js/i18n/datepicker.ko.js"></script>


<!-- Tippy.js (Tooltip lib)-->
<!-- https://atomiks.github.io/tippyjs/ -->
<link rel="stylesheet" href="/tippyjs-1.0.1/css/tippy.css">
<script src="/tippyjs-1.0.1/js/tippy.min.js"></script>



<!-- Custom CSS -->
<link href="/css/segwang-youth.css" rel="stylesheet" type="text/css">

<!-- TODO: TITLE도 MENU 테이블에서 가져오기 -->
<title></title>
</head>
<body>

<!-- //TODO: 공통적으로 모든 곳에 적용하기. DB에서 가져오기. (메뉴 html코드 위치 어떻게 하지?)
       TODO: 로그인 기능이 추가 되기 전 까지 임시로 세션모달창 넣기.
-->
<div class="left-nav">
    <div class="item">
        <a href="/dashboard"> <span class="glyphicon glyphicon-dashboard"></span> DashBoard
        </a>
    </div>
    <div class="item">
        <a href="/attendance"> <span class="glyphicon glyphicon-tasks"></span> 출석관리
        </a>
    </div>
    <div class="item">
        <a href="/member"> <span class="glyphicon glyphicon-user"></span> 청년관리
        </a>
    </div>
</div>

