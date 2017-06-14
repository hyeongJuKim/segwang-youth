<%--
  Created by IntelliJ IDEA.
  User: hj
  Date: 2017. 3. 31.
  Time: PM 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/include/layoutTop.jsp" flush="true" />

<title>세광청년부</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div>SG-Youth-Management</div>

        <div><a href="attendance/">출석관리</a></div>
        <div><a href="member/">청년관리</a></div>
    </div>


</div>
<jsp:include page="/WEB-INF/views/include/layoutBottom.jsp" flush="true" />