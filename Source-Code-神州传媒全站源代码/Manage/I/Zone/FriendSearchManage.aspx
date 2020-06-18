<%@ page language="C#" autoeventwireup="true" inherits="manage_Zone_FriendSearchManage, App_Web_0tfzajrd" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>搜索好友管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="2" align="center" class="spacingtitle">搜索好友管理</td>
            </tr>
            <tr>
                <td width="24%" align="center">是否开启婚姻搜索条件：</td>
                <td width="76%">
                    <asp:RadioButton ID="rbSearchFriendMarryTrue" runat="server" GroupName="SearchFriendMarryKey" TabIndex="1" />是
                    <asp:RadioButton ID="rbSearchFriendMarryFalse" runat="server" GroupName="SearchFriendMarryKey" TabIndex="2" />否</td>
            </tr>
            <tr>
                <td align="center">&nbsp;</td>
                <td>&nbsp;<asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" Text="保存" OnClick="btnSubmit_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
