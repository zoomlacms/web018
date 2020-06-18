﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Site_AdminLogin, App_Web_5mkcq5mn" masterpagefile="~/manage/Site/SiteMaster.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title><%=Call.SiteName%>_控制中心</title>
<link rel="stylesheet" href="/Plugins/Domain/css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="/Plugins/Domain/css/css.css" type="text/css" />
<link href="/App_Themes/ICMS/V3.css" rel="stylesheet" type="text/css" />
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/Plugins/Domain/Site.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<style type="text/css">
#site_nav .site08 a{ background:url(../../App_Themes/AdminDefaultTheme/images/site/menu_cur.png) left no-repeat;}
#inflUL li {padding-top:8px;}
#nav_site{background:none; top:-10px;}
.selectbox li { display:block;float:left;color:#f00;text-align:left;width:85px;line-height:215%;}
.cdnsBody {display:none; }
#reBtn {border:3px solid #666;border-radius:10px;width:375px;height:68px;font-size:30px;margin-right:100px;text-align:center;background:url(/App_Themes/AdminDefaultTheme/images/Site/siteBtnBG.jpg) repeat-y; text-align:right;}
#reBtn:hover {color:white;border:3px solid #0157B5;}
</style>
<script type="text/javascript">
function disBody(obj,id)
{
    $(obj).addClass("active").siblings().removeClass("active");
    $("#tabBody" + id).parent().find(".tabBody").hide();
    $("#tabBody" + id).show();
}
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pageContent">
<div class="Site_box">
<div id="m_site">
<p><a href="Default.aspx">站群中心</a> >> 全局配置   </p>
</div>
<div id="site_main" style="padding-bottom:0;">
    <span runat="server" id="remind" style="color:red;" />
    <div id="editDiv">
        <ul style="margin-bottom:0;"><li><input type="button" value="编辑" onclick="dis('tab4');" class="site_button"/></li></ul>
    </div>
    <div id="tab4" style="width:98%;display:none;">
        <div style="width:50%;">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab0" data-toggle="tab" onclick="disBody(this,0)">基本设置</a></li>
            <li><a href="#tab1" data-toggle="tab" onclick="disBody(this,1)">智能建站</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab0">
                <table style="float:left; width:100%;" class="site_border">
                 <tbody id="tabBody0" class="tabBody">
            <tr><td style="padding-left:20px;">超级管理员用户：</td><td><asp:TextBox runat="server" ID="adminName"  autocomplete="off"/></td></tr>
            <tr><td style="padding-left:20px;">超级管理员密码：</td><td>
                <asp:TextBox runat="server" ID="adminPasswd"  TextMode="Password" autocomplete="off" CssClass="site_input"/>
                <asp:Button runat="server" ID="chkBtn" Text="校验用户" OnClick="chkBtn_Click" style="margin-left:2px;"/>
                <asp:Button runat="server" ID="logBtn" Text="保存用户" OnClick="logBtn_Click" style="margin-left:2px;"/>
            </td></tr>
            <tr><td style="padding-left:20px;">预设 站 点 URL：</td><td><asp:TextBox runat="server" ID="defaultIP" /></td></tr>
            <tr><td style="padding-left:20px;">模型ID</td><td><asp:TextBox runat="server" ID="modelIDT"/>&nbsp;&nbsp;<span style="color:green">注:IDC商城所绑定的模型ID</span></td></tr>
            <tr><td style="padding-left:20px;">商 城 节 点：</td><td><asp:TextBox runat="server" ID="nodeIDT"/>&nbsp;&nbsp;<span style="color:green">注:IDC商城所绑定的节点ID</span></td></tr>
            <tr><td style="padding-left:20px;">新网代理用户：</td><td><asp:TextBox runat="server" ID="newNetClientID" />&nbsp;&nbsp;<span style="color:green;">注:以agent开头的用户</span></td></tr>
            <tr><td style="padding-left:20px;">新网API密码：</td><td><asp:TextBox runat="server" ID="newNetApiPasswd" TextMode="Password"
                onkeypress="if(event.keyCode==13){EnterFunc2();}" autocomplete="off"/>&nbsp;&nbsp;<span style="color:green;">注:在API设置中配置,非登录密码</span></td></tr>
             <tr><td style="padding-left:20px;">DNS：</td>
                 <td><input type="radio" name="dnsOption" value="0" checked="checked" onclick="showDiv(0);"/>新网默认DNS
                     <input type="radio" name="dnsOption" value="1" onclick="showDiv(1);"/>自定义DNS</td></tr>
                <tr><td style="padding-left:20px;">DNS文件输出目录：</td><td><asp:TextBox runat="server" ID="dnsOutputPath" MaxLength="50" /></td></tr>
                <tr class="cdnsBody"><td style="padding-left:20px;">DNS主服务器：</td><td> <asp:TextBox runat="server" ID="dns1" MaxLength="30" /></td></tr>
                <tr class="cdnsBody"><td style="padding-left:20px;">DNS辅服务器：</td><td><asp:TextBox runat="server" ID="dns2" MaxLength="30"  /></td></tr>
                </tbody>
                 <tbody id="tabBody1" style="display:none;" class="tabBody">
              <tr><td style="padding-left:20px;">二级域名：</td><td><asp:TextBox runat="server" ID="tDomNameT" MaxLength="50" /></td></tr>
              <tr><td style="padding-left:20px;">智能建站自动创建数据库：</td><td>
                  <asp:RadioButtonList runat="server" ID="autoCreatedbRadio" RepeatDirection="Horizontal">
                      <asp:ListItem Value="True">是</asp:ListItem>
                      <asp:ListItem Value="False">否</asp:ListItem>
                  </asp:RadioButtonList>注:开启该项,允许用户创建站点时,自动生成对应数据库</td></tr>
              <tr><td style="padding-left:20px;">数据库管理员帐号：</td><td><asp:TextBox runat="server" ID="dbm_NameT" MaxLength="20"  />注:推荐使用SA帐号,或拥有master数据库管理的帐号</td></tr>
              <tr><td style="padding-left:20px;">数据库管理员密码：</td><td><asp:TextBox runat="server" ID="dbm_PasswdT" MaxLength="50" TextMode="Password"  /></td></tr>
            </tbody>
                    <tbody>
                 <tr><td style="padding-left:20px;">操作：</td>
                <td>
                    <asp:Button runat="server" ID="saveBtn4" Text="保存配置" CssClass="leftnone" OnClick="saveBtn4_Click"/>
                    <input type="button" value="取消" style="margin-left:20px;" title="关闭编辑" onclick="dis('editDiv');"/>
                </td>
            </tr>
                    </tbody>
        </table>
            </div>
        </div>
        </div>
		<div class="tab" style="margin-left:2%;">
            <div >
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#Div3" data-toggle="tab">显示</a></li>
                    <li><a href="#Div4" data-toggle="tab">选中</a></li>
                </ul>
                <div class="tab-content selectbox">
                    <div class="tab-pane active" id="Div3">
                        <div class="site_border" style="padding-left:20px;">
                            <p class="checkall0 allcheck"><label for="allChk">全选</label><input type="checkbox" class="allChk" onclick="selectAllByName(this, 'ext100');"/></p>
                            <ul id="Ul3">
                                <li><input type="checkbox" name="ext100" value=".com"    /><label for="e0">.com</label></li>
                                <li><input type="checkbox" name="ext100" value=".net"    /><label for="e1">.net</label></li>
                                <li><input type="checkbox" name="ext100" value=".cn"     /><label for="e2">.cn</label></li>
                                <li><input type="checkbox" name="ext100" value=".com.cn" /><label for="e3">.com.cn</label></li>
                                <li><input type="checkbox" name="ext100" value=".net.cn" /><label for="e4">.net.cn</label></li>
                                <li><input type="checkbox" name="ext100" value=".org.cn" /><label for="e5">.org.cn</label></li>
                                <li><input type="checkbox" name="ext100" value=".org"  /><label for="e6">.org</label></li>
                                <li><input type="checkbox" name="ext100" value=".asia" /><label for="e7">.asia</label></li>
                                <li><input type="checkbox" name="ext100" value=".cc"   /><label for="e8">.cc</label></li>
                                <li><input type="checkbox" name="ext100" value=".biz"  /><label for="e9">.biz</label></li>
                                <li><input type="checkbox" name="ext100" value=".info" /><label for="e10">.info</label></li>
                                <li><input type="checkbox" name="ext100" value=".tv"   /><label for="e11">.tv</label></li>
                                <li><input type="checkbox" name="ext100" value=".tw"   /><label for="e12">.tw</label></li>
                                <li><input type="checkbox" name="ext100" value=".in"   /><label for="e13">.in</label></li>
                                <li><input type="checkbox" name="ext100" value=".me"   /><label for="e14">.me</label></li>
                                <li><input type="checkbox" name="ext100" value=".中国" /><label for="e15">.中国</label></li>
                                <li><input type="checkbox" name="ext100" value=".pw"   /><label for="e16">.pw</label></li>
                                <li><input type="checkbox" name="ext100" value=".公司" /><label for="c17">.公司</label></li>
                                <li><input type="checkbox" name="ext100" value=".网络" /><label for="c18">.网络</label></li>
                            </ul>
                            <p style="display: block; border-top: 1px solid #D5E0EF; width: 99%; *zoom: 1; overflow: hidden; *height: 1px; margin: 20px 0"></p>
                            <p class="checkall1 allcheck"><label for="allChk2">全选</label><input type="checkbox" id="Checkbox3" class="allChk" onclick="selectAllByName(this, 'ext101');"/></p>
                            <ul id="Ul4">
                                <li class="countryli"><input type="checkbox" name="ext101" value=".jl.cn" /><label for="m19">.jl.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".sh.cn" /><label for="m20">.sh.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".qh.cn" /><label for="m21">.qh.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".gx.cn" /><label for="m22">.gx.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".ah.cn" /><label for="m23">.ah.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".sx.cn" /><label for="m24">.sx.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".hk.cn" /><label for="m25">.hk.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".fj.cn" /><label for="m26">.fj.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".xz.cn" /><label for="m27">.xz.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".hb.cn" /><label for="m28">.hb.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".hl.cn" /><label for="m29">.hl.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".tj.cn" /><label for="m30">.tj.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".nx.cn" /><label for="m31">.nx.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".hi.cn" /><label for="m32">.hi.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".jx.cn" /><label for="m33">.jx.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".nm.cn" /><label for="m34">.nm.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".mo.cn" /><label for="m35">.mo.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".ac.cn" /><label for="m36">.ac.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".sn.cn" /><label for="m37">.sn.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".hn.cn" /><label for="m38">.hn.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".js.cn" /><label for="m39">.js.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".cq.cn" /><label for="m40">.cq.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".xj.cn" /><label for="m41">.xj.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".sc.cn" /><label for="m42">.sc.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".sd.cn" /><label for="m43">.sd.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".ln.cn" /><label for="m44">.ln.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".yn.cn" /><label for="m45">.yn.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".bj.cn" /><label for="m46">.bj.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".gs.cn" /><label for="m47">.gs.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".gd.cn" /><label for="m48">.gd.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".zj.cn" /><label for="m49">.zj.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".he.cn" /><label for="m50">.he.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".tw.cn" /><label for="m51">.tw.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".gz.cn" /><label for="m52">.gz.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext101" value=".ha.cn" /><label for="m53">.ha.cn</label></li>
                                <div class="clearfix"></div>
                            </ul><div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="Div4">
                        <div class="site_border" style="padding-left:20px;">
                            <p class="checkall0 allcheck"><label for="allChk">全选</label><input type="checkbox" id="Checkbox1" class="allChk" onclick="selectAllByName(this, 'ext');"/></p>
                            <ul id="Ul1">
                                <li><input type="checkbox" name="ext" value=".com"    /><label for="e0">.com</label></li>
                                <li><input type="checkbox" name="ext" value=".net"    /><label for="e1">.net</label></li>
                                <li><input type="checkbox" name="ext" value=".cn"     /><label for="e2">.cn</label></li>
                                <li><input type="checkbox" name="ext" value=".com.cn" /><label for="e3">.com.cn</label></li>
                                <li><input type="checkbox" name="ext" value=".net.cn" /><label for="e4">.net.cn</label></li>
                                <li><input type="checkbox" name="ext" value=".org.cn" /><label for="e5">.org.cn</label></li>
                                <li><input type="checkbox" name="ext" value=".org"  /><label for="e6">.org</label></li>
                                <li><input type="checkbox" name="ext" value=".asia" /><label for="e7">.asia</label></li>
                                <li><input type="checkbox" name="ext" value=".cc"   /><label for="e8">.cc</label></li>
                                <li><input type="checkbox" name="ext" value=".biz"  /><label for="e9">.biz</label></li>
                                <li><input type="checkbox" name="ext" value=".info" /><label for="e10">.info</label></li>
                                <li><input type="checkbox" name="ext" value=".tv"   /><label for="e11">.tv</label></li>
                                <li><input type="checkbox" name="ext" value=".tw"   /><label for="e12">.tw</label></li>
                                <li><input type="checkbox" name="ext" value=".in"   /><label for="e13">.in</label></li>
                                <li><input type="checkbox" name="ext" value=".me"   /><label for="e14">.me</label></li>
                                <li><input type="checkbox" name="ext" value=".中国" /><label for="e15">.中国</label></li>
                                <li><input type="checkbox" name="ext" value=".pw"   /><label for="e16">.pw</label></li>
                                <li><input type="checkbox" name="ext" value=".公司" /><label for="c17">.公司</label></li>
                                <li><input type="checkbox" name="ext" value=".网络" /><label for="c18">.网络</label></li>
                            </ul>
                            <p style="display: block; border-top: 1px solid #D5E0EF; width: 99%; *zoom: 1; overflow: hidden; *height: 1px; margin: 20px 0"></p>
                            <p class="checkall1 allcheck"><label for="allChk2">全选</label><input type="checkbox" class="allChk" onclick="selectAllByName(this, 'ext2');"/></p>
                            <ul id="Ul2">
                                <li class="countryli"><input type="checkbox" name="ext2" value=".jl.cn" /><label for="m19">.jl.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".sh.cn" /><label for="m20">.sh.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".qh.cn" /><label for="m21">.qh.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".gx.cn" /><label for="m22">.gx.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".ah.cn" /><label for="m23">.ah.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".sx.cn" /><label for="m24">.sx.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".hk.cn" /><label for="m25">.hk.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".fj.cn" /><label for="m26">.fj.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".xz.cn" /><label for="m27">.xz.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".hb.cn" /><label for="m28">.hb.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".hl.cn" /><label for="m29">.hl.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".tj.cn" /><label for="m30">.tj.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".nx.cn" /><label for="m31">.nx.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".hi.cn" /><label for="m32">.hi.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".jx.cn" /><label for="m33">.jx.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".nm.cn" /><label for="m34">.nm.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".mo.cn" /><label for="m35">.mo.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".ac.cn" /><label for="m36">.ac.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".sn.cn" /><label for="m37">.sn.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".hn.cn" /><label for="m38">.hn.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".js.cn" /><label for="m39">.js.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".cq.cn" /><label for="m40">.cq.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".xj.cn" /><label for="m41">.xj.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".sc.cn" /><label for="m42">.sc.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".sd.cn" /><label for="m43">.sd.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".ln.cn" /><label for="m44">.ln.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".yn.cn" /><label for="m45">.yn.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".bj.cn" /><label for="m46">.bj.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".gs.cn" /><label for="m47">.gs.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".gd.cn" /><label for="m48">.gd.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".zj.cn" /><label for="m49">.zj.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".he.cn" /><label for="m50">.he.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".tw.cn" /><label for="m51">.tw.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".gz.cn" /><label for="m52">.gz.cn</label></li>
                                <li class="countryli"><input type="checkbox" name="ext2" value=".ha.cn" /><label for="m53">.ha.cn</label></li><div class="clearfix"></div>
                            </ul><div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="clearfix"></div>
</div>
    <script type="text/javascript">
        $().ready(function () {
            $(":text").addClass("site_input");
            $(":password").addClass("site_input");
            $(":button").addClass("site_button");
            $(":submit").addClass("site_button");
        });
        function EnterFunc2() {
            $("#<%=saveBtn4.ClientID%>").trigger("click");
          }
          //设定值格式:key:value,key2,value:::下同
          function setValue(v) {
              var arr = v.split(",");
              var temp;
              for (i = 0; i < arr.length; i++) {
                  temp = arr[i].split(":");
                  $("#" + temp[0]).val(temp[1]);
              }
          }
        function dis(id)
        {
            $("#" + id).show().siblings("div").hide();
        }
        //DNS
        function showDiv(v) {
            if (v == "0") {
                $(".cdnsBody").hide();
            }
            else {
                $(".cdnsBody").show();
            }
        }
        //设置单选框的默认值
        function setRadio(v) {
            $("input[name='dnsOption'][value='" + v + "']").attr('checked', 'true');
            showDiv(v);
        }
    </script>
    <div style="clear:both;"></div>
    <div id="about" class="site_cont" style="margin-left:1%;">
	<strong>欢迎使用Zoomla!逐浪CMS站群系统！</strong><br/>
Zoomla!逐浪CMS是面向高端用户开放的一代具备虚拟化与IDC标准的网站集群管理系统，在您使用前，需要确定并了解以下信息：<br/>
1、您是否拥有独立的服务器管理权限，从而以方便的接入多个站点管理单元。<br/>
2、您是否熟悉IIS的管理机制，我们的站群系统直接与IIS原生系统对接，托管windows的IIS管理机制并赋予了多项创新功能。<br/>
3、我们能够纳入非Zoomla!逐浪CMS构建的站点，且未来版本中将支持接入任意站点的数据交互，但不对非Zoomla!逐浪CMS站点构建数据安全性给予保障，我们提供免费迁移支持，点此获取逐浪CMS程序包。<br/>
4、如有问题请访问<a href="http://bbs.zoomla.cn" target="_blank">bbs.zoomla.cn</a>开发专区交流，官方微博<a href="http://t.qq.com/wwwwzf" target="_blank">http://t.qq.com/wwwwzf</a>。<br/>
5、推荐使用最低1024*768分辨以及最低IE9版本浏览器（兼容chrome、safri等主流浏览器）。</div>
</div>
    <div style="width:100%;text-align:center;margin-bottom:200px;">
        <input type="button" id="reBtn" value="返回主控站点内容管理" class="btn" title="返回主控站点内容管理" onclick="location='../I/Default.aspx';" /><br />
        <span style="margin-right:360px;"><asp:CheckBox runat="server" ID="dPageChk" AutoPostBack="true" OnCheckedChanged="dPageChk_CheckedChanged"/><label for="<%=dPageChk.ClientID %>" style="position:relative;bottom:-2px;">下次自动略过</label> </span>
        </div>
</asp:Content>