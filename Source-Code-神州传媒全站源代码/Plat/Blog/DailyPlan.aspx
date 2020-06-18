<%@ page language="C#" autoeventwireup="true" inherits="Plat_Blog_DailyPlan, App_Web_dhogkoqw" masterpagefile="~/Plat/Main.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
    <title>日程管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="tbody">
	<div class="thead">
    	<span class="glyphicon glyphicon-calendar" style="color:#06F; font-size:28px; margin-top:10px; margin-left:10px;"><a href="#" style=" color:#06F;font-size:20px; line-height:10px; ">日程中心</a></span>
        </div>
        <div class="menu">
        	<ul>
            	<li title="查看其它同事日程"><a href="#">查看其它同事日程 <span class="glyphicon glyphicon-chevron-down" style=" color:#09F"></span></a></li>
                <li title="同步日程"><a href="#"><span class="glyphicon glyphicon-refresh" style="color:#09F;"></span> 同步日程</a></li>
                <li title="未确定日程"><a href="#">未确认日程</a></li>
                <li><input type="button" value="创建新日程"  style="border:none; background:#09F; color:#FFF; border-radius:10px; height:30px; width:100px; float:right; margin-left:330px;"/></li>
            </ul>
        </div> 
        <div class="content">
        	<span style=" display:inline-block;padding:3px 11px;padding-top:4px; padding-bottom:2px;margin-bottom:0px;font-size:12px;line-height:20px;border:1px solid #ccc;float:left;cursor:pointer; margin-left:30px; border-radius:3px;">今天</span>
            <button  type="button" onmouseout="this.style.backgroundColor='#FFF'" onmouseover="this.style.backgroundColor='#CCC'" style="width:30px; height:28px; border:1px solid #CCC; border-top-left-radius:3px; border-bottom-left-radius:3px; background:#FFF; margin-left:20px;">
            <span class="glyphicon glyphicon-chevron-left"  style="color:#000"></span>
            </button>
          <button type="button"  onmouseout="this.style.backgroundColor='#FFF'" onmouseover="this.style.backgroundColor='#CCC'" style="width:30px; height:28px; border:1px solid #CCC; border-top-right-radius:3px; border-bottom-right-radius:3px; background:#FFF;margin-left:-5px;">
            <span class="glyphicon glyphicon-chevron-right"  style="color:#000"></span>
            </button>
          <span style="font-size:18px;">2014年09月23日(星期二)</span>
          <button onmouseout="this.style.backgroundColor='#FFF'" onmouseover="this.style.backgroundColor='#CCC'" style=" width:40px; height:30px; border:1px solid #CCC; border-top-left-radius:3px; border-bottom-left-radius:3px; background:#FFF; margin-left:280px;">天</button>
          <button onmouseout="this.style.backgroundColor='#FFF'" onmouseover="this.style.backgroundColor='#CCC'" style=" width:40px; height:30px; border:1px solid #CCC; background:#FFF; margin-left:-5px;">周</button>
          <button onmouseout="this.style.backgroundColor='#FFF'" onmouseover="this.style.backgroundColor='#CCC'" style=" width:40px; height:30px; border:1px solid #CCC; border-top-right-radius:3px; border-bottom-right-radius:3px;margin-left:-5px; background:#FFF;">月</button>
          <button onmouseout="this.style.backgroundColor='#FFF'" onmouseover="this.style.backgroundColor='#CCC'" style=" width:40px; height:30px; border:1px solid #CCC; border-top-left-radius:3px; border-bottom-left-radius:3px;margin-left:-5px;background:#FFF;">列表</button>
          <input type="text" disabled="disabled"  style="width:550px; height:30px; border:1px solid #CCC; margin-left:75px; margin-top:55px; text-align:center" value="8月25日 周一"  readonly="readonly" />
          <input type="text"  readonly="readonly"  style="background:#FFC;width:550px; height:30px; border:1px solid  #CCC; margin-left:0px; border-top:none; margin-top:0px;" />
         <span style="float:left; margin-left:26px;">全天事件 </span> <div style=" width:600px;height:400px;overflow-y:scroll; margin-left:41px; ">
         <table>
         	<tr>
         	  <td width="33" height="50"  rowspan="2">8:00</td><td width="556" height="25"   style=" background:#FFC;border:1px solid #CCC; border-bottom:none;"></td>
            </tr>
            <tr>
            <td width="566" height="25"  style=" background:#FFC;border:1px solid #CCC;border-top:dashed 1px #CCC;"></td>
            </tr>
            
            <tr>
              <td height="30" rowspan="2">9:00</td><td width="566" height="25"  style=" background:#FFC;border:1px solid #CCC; border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">10:00</td><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">11:00</td><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">12:00</td><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">13:00</td><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td width="33" height="30" rowspan="2">14:00</td><td width="566" height="25"   style=" background:#FFC;border:1px solid #FC3;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC;border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">15:00</td><td width="566" height="25"  style=" background:#FFC;border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">16:00</td><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;"></td></tr>
            <tr>
           <td height="30" rowspan="2">17:00</td><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
            <td height="30" rowspan="2">18:00</td><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
            <td height="30" rowspan="2">19:00</td><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            
            <tr>
         	  <td width="33" height="30"  rowspan="2">8:00</td><td width="556" height="25"   style=" background:#FFC;border:1px solid #CCC; border-bottom:none;"></td>
            </tr>
            <tr>
            <td width="566" height="25"  style=" background:#FFC;border:1px solid #CCC;border-top:dashed 1px #CCC;"></td>
            </tr>
            
            <tr>
              <td height="30" rowspan="2">9:00</td><td width="566" height="25"  style=" background:#FFC;border:1px solid #CCC; border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">10:00</td><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">11:00</td><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">12:00</td><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">13:00</td><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td width="33" height="30" rowspan="2">14:00</td><td width="566" height="25"   style=" background:#FFC;border:1px solid #FC3;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC;border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">15:00</td><td width="566" height="25"  style=" background:#FFC;border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">16:00</td><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;"></td></tr>
            <tr>
           <td height="30" rowspan="2">17:00</td><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">18:00</td><td width="566" height="25"  style=" background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
            <tr>
              <td height="30" rowspan="2">19:00</td><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-bottom:none;"></td></tr>
            <tr><td width="566" height="25"  style="  background:#FFC; border:1px solid #CCC;border-top:dashed 1px #CCC;"></td></tr>
         </table>
         </div>
        </div>
    </div>
    
    <div class="add">
    	<div class="add_head">
        	<input type="text" value=" 创建新的日程" readonly="readonly"  style=" border:0px;border-left:#0066CC 3px solid; margin:10px 10px; font-size:18px; " />
            
            <span class="glyphicon glyphicon-remove" style="color:#999; float:right; margin:10px 10px;"></span>
        <div class="content">
        	<span class="name_s">日程名称</span><input type="text" class="name" />
            
            <p><span class="name_d">起止日期</span><span class="name_d">2014-08-25</span><span class="name_d">00:30</span><span class="name_d">至</span><span class="name_d">2014-08-26</span><span class="name_d">01:30</span></p>
            <P><input class="ck" type="checkbox" /> 全天事件<input class="ck" type="checkbox" /> 重复</p>
            <p><span class="name_p">地点</span><input type="text" class="place" placeholder="暂无!!" /></p>
            <P><span class="join_p">参加成员</span><span><a href="#" class="add_p">添加成员</a></span></P>
            <p class="name_s"><a href="#">添加日程详情</a></p>
             <P class="chance"><input class="chance" type="checkbox" /> 私密日程</P><p class="chance"><input class="chance" type="checkbox" /> 分享到动态更新</p>
             <br />
             <p><span class="lose"><a href="#">取消</a></span><input type="button" class="btn_add" value="创建日程" /></p>
        </div>
        </div>
        <hr style="color:#EFEFEF;" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
*{ margin:0px; padding:0px;}
.tbody{ width:815px; height:712px; border:1px solid #09F; margin:auto}
.thead{ width:815px; height:52px; background:#0CF;}
.menu{ width:815px; height:86px; border:1px solid #0CF;}
.menu ul{list-style:none; }
.menu ul li{ float: left; margin-left:25px; margin-top:38px; height:60px;}
.menu ul li a{font-size:12px;}
.content{ width:815px; height:646px;}
.add{ width:592px; height:452px; border:1px solid #004F9E; color:#CCC; display:none;}
.add add_head{ width:592px; height:53px;}
.add content{ width:590px; height:399px;}
.name_s{ margin-left:20px;font-size:14px;}
.name_p{margin-left:50px;font-size:14px;}
.name_d{font-size:14px; margin-left:20px;line-height:60px;}
.name{ width:460px; height:36px; border:1px solid #0066CC; border-radius:5px; margin-left:20px;}
.join_p{margin-left:20px;font-size:14px;}
.lose{font-size:14px;margin-left:380px;}
.add_p{margin-left:10px;font-size:14px;}
.place{width:460px; height:36px; border:1px solid #CCC; margin-left:20px; border-radius:5px;}
.btn_add{margin-left:20px; border:none; background:#0066CC; width:75px; height:30px; color:#FFF; border-radius:3px;}
.content p .ck{ margin-left:20px;;}
.chance{margin-left:20px;}
a{ text-decoration:none;}
</style>
</asp:Content>