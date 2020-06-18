<%@ page language="C#" autoeventwireup="true" inherits="manage_Zone_ZoneConfig, App_Web_0tfzajrd" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>会员空间配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td width="24%" align="center">空间申请是否需要经过审核：</td>
                <td width="76%" valign="middle">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="保存" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
