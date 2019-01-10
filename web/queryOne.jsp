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
<form action="doMem?action=queryAll&pageNumber=1" method="post" >
    <input class="layui-btn" type="submit" value="查询所有会员">
</form>

<c:choose>
    <c:when test="${not empty mber}">
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
                <tr>
                    <td><a class="layui-btn" href="doMem?action=QueryById&id=${mber.id}">${mber.id}</a></td>
                    <td>${mber.mname}</td>
                    <td>${mber.mgender}</td>
                    <td>${mber.mage}</td>
                    <td>${mber.maddress}</td>
                    <td>${mber.memail}</td>
                    <td class="layui-btn" name="aaa" onclick="del(${mber.id})" > 删除 </td>
                </tr>
        </table>

    </c:when>
    <c:otherwise>
        <h3>没有这个会员</h3>
    </c:otherwise>
</c:choose>

</body>
</html>
