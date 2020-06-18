<%@ page language="C#" autoeventwireup="true" inherits="Plat_Task_TaskDetail, App_Web_4qrh5pqi" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<style>
*{ margin:0px; padding:0px;}
.body{ width:540px; height:950px;margin:auto; }
.head{ width:100%; background:url(../iamge/head.jpg) repeat-x left; }
.headSpan{margin-left:20px;}
.head a{color:white;}
.content1{ width:540px; height:180px; border:1px solid #FFF;}
.content1_top{ width:540px; height:72px; border:1px solid #FFF ; text-align: center}
.content1_top_kuang{ border:1px #CCCCCC solid; border-radius:2px;  width:26px; height:26px; margin-top:25px; margin-left:35px;}
.content1_top p{ margin-left:-320px; margin-top:-20px;}
.content1_center{ border:1px #CCCCCC dashed; margin:auto; width:480px; height:33px; border-radius:4px;}
.content1_bottom{  width:540px; height:71px; border:1px  none}
.content1_bottom p a{font-size:12px; color:#06F; padding-top:30px ; margin-left:35px; }
.cut{ border:#06F solid 1px; width:498px;}
.content2{ width:540px; height:220px; border:1px solid #FFF; background:url(../iamge/Content2.jpg) no-repeat left;}
.content2 ul{ list-style:none; margin-top:18px; margin-left:50px;}
.content2 ul li{ line-height:44px;}
.content2 ul li a{ color:#333;}
.content2 ul li span{ font-size:12px; margin-left:10px; margin-top:-3px;}
.data{ margin-left:176px;}
.content3{ width:540px; height:147px; border:1px solid #FFF; background:url(../iamge/Content3.jpg) left no-repeat}
.content1_center p{ font-size:12px; color:#999; margin-top:10px;margin-left:5px; }
.content3 p{ margin-left:73px; margin-top:48px;}
.content3_center{ border:1px #CCCCCC solid; margin:auto; width:480px; height:33px; border-radius:4px; margin-top:10px; line-height:33px;}
.content3_center a{font-size: 12px;color: #999;margin-left: 5px;}
.wei{ font-size:8px;}
.with_my{margin-left:120px;}
.task{margin-left:50px}
.down_menu p a{ margin-left:21px;}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="head">
        <span class="headSpan">
            <span class="colorSpan" style="background-color: #3bb3ff;border:1px solid #0084ff;float:none;position:relative;bottom:-4px; height:20px;width:20px;"></span>
            <span><a href="#">标记颜色</a></span>
        </span>
        <span class="headSpan">
            <span class="glyphicon glyphicon-user topIcon"></span>
            <span><a href="#">锁定任务</a></span>
        </span>
        <span class="headSpan">
            <span class="glyphicon glyphicon-envelope topIcon"></span>
            <span><a href="#">更多操作</a></span>
        </span>
        <span style="margin-left:200px;">
            <span class="glyphicon glyphicon-refresh" title="刷新" style="font-size:1.5em;margin-right:20px;cursor:pointer;"></span>
            <span class="glyphicon glyphicon-remove" title="关闭" style="font-size: 1.5em; margin-right: 20px; cursor: pointer;" onclick="HideTaskDiv();"></span>
        </span>
    </div>
        <div class="body">
	            <div class="content1">
    	            <div class="content1_top"><div class="content1_top_kuang" title="标记为已完成"></div><p><%:taskMod.TaskName %></p> </div>
    	            <div class="content1_center"><p>
                        <%:taskMod.TaskContent %>
    	                                         </p></div>
                    <div class="content1_bottom"><p><br /><br /><a href="#">添加分类标签</a></p></div>
                </div>
  
                <hr class="cut" />
                <div class="content2">
     	            <ul>
    		            <li><a href="#">关联项目</a></li>
    		            <li><a href="#"><%:GetUName(taskMod.LeaderIDS) %></a><a  class="data"href="#">到期日期</a><span><%:taskMod.EndTime.ToString("yyyy年MM月dd日 HH:mm") %></span></li>
    		            <li><a href="#"><%:GetUName(taskMod.PartTakeIDS) %></a></li>
    		            <li><a href="#">母任务</a></li>
    	            </ul>
                </div>
                <hr class="cut" />
                <div class="content3">
    	            <p>任务分解</p>
    	            <div class="content3_center"><a href="#">+创建子任务</a></div>
                </div>
                <hr class="cut" />
            <div class="down_menu">
                <p style="margin-left:30px;"><span class="glyphicon glyphicon-list" style="color:#06F; font-size:22px;"></span><span style=" margin-left:30px;">任务讨论</span><a href="#">任务日志</a><span class="task"><a href="#"><span class="glyphicon glyphicon-book" style=" color:#06F;"></span>任务附件</a></span><span class="with_my"><a href="#">与我有关(0)</a></span></p>
                <span class="glyphicon glyphicon-user" style="color:#666; font-size:22px; margin-left:30px; margin-top:35px;"></span><span style=" margin-left:340px;"><input type="checkbox" style="color:#CCC; font-size:12px;" />暂不接受任务讨论和提醒</span>
                <textarea style="border:1px solid #CCC; width:500px; height:30px; margin-left:30px; border-radius:5px;" placeholder="参与任务讨论"></textarea>
                <p style=" text-align:center; font-size:22px; color:#CCC;">暂无讨论信息</p>
                <P style="text-align:center;color:#CCC;"">讨论的意义在于向团队只会，备忘和展示消息</P>
                <div>
                   
                </div>
            </div>
            </div>
    </form>
</body>
</html>
