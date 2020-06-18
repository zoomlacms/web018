﻿<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_UnionNode, App_Web_ycgjkfed" masterpagefile="~/Manage/I/Default.master" debug="true" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>节点合并迁移</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table width="100%" border="0" cellpadding="5" cellspacing="1" class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td colspan="3">批量设置节点</td>
        </tr>
        <tr>
            <td valign="top" align="center">
                <span style="color: Red">提示：源节点</span><br />
                <br />
                <asp:ListBox ID="LstNodes" CssClass="form-control" runat="server" DataTextField="NodeName" DataValueField="NodeId" Height="282px" Width="307px" SelectionMode="Multiple"></asp:ListBox>
            </td>
            <td>&nbsp;</td>
            <td valign="top" align="center">

                <span style="color: Red">提示：目标节点</span><br />
                <br />
                <asp:ListBox ID="MainNode" CssClass="form-control" runat="server" Width="307px" Height="282px"></asp:ListBox>

            </td>
        </tr>
        <tr>
            <td valign="top" align="left" colspan="3">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="合并后删除来源节点" />
            </td>
        </tr>
        <tr align="center">
            <td colspan="3">
                <asp:Button ID="EBtnBacthSet" Text="合并节点" class="btn btn-primary" OnClick="EBtnBacthSet_Click" runat="server" OnClientClick="return confirm('此操作不可逆，你确定合并节点吗？')" />&nbsp;&nbsp;
            <asp:Button ID="Button1" Text="迁移节点" class="btn btn-primary" runat="server" OnClick="Button1_Click" OnClientClick="return confirm('此操作不可逆，你确定迁移节点吗？')" />
            </td>
        </tr>
    </table>
    <script src="/JS/Common.js" type="text/javascript"></script>
    <script language="JavaScript" type="text/JavaScript">
        var tID = 0;
        var arrTabTitle = new Array("TabTitle0", "TabTitle1", "TabTitle2");
        var arrTabs = new Array("Tabs0", "Tabs1", "Tabs2");
        function ShowTabs(ID)
        {
            if (ID != tID)
            {
                document.getElementById(arrTabTitle[tID].toString()).className = "tabtitle";
                document.getElementById(arrTabTitle[ID].toString()).className = "titlemouseover";
                document.getElementById(arrTabs[tID].toString()).style.display = "none";
                document.getElementById(arrTabs[ID].toString()).style.display = "";
                tID = ID;
            }
        }
        function SelectAll()
        {
            for (var i = 0; i < document.getElementById('<%=LstNodes.ClientID%>').length; i++)
            {
                document.getElementById('<%=LstNodes.ClientID%>').options[i].selected = true;
            }
        }
        function UnSelectAll()
        {
            for (var i = 0; i < document.getElementById('<%=LstNodes.ClientID%>').length; i++)
            {
                document.getElementById('<%=LstNodes.ClientID%>').options[i].selected = false;
            }
        }
    </script>
</asp:Content>