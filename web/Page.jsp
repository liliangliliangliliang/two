<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="layUI.jsp"%>
</head>
<body>
    第<b>${sessionScope.Page.pageNumber}</b>页&nbsp;&nbsp;
    <a class="layui-btn layui-btn-sm" href="${servletURL}&pageNumber=1">首页</a>
    <a class="layui-btn layui-btn-sm" href="${servletURL}&pageNumber=${Page.pageNumber-1>0?Page.pageNumber-1:1}">上一页</a>
    <a class="layui-btn layui-btn-sm" href="${servletURL}&pageNumber=${Page.pageNumber+1<Page.totalPage?Page.pageNumber+1:Page.totalPage }">下一页</a>
    <a class="layui-btn layui-btn-sm" href="${servletURL}&pageNumber=${sessionScope.Page.totalPage}">末页</a>
    &nbsp;&nbsp;共<b>${sessionScope.Page.totalPage}</b>页&nbsp;&nbsp;
    <select id="jump1">
        <c:forEach begin="1" varStatus="tea" end="${Page.totalPage}">
            <option name="op1" value="${tea.count}">第${tea.count}页</option>
        </c:forEach>
    </select> &nbsp;&nbsp;
    <b class="layui-btn layui-btn-sm" onclick="jump()">跳转页面</b>
    <script>
        document.getElementsByName("op1")[${Page.pageNumber-1}].selected=true;
        function jump() {
            var number=document.getElementById("jump1").value;
            location="${servletURL}&pageNumber="+number;
        }
    </script>

</body>
</html>
