<%--
  Created by IntelliJ IDEA.
  User: hj
  Date: 2017. 4. 1.
  Time: PM 11:11
  회원 상세보기 화면
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>세광청년부 : 청년정보</title>
</head>
<body>
    <p>회원 일련변호 : ${member.memberSeq}</p>
    <p>회원명 : ${member.memberName}</p>
    <p>생년월일 : ${member.memberBirthday}</p>
    <p>등록일자 : ${member.registDate}</p>
    <p>수정일자 : ${member.updateDate}</p>
</body>
</html>
