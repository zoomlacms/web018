﻿<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.CategotySale, App_Web_h5mbsos1" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <title>商品类别销售排名</title>

    <link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
    <link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
    
    <div class="r_navigation">
		
	  <span>后台管理</span> &gt;&gt; <span>商城管理</span> &gt;&gt; <span>销售统计</span> &gt;&gt; 商品类别销售排名
    </div>
    <div class="clearbox"></div>
    <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;" id="TABLE1">
      <tr align="center">
        <td width="33%" class="title">
            分类ID</td>
        <td width="33%" class="title">
            产品分类</td>
        <td width="33%" class="title">
            总销量</td>
        
      </tr>
      
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
              <tr class="">
        <td height="22" class="tdbg" align=center>
            <%#Eval("NodeID", "{0}")%></td>
        <td height="22" class="tdbg" align=center><%#Eval("NodeName")%></td>
        <td height="22" class="tdbg" align=center><%#getnum(Eval("NodeID","{0}"))%></td>
      </tr>
      </ItemTemplate>
        </asp:Repeater>
              <tr class="tdbg">
<td height="22" colspan="10" align="center" class="tdbgleft">共 <asp:Label ID="Allnum" runat="server" Text=""></asp:Label> 条记录  <asp:Label ID="Toppage" runat="server" Text="" /> <asp:Label ID="Nextpage" runat="server" Text="" /> <asp:Label ID="Downpage" runat="server" Text="" /> <asp:Label ID="Endpage" runat="server" Text="" />  页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页  <asp:Label ID="pagess" runat="server" Text="" />条记录/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
              </asp:DropDownList>页</td>
        </tr>
    </table>
    <div align="center">
    </div>

</form>
</body>
</html>
