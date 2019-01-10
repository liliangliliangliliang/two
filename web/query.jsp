<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=request.getContextPath()%>/"/>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@include file="layUI.jsp"%>
    <script type="text/javascript" src="jquery-2.1.0.js"></script>
    <script>

        $(function () {
            $("table tr:even").css("background","red");
        })


    </script>
    <script>
        function del(i) {
            $.ajax({
                url:"doMem",
                data:"action=DelById&id="+i,
                type:"post",
                dataType:"text",
                success:function (i) {
                    if(i==1){
                        location="doMem?action=queryAll&pageNumber=1&a=1";
                    }else if(i==2){
                        location="doMem?action=queryAll&pageNumber=1&a=2";
                    }
                }
            })
        }
    </script>

</head>
<body>
<form action="doMem?action=queryAll&pageNumber=1" method="post" >
    <input class="layui-btn" type="submit" value="查询所有会员">
</form>
<form action="doMem?action=queryOne" method="post" >
    <input type="text" name="mname">
    <input class="layui-btn" type="submit" value="查询单个会员">
</form>

<c:choose>
    <c:when test="${not empty Page}">
        <label style="color: red">${err}</label>
        <table width="100%" style="text-align: center" class="layui-table">
            <tr style="background-color: royalblue"><th colspan="7" >俱乐部会员信息</th></tr>
            <tr>
                <th>ID</th>
                <th>会员姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>地址</th>
                <th>Email</th>
                <th >操作</th>
            </tr>
            <c:forEach items="${Page}" var="mem" >
                <tr>
                    <td><a class="layui-btn" href="doMem?action=QueryById&id=${mem.id}">${mem.id}</a></td>
                    <td>${mem.mname}</td>
                    <td>${mem.mgender}</td>
                    <td>${mem.mage}</td>
                    <td>${mem.maddress}</td>
                    <td>${mem.memail}</td>
                    <td class="layui-btn" name="aaa" onclick="del(${mem.id})" > 删除 </td>
                   <%-- <td><a class="layui-btn" href="doMem?action=DelById&id=${mem.id}">删除</a></td>--%>
                </tr>
            </c:forEach>
          <%--  <tr>
                <td colspan="7">
                    <%@include file="Page.jsp"%>
                </td>
            </tr>--%>
        </table>
    </c:when>
</c:choose>

</body>
</html>
