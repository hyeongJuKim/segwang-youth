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
    initEvent();
    initCheckboxHandler();


    $("#memberAdd").on("click",function(){
        $('#myModal').modal('show');
    });

    $(".memberDel").on("click",function(){
        var memberSeq = $(this).parent().parent().parent().find('input[class="attendance-checkbox"]').attr('id');
        var formDeleteMember = "formDeleteMember-" + memberSeq;

        // confirm Window - 이전에 기록된 모든 모든 출석이 삭제가 됩니다. 정말로 삭제하시겠습니까?

        console.log(formDeleteMember);
        document.getElementById(formDeleteMember).submit();
    });




    $("#btnNewMember").on("click",function(){
        var memberName = $('input[name="memberName"]').val();
        var memberGenderCode = $('select[name="memberGenderCode"]').val();
        var firstAttendanceDate = $('input[name="firstAttendanceDate"]').val();

        if (!isNullStr(memberName)){
            alert("이름을 입력해주세요");
            return;
        }
        if (!isNullStr(memberGenderCode)){
            alert("성별을 입력해주세요");
            return;
        }
        if (!isNullStr(firstAttendanceDate)){
            alert("출석일을 입력해주세요");
            return;
        }

        console.log("formNewMember submit");
        document.getElementById("formNewMember").submit();
    });


    $('#attendance-date').val("${attendance.attendanceDate}");


    function initEvent(){
        initTooltip();
        initDatepicker();

    };


    function initTooltip(){
        var this_a = $(this).attr('id');
        const el = $('span[data-origianl-title=' + this_a + ']');

        // ToolTip
        tippy('.member-tooltip',{
            position: 'bottom',
            trigger: 'click',
            interactive: 'true',
            animation: 'shift',
            theme: 'light',
            size: 'big',
            show: function(){
                const el = $(this).find('div[class=tippy-tooltip-content]');
                var id = this.id;
                var memberName = $('span[aria-describedby='+id+']').text();
                var memberForm = $('span[aria-describedby='+id+']').closest('tr').find('form');
                var memberSeq = memberForm.children()[1].value;
                var attendanceDate = memberForm.children()[2].value;

                $.ajax({
                    url : "${pageContext.request.contextPath}/attendance/fourWeekAttendance" ,
                    method: 'POST',
                    data: {"memberSeq":memberSeq, "attendanceDate": attendanceDate} ,
                    dataType: 'JSON' ,
                    success: function(data){
                        var str = memberName + "<br>";
                        str += "최근 출석<br>";
                        $.each(data, function(i) {
                            str += data[i].ATTENDANCE_DATE + "&nbsp&nbsp" + data[i].ATTENDANCE_YN + "<br>";
                        });
                        el.html(str);
                    },
                    error: function(error){
                    }
                });

            }
        })
    };


    function initDatepicker(){
        var disabledDays = [1, 2, 3, 4, 5, 6];
        $('.default-datepicker').datepicker({
            autoClose: true,
            onRenderCell: function (date, cellType) {
                if (cellType === 'day') {
                    var day = date.getDay(),
                        isDisabled = disabledDays.indexOf(day) != -1;
                    return {
                        disabled: isDisabled
                    }
                }
            }

        })

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
    };


    /**
     * 문자열 유효성 체크.
     * 좌우 공백 제거 후 문자열이 있는지 확인
     * @param str
     * @returns {boolean}
     */
    function isNullStr(str) {
        return (!str.trim()) ? false : true;
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
                        <%--<img id ="profile-img" src="${pageContext.request.contextPath}/resources/images/profile/question_mark.png"></img>--%>
                    </div>
                    <div class="col-md-9">
                        <form id="formNewMember" action="${pageContext.request.contextPath}/attendance/newMember" method="post">
                            <div class="col-md-3">이름: </div>
                            <div class="col-md-9"><input type='text' name="memberName" class="form-control" required /></div><div class="clearfix"></div>

                            <div class="col-md-3">성별: </div>
                            <div class="col-md-9">
                                    <select class="form-control" name="memberGenderCode" required>
                                        <c:forEach var="codeListAF" items="${attendance.codeListAF}">
                                            <option value="${codeListAF.CODE_NO}" ${ codeListAF.CODE_NO == selectDetail.memberDetailInfo.MEMBER_GENDER_CODE ?  'selected="selected"' : ' '}>
                                                    ${codeListAF.CODE_NAME}
                                            </option>
                                        </c:forEach>
                                    </select>
                            </div><div class="clearfix"></div>

                            <div class="col-md-3">연락처: </div>
                            <div class="col-md-9"><input type='text' name="phoneNumber" class="form-control" /></div><div class="clearfix"></div>

                            <div class="col-md-3">비고: </div>
                            <div class="col-md-9"><textarea name="remark" class="form-control" rows="3"></textarea> </div>

                            <div class="col-md-3">등록일자(출석 시작일): </div>
                            <div class="col-md-9">
                                <input type='text'
                                       name="firstAttendanceDate"
                                       class="datepicker-here default-datepicker form-control"
                                       data-position="bottom left"
                                       data-language='ko'
                                       readonly
                                       required />
                            </div>
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
                <tr <%-- class="${member.MEMBER_GENDER.equals('01') ? 'info' : 'warning'}" --%> >
                    <td ><span class="member-tooltip" title="loading ...">
                            ${member.MEMBER_NAME}
                        </span>
                        <c:if test="${index.last}">
                        <div style="text-align: center;"><button type="button" class="memberDel btn btn-xs btn-danger">Del</button></div>
                        </c:if>
                    </td>
                    <td>
                        <form id="formDeleteMember-${member.MEMBER_SEQ}" action="${pageContext.request.contextPath}/attendance/deleteMember" method="post">
                            <input id="${member.MEMBER_SEQ}"
                                   class="attendance-checkbox"
                                   type="checkbox"
                                   village_seq="${village.villageSeq}"
                                   ${member.ATTENDANCE_YN eq "Y" ? "checked" : " "}>
                            <input type="hidden" name="memberSeq" value="${member.MEMBER_SEQ}">
                            <input type="hidden" name="attendanceDate" value="${attendance.attendanceDate}">
                        </form>
                    </td>
                </tr>
                </c:forEach>
                <tr>
                    <td colspan="2">
                        <span class="village-attendance-count">${village.attendanceCount}</span> / <span class="village-all-count">${fn:length(village.villageMember)}</span>명
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