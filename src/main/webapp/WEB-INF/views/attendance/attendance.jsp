<%--
  Created by IntelliJ IDEA.
  User: hj
  Date: 2017. 4. 1.
  Time: PM 6:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/include/layoutTop.jsp" flush="true" />

<script>
$(document).ready(function() {
    initDatepicker();
    initCheckboxHandler();

    $("#memberAdd").on("click",function(){
        $('#myModal').modal('show');

    });

    $("#btnNewMember").on("click",function(){
        console.log();
//        document.getElementById("formNewMember").submit();

    });


    $('#attendance-date').val("${attendance.attendanceDate}");



    function initDatepicker(){
        var disabledDays = [1, 2, 3, 4, 5, 6];
        $('.attendance-datepicker').datepicker({
            autoClose: true,
            onRenderCell: function (date, cellType) {
                if (cellType === 'day') {
                    var day = date.getDay(),
                        isDisabled = disabledDays.indexOf(day) != -1;
                    return {
                        disabled: isDisabled
                    }
                }
            },
            onSelect: function onSelect(date) {
                if(!isCheckValidDay(date))
                    return;
                document.getElementById("calendarForm").method = "GET";
                document.getElementById("calendarForm").action = "${pageContext.request.contextPath}/attendance/" + date;
                document.getElementById("calendarForm").submit();
            }

        })
    };

    function initCheckboxHandler() {
        $("input[class='attendance-checkbox']").click(function() {
            var attendanceDate = $("#attendance-date").val();
            var villageSeq = $(this).attr("village_seq");
            console.log("initCheckboxHandler checked id: " + this.id);
            saveAttendance(this.id, this.checked,attendanceDate,villageSeq);
        });
    };



    function saveAttendance(memberSeq,checked,attendanceDate,villageSeq){
        $.ajax({
            url:"${pageContext.request.contextPath}/attendance/check",
            method: "POST",
            data: {"memberSeq":memberSeq, "attendanceYn": checked, "attendanceDate": attendanceDate,"villageSeq":villageSeq},
            dataType: "json",
            success: function(data){
                console.log("save attendacee success");
                var villageId = ('#village-' + data.villageSeq);
                $(villageId).find($('.village-attendance-count')).html(data.VILLAGE_COUNT);
                $('#total-count').html(data.TOTAL_COUNT);
                console.log(data.TOTAL_COUNT);
            },
            error: function(error){
                alert("오류가 발생했습니다."+ error.status);
                console.log("error:" + error.status);
            }
        });
    };



    function isCheckValidDay(fd){
        var selectDay = new Date(fd).getDay();
        if (selectDay !== 0) {
            alert("선택한 날짜가 일요일이 아닙니다! 다시 선택해주세요.");
            return false;
        }
        return true;
    }


});
</script>

<title>세광청년부 : 출석</title>
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
                        <img id ="profile-img" src="${pageContext.request.contextPath}/resources/images/profile/question_mark.png"></img>
                    </div>
                    <div class="col-md-9">
                        <form id="formNewMember" action="/attendance/newMember" method="post">
                            <div class="col-md-3">이름: </div>
                            <div id="memberName" class="col-md-9"><input type='text' class="form-control" /></div><div class="clearfix"></div>

                            <div class="col-md-3">성별: </div>
                            <div id="gender" class="col-md-9">
                                    <select class="form-control" name="memberGenderCode">
                                        <c:forEach var="codeListAF" items="${attendance.codeListAF}">
                                            <option value="${codeListAF.CODE_NO}" ${ codeListAF.CODE_NO == selectDetail.memberDetailInfo.MEMBER_GENDER_CODE ?  'selected="selected"' : ' '}>
                                                    ${codeListAF.CODE_NAME}
                                            </option>
                                        </c:forEach>
                                    </select>
                            </div><div class="clearfix"></div>

                            <div class="col-md-3">연락처: </div>
                            <div id="phoneNumber" class="col-md-9"><input type='text' class="form-control" /></div><div class="clearfix"></div>

                            <div class="col-md-3">비고: </div>
                            <div id="job" class="col-md-9"><textarea class="form-control" rows="3"></textarea> </div>
                        </form>
                    </div>
                </div>
            </div><!-- modal-body -->
            <div class="modal-footer">
                <form class="form-inline">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-success" id="btnNewMember" name="memberSeq" value="">저장</button>
                </form>
            </div>
        </div>
    </div>
</div> <!-- modal end -->

<div class="container">

    <div class="row row-margin">
        <div class="col-md-4">
            <form id="calendarForm" class="form-inline">
                <div class="form-group">
                    <label for="attendance-date">조회</label>
                    <input type='text'
                           id ="attendance-date"
                           class="datepicker-here attendance-datepicker form-control"
                           data-position="bottom left"
                           data-language='ko'
                           readonly />
                    <span>
                        출석 <span id="total-count">${attendance.totalAttendanceCount}</span> / ${attendance.totalMemberCount}
                    </span>
                </div>
            </form>
        </div>
        <div class="col-md-4">
            <progress value="${attendance.totalAttendanceCount}" max="${attendance.totalMemberCount}"></progress>
        <%--<div class="progress">--%>
                <%--<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">--%>
                    <%--<span class="sr-only"></span>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
    </div>

    <div class="row row-margin">
        <c:forEach var="village" items="${attendance.villageList}" varStatus="index">
        <div class="div-villages col-md-1 col-sm-2 col-xs-3 no-padding">
            <table id="village-${village.villageSeq}" class="table-village table table-hover table-condensed table-bordered">
                <tr>
                    <th colspan="2" class="village-name">
                        ${village.villageName}
                    </th>
                </tr>
                <c:forEach var="member" items="${village.villageMember}">
                <tr>
                    <td><span>${member.MEMBER_NAME}</span></td>
                    <td>
                        <input id="${member.MEMBER_SEQ}"
                               class="attendance-checkbox"
                               type="checkbox"
                               village_seq="${village.villageSeq}"
                               ${member.ATTENDANCE_YN eq "Y" ? "checked" : " "}>
                    </td>
                </tr>
                </c:forEach>
                <tr>
                    <td colspan="2">
                        <span class="village-attendance-count">${village.attendanceCount}</span> /` <span class="village-all-count">${fn:length(village.villageMember)}</span>명
                    </td>
                </tr>
                <c:if test="${index.last}">
                <tr>
                    <td>
                        <div style="text-align: center;"><button type="button" id="memberAdd" class="btn btn-xs btn-success">Add</button></div>
                    </td>
                </tr>
                </c:if>
            </table>
        </div><!-- div-villages -->
        </c:forEach>

    </div> <!-- row -->

<div>



<jsp:include page="/WEB-INF/views/include/layoutBottom.jsp" flush="true" />