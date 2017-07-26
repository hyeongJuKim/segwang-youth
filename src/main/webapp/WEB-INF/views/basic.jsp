<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <tiles:insertAttribute name="header" />
    <title>새광청년공동체</title>
</head>
    <body>


    <tiles:insertAttribute name="leftMenu" />

    <div class="contents">
        <tiles:insertAttribute name="contents" />
    </div>

    <tiles:insertAttribute name="footer" />

    </body>
</html>