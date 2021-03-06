﻿<%@ page language="C#" autoeventwireup="true" enableviewstatemac="false" inherits="ZoomLa.WebSite.Manage.Template.SelectTemplate, App_Web_erkfduyt" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
<title>选择模板</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div>
<table width="100%">
    <tr>
		<td align="left">
			当前目录：<asp:Label ID="lblDir" runat="server" Text="Label"></asp:Label>
		</td>
		<td align="right">↑<asp:Literal ID="LitParentDirLink" runat="server"></asp:Literal>
        </td>
	</tr>
</table>
<div style="width: 100%; height: 200px;">
        <asp:Repeater ID="RepFiles" runat="server" OnItemDataBound="RepFiles_ItemDataBound">
            <ItemTemplate>
                <%#  System.Convert.ToInt32(Eval("type")) == 1 ? "<img src=\"/App_Themes/AdminDefaultTheme/Images/Node/closefolder.gif\" style=border-right: 0px; border-top: 0px;border-left: 0px; border-bottom: 0px />" : "<img src=\"/App_Themes/AdminDefaultTheme/Images/Node/singlepage.gif\" style=border-right: 0px; border-top: 0px;border-left: 0px; border-bottom: 0px />"%>
                <a href="#" onclick="<%#  System.Convert.ToInt32(Eval("type")) == 1 ?"openfilesdir('" + Eval("Name") + "')":"add('" + Eval("Name") + "')"%>">
                    <%# Eval("Name")%>
                </a>
                <br />
            </ItemTemplate>
        </asp:Repeater>
        <asp:HiddenField ID="HdnFileText" runat="server" />
    </div>
</div>
</form>
<script type="text/javascript">
function add(obj)
{
    if(obj==""){return false;}
    var s = document.getElementById('HdnFileText').value + "\/" + obj;
    parent.document.getElementById('FileName').value = s.substring(1);
}
function openfilesdir(obj)
{
    if(obj==""){return false;}
    var pathtext="<%=Server.UrlEncode(Request.QueryString["FilesDir"]) %>";
    parent.document.getElementById('ParentDirText').value = pathtext;
    var path="SelectTemplate.aspx?FilesDir="+pathtext+"/"+escape(obj);
    parent.document.getElementById('main_right').src=path;
}
</script>
</body>
</html>
