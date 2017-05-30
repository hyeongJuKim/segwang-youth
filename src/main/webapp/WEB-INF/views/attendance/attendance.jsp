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

    $('#attendance-date').val("${attendanceDate}");

    function initDatepicker(){
        var disabledDays = [1, 2, 3, 4, 5];
        $('.attendance-datepicker').datepicker({
            autoClose: true,
            onRenderCell: function (date, cellType) {
                if (cellType == 'day') {
                    var day = date.getDay(),
                        isDisabled = disabledDays.indexOf(day) != -1;
                    return {
                        disabled: isDisabled
                    }
                }
            },
            onSelect: function onSelect(fd, date) {
                console.log("onSelect" + "${attendanceDate}");
                document.getElementById("calendarForm").method = "GET";
                document.getElementById("calendarForm").action = "${pageContext.request.contextPath}/attendance/" + fd;
                document.getElementById("calendarForm").submit();

            }

        })
    };

    function initCheckboxHandler() {
        $("input[class='attendance-checkbox']").click(function() {
            var attendanceDate = $("#attendance-date").val();
            var villageSeq = $(this).attr("village_seq");
            console.log(villageSeq);
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
                console.log("save success");
            },
            error: function(error,data){
                alert("오류가 발생했습니다."+ error.status);
                console.log("error:" + error.status);
            }
        });
    };


});
</script>

<title>세광청년부 : 출석</title>
</head>
<body>

<div class="container">

    <div class="row">
        <table class="table-total-count" style="border: 1px solid black ; float: left;">
            <tr>
                <td>출석</td>
                <td>00명 / ${vaiilage}명</td>
            </tr>
        </table>
        <form id="calendarForm">
            <input type='text'
                   id ="attendance-date"
                   class="datepicker-here attendance-datepicker"
                   data-position="bottom left"
                   data-language='ko'/>
            <input type="button" value="조회" />
        </form>
    </div>

    <div class="row">

        <div class="div-villages">

            <c:forEach var="village" items="${attendance.villageList}">
            <table class="table-village" style="border: 1px solid black ; float: left;">
                <tr>
                    <td colspan="2" class="village-name">
                        ${village.villageName}
                    </td>
                </tr>
                <c:forEach var="member" items="${village.villageMember}">
                <tr>
                    <td><span>${member.MEMBER_NAME}</span></td>
                    <td>
                        <span>
                            <input id="${member.MEMBER_SEQ}"
                                   class="attendance-checkbox"
                                   type="checkbox"
                                   village_seq="${village.villageSeq}"
                                   ${member.ATTENDANCE_YN eq "Y" ? "checked" : " "}>
                        </span>
                    </td>
                </tr>
                </c:forEach>
                <tr>
                    <td colspan="2">
                        ${village.attendanceCount} / ${fn:length(village.villageMember)}명
                    </td>
                </tr>
            </table>
            </c:forEach>
        </div><!-- div-villages -->

    </div> <!-- row -->

<div>



<jsp:include page="/WEB-INF/views/include/layoutBottom.jsp" flush="true" />