<%--
  Created by IntelliJ IDEA.
  User: hj
  Date: 2017. 4. 1.
  Time: PM 6:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/include/layoutTop.jsp" flush="true" />


<title>세광청년부 : 청년 조회</title>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><span id="name"></span></h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-3">
                        <img id ="profile-img" th:src="@{/js/static/question_mark.png" />
                    </div>
                    <div class="col-md-9">
                        <div class="col-md-3">생년월일:</div><div id="birthday" class="col-md-9"></div><div class="clearfix"></div>
                        <div class="col-md-3">성별: </div><div id="gender" class="col-md-9"> </div>	<div class="clearfix"></div>
                        <div class="col-md-3">마을: </div><div id="village" class="col-md-9"> </div> <div class="clearfix"></div>
                        <div class="col-md-3">E-Mail: </div><div id="e-mail" class="col-md-9"> </div> <div class="clearfix"></div>
                        <div class="col-md-3">연락처: </div><div id="phoneNumber" class="col-md-9"> </div> <div class="clearfix"></div>
                        <div class="col-md-3">직책: </div><div id="position" class="col-md-9"> </div> <div class="clearfix"></div>
                        <div class="col-md-3">직장: </div><div id="job" class="col-md-9"> </div> <div class="clearfix"></div>
                        <div class="col-md-3">주소: </div><div id="memberAddress" class="col-md-9"> </div> <div class="clearfix"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">

                        가족관계
                        <table class="table table-hover">
                            <thead>
                            <tr class="active">
                                <td style="width: 30px;">#</td>
                                <td style="width: 60px;">관계</td>
                                <td style="width: 100px;">이름</td>
                                <td>종교</td>
                            </tr>
                            </thead>
                            <tbody class="table-search" id="family-tbody">

                            </tbody>
                        </table>

                    </div>
                </div><!-- row -->
            </div><!-- modal-body -->
            <div class="modal-footer">
                <form class="form-inline" id="formDetail">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="btnDetail" name="memberSeq" value="">상세보기</button>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="container">

    <div class="row">
        <form class="form-inline" method="post" action ="/segwangYouth/members">
            <div class="form-group">
                이름: <input type="text" class="form-control" name="name"/>
                마을:
                <select class="form-control" name="village">
                    <option value="">전체</option>
                    <c:forEach var="villageList" items="${selectList.villageAllList}">
                        <option value="${villageList.VILLAGE_SEQ}">${villageList.VILLAGE_NAME}</option>
                    </c:forEach>
                </select>
                직책:
                <select class="form-control" name="memberPosition">
                    <option value="">전체</option>
                    <c:forEach var="codeList" items="${selectList.codeListAA}">
                        <option value="${codeList.CODE_NO}">${codeList.CODE_NAME}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-default">조회</button>  <br><br>
            </div>
        </form>
        <div class="table-search">
            <h3 class="panel-title">SegwangYouth Member: ${fn:length(selectList.memberList)}명</h3>
            <table class="table table-hover">
                <thead>
                <tr class="active">
                    <td style="width: 30px;">#</td>
                    <td style="width: 80px;">이름</td>
                    <td style="width: 50px;">성별</td>
                    <td>생년월일</td>
                    <td>마을</td>
                    <td>직책</td>
                    <td>연락처</td>
                    <td>직업</td>
                </tr>
                </thead>
                <tbody class="table-search">
                <c:forEach var="member" items="${selectList.memberList}" varStatus="status">
                    <tr style="cursor: pointer;" class="memberDetail" value="${member.MEMBER_SEQ}">
                        <td style="width: 30px; color:#ABABAB;">${status.count}</td>
                        <td>${member.MEMBER_NAME}</td>
                        <td>${member.MEMBER_GENDER}</td>
                        <td>${member.MEMBER_BIRTHDAY}</td>
                        <td>${member.VILLAGE_NAME}</td>
                        <td>${member.MEMBER_POSITION}</td>
                        <td>${member.PHONE_NUMBER}</td>
                        <td>${member.MEMBER_JOB}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div><!--  class="table-search" -->
    </div> <!-- row -->

    <div class="row">

        <h3 class="panel-title">Member Count</h3>
        <c:forEach var="total" items="${selectList.statistics}">
			<span class="villageGroupCountBox">
				남: ${total.MALE_COUNT}
			</span>
            <span class="villageGroupCountBox">
				여: ${total.FEMALE_COUNT}
			</span>
            <span class="villageGroupCountBox">
				합계: ${total.TOTAL_COUNT}
			</span>
        </c:forEach>
        <br>
        <c:forEach var="memberCnt" items="${selectList.memberCount}" varStatus="status">
			<span class="villageGroupCountBox">
				${memberCnt.VILLAGE_NAME}<c:if test="${status.index != 0}">마을</c:if> : ${memberCnt.VILLAGE_CNT}명
			</span>
        </c:forEach>

    </div>
</div>



<jsp:include page="/WEB-INF/views/include/layoutBottom.jsp" flush="true" />