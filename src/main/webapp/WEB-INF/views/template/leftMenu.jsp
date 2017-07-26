<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% // TODO 자주 사용하는 function들을 하나의 API로 만들기 %>
<% // TODO: 로그인 기능이 추가 되기 전 까지 임시로 세션모달창 넣기.  %>

<div class="left-nav">

<c:forEach var="item" items="${menu}">
    <div class="item">
        <a href="/${item.MENU_CALL_NAME}"> <span class="${item.MENU_ICON_NAME}"></span> ${item.MENU_NAME}
        </a>
    </div>
</c:forEach>

</div>
