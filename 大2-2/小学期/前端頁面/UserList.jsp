<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".click").click(function () {
                $(".tip").fadeIn(200);
            });

            $(".tiptop a").click(function () {
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function () {
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function () {
                $(".tip").fadeOut(100);
            });

        });
    </script>
</head>


<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">数据表</a></li>
        <li><a href="#">用户列表</a></li>
    </ul>
</div>

<div class="rightinfo">

    <div class="tools">

        <ul class="toolbar">
            <li class="click"><span><img src="images/t01.png" /></span>添加</li>
            <li class="click"><span><img src="images/t02.png" /></span>修改</li>
            <li><span><img src="images/t03.png" /></span>删除</li>
            <li><span><img src="images/t04.png" /></span>统计</li>
        </ul>
        <ul class="toolbar1">
            <li><span><img src="images/t05.png" /></span>设置</li>
        </ul>

    </div>


    <table class="tablelist" style="text-align: center; width: 100%">
        <thead>
        <tr>
            <th><input name="" type="checkbox" value="" checked="checked" /></th>
            <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
            <th>用户名</th>
            <th>密码</th>
            <th>权限</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <tr>
            <td><input name="" type="checkbox" value="" /></td>
            <td>1</td>
            <td>2</td>
            <td><input readonly="readonly" type="password" value="123"></td>
            <td>3</td>
            <td>
                <a name="deletUser" href="" class="tablelink"> 删除</a>
                <a href="" class="tablelink"> 修改</a>
            </td>
        </tr>



        <form action="" method="post">

        <thead>
        <tr id="showtr"
            style=" display:none; text-align: center;border:2px; solid: #378888; background-color:green">
            <td><input name="" type="checkbox" value="" /></td>
            <td>6</td>
            <td><input type="text" name="username" id="username"
                       style="width: 90%;height:30px;border:0.5px; solid: #378888;"></td>
            <td><input type="text" name="password" id="password"
                       style="width:90%;height:30px;border:0.5px ;solid :#378888;"></td>
            <td>
                <input type="hidden" name="userid" id="userid">
                <select name="uroot" id="uroot">
                    <option value="0">管理员</option>
                    <option value="1">老师</option>
                    <option value="2">学生</option>
                </select>
            </td>
            <td>
                <input type="submit" value="确定">
            </td>
        </tr>
        </thead>
        </form>
        </tbody>
    </table>


    <div class="pagin">
        <div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
            <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
            <li class="paginItem"><a href="javascript:;">1</a></li>
            <li class="paginItem current"><a href="javascript:;">2</a></li>
            <li class="paginItem"><a href="javascript:;">3</a></li>
            <li class="paginItem"><a href="javascript:;">4</a></li>
            <li class="paginItem"><a href="javascript:;">5</a></li>
            <li class="paginItem more"><a href="javascript:;">...</a></li>
            <li class="paginItem"><a href="javascript:;">10</a></li>
            <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>


    <div class="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>

        <div class="tipinfo">
            <span><img src="images/ticon.png" /></span>
            <div class="tipright">
                <p>是否确认对信息的修改 ？</p>
                <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>
        <div class="tipbtn">
            <input name="" type="button" class="sure" value="确定" />&nbsp;
            <input name="" type="button" class="cancel" value="取消" />
        </div>

    </div>

</div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>

</body>

</html>